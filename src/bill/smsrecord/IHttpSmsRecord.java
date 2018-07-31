package bill.smsrecord;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;

import bean.IHttp;
import bean.bill.BillInfo;
import bean.bill.IHttpBill;
import common.db.ConnectDb;
import common.db.Context;
import common.util.SmsUtil;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpSmsRecord")
public class IHttpSmsRecord extends IHttpBill {
	protected static IHttpSmsRecord http = null;
       
    /**
     * @see IHttp#IHttp()
     */
    public IHttpSmsRecord() {
        super();
    }
	
	public String getbtStr() {
		return "0031";
	}

	public static IHttpSmsRecord getInstance()
    {
    	if(http == null)
    		http = new IHttpSmsRecord();
    	return http;
    }
	
	public String setAuditTrue(Context ctx, Connection conn, BillInfo model) throws Exception {
		SmsRecordInfo info = (SmsRecordInfo) model;
		String smsNumber = info.getNumber();
		if(smsNumber == null || "".equals(smsNumber)){
			smsNumber = this.getNewNumber(ctx, conn);
			info.setNumber(smsNumber);
		}
		
		
		String[] rs = SmsUtil.sendSms(ctx, conn, info.getPhone(), info.getCtx());
		info.setIsSuccess("Success".equalsIgnoreCase(rs[0]));
		info.setCode(rs[1]);
		info.setCtx(rs[2]);
		
		return super.setAuditTrue(ctx, conn, info);
	}
	
	

    public String smsDetail(String shopId, String dateStr) throws Exception{
    	Connection conn = null;
    	try{
	    	conn = ConnectDb.Connect();
	    	return smsDetail(conn, shopId, dateStr);
	    }catch(Exception e)
		{
			e.printStackTrace();
			if(conn != null)
			{
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
    	
    	return null;
    }
    
    public String smsDetail(Connection conn, String shopId, String dateStr) throws Exception{
    	
		QueryRunner qRunner = new QueryRunner();

		StringBuffer shopSql = new StringBuffer();
		shopSql.append("select \n");
		shopSql.append("sum(s.amt) as amt, \n");
		shopSql.append("s.pt as pt \n");
		shopSql.append("from ( \n");
		shopSql.append("select \n");
		shopSql.append("sum(s.ffactamt) as amt, \n");
		shopSql.append("s.fpt as pt \n");
		shopSql.append("from bill_sale s \n");
		shopSql.append("where s.fisAuditTrue = 1 \n");
		shopSql.append("and s.fshopId = '@shopId' \n");
		shopSql.append("and DATE_FORMAT(s.fbizdate,'%Y-%m-%d') >= '@dateStr' \n");
		shopSql.append("and DATE_FORMAT(s.fbizdate,'%Y-%m-%d') <= '@dateStr' \n");
		shopSql.append("group by s.fpt \n");
		shopSql.append("union all \n");
		shopSql.append("select \n");
		shopSql.append("sum(s.ffactamt) as amt, \n");
		shopSql.append("s.fpt as pt \n");
		shopSql.append("from bill_service s \n");
		shopSql.append("where s.fisAuditTrue = 1 \n");
		shopSql.append("and s.fshopId = '@shopId' \n");
		shopSql.append("and DATE_FORMAT(s.fbizdate,'%Y-%m-%d') >= '@dateStr' \n");
		shopSql.append("and DATE_FORMAT(s.fbizdate,'%Y-%m-%d') <= '@dateStr' \n");
		shopSql.append("group by s.fpt \n");
		shopSql.append(") s \n");
		shopSql.append("group by s.pt \n");
		shopSql.append("order by s.pt \n");
		
		return null;
    }
}
