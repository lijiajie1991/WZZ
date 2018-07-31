package bill.rechargegive;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import bean.IHttp;
import bean.bill.IHttpBill;
import common.db.ConnectDb;
import common.db.Context;
import common.util.BigDecimalUtil;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpRechargeGive")
public class IHttpRechargeGive extends IHttpBill {
	private static final long serialVersionUID = 1L;
	
	protected static IHttpRechargeGive http = null;
     
    /**
     * @see IHttp#IHttp()
     */
    public IHttpRechargeGive() {
        super();
    }
    
    public static IHttpRechargeGive getInstance()
    {
    	if(http == null)
    		http = new IHttpRechargeGive();
    	return http;
    }
	
	public String getbtStr() {
		return "0024";
	}
	
	public BigDecimal getGiveAmt(Context ctx, BigDecimal amt, String dateStr) throws Exception {
		Connection conn = null;
		try {
			conn = ConnectDb.Connect();
			BigDecimal give = getGiveAmt(ctx, conn, amt, dateStr);
			return give;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	}

	public BigDecimal getGiveAmt(Context ctx, Connection conn, BigDecimal amt, String dateStr) throws Exception
	{
		amt = amt != null ? amt : BigDecimal.ZERO;
		if(amt.compareTo(BigDecimal.ZERO) <= 0)
			return BigDecimal.ZERO;
		
		BigDecimal give = BigDecimal.ZERO;
		String shopId = ctx.getShopId();
		String adminShopId = ctx.getAdminShopId();
		
		StringBuffer sql = new StringBuffer();
		sql.append("select \n");
		sql.append("b.famt as amt, \n");
		sql.append("b.fgiveamt as giveamt \n");
		sql.append("from bill_rechargegive a \n");
		sql.append("inner join bill_rechargegive_entry b on a.fid = b.fparentId \n");
		sql.append("where a.fisaudittrue = 1 \n");
		sql.append("and DATE_FORMAT(a.fdatefrom, '%Y-%m-%d') <= '" + dateStr + "' \n");
		sql.append("and DATE_FORMAT(a.fdateto, '%Y-%m-%d') >= '" + dateStr + "' \n");
		sql.append("and (a.fshopId = '" + shopId + "' or a.fshopId = '" + adminShopId + "') \n");
		sql.append("order by b.fgiveamt desc \n");
		
		QueryRunner qRunner = new QueryRunner();
		List<Map<String, Object>> list = qRunner.query(conn, sql.toString(), new MapListHandler());
		for(Map<String, Object> map : list)
		{
			BigDecimal minAmt = BigDecimalUtil.getBigDecimalVal(map.get("amt"));
			BigDecimal giveamt = BigDecimalUtil.getBigDecimalVal(map.get("giveamt"));
			
			while(amt.compareTo(minAmt) >= 0)
			{
				give = give.add(giveamt);
				amt = amt.subtract(minAmt);
			}
		}
		
		return give;

	}
	

}
