package bas.customer;

import java.sql.Connection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import bean.IHttp;
import bean.Info;
import bean.base.IHttpBase;
import common.db.ConnectDb;
import common.db.Context;
import common.util.BeanUtil;
import exp.BizException;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpCustomer")
public class IHttpCustomer extends IHttpBase {
	protected static IHttpCustomer http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpCustomer() {
        super();
    }
    
    public static IHttpCustomer getInstance()
    {
    	if(http == null)
    		http = new IHttpCustomer();
    	return http;
    }
	
	public String getbtStr() {
		return "0011";
	}

	public String save(Context ctx, Connection conn, Info model) throws Exception {
		CustomerInfo info = (CustomerInfo) model;
		if(info.getId() != null && !"".equals(info.getId()))
		{
			CustomerInfo tempInfo = (CustomerInfo) this.getInfo(conn, info.getId());
			CustomerInfo cInfo = (CustomerInfo) info;
			cInfo.setPoints(tempInfo.getPoints());
			cInfo.setBalance(tempInfo.getBalance());
		}

		return super.save(ctx, conn, info);
	}
	
	public CustomerInfo getCustomerInfo(String cardNumber) throws Exception
    {
		Connection conn = null;
		try{
			conn = ConnectDb.Connect();
			QueryRunner qRunner = new QueryRunner();
			String sql = "select fid from base_customer where fcardId = '" + cardNumber + "'";
			List<String> list = qRunner.query(conn, sql.toString(), new ColumnListHandler<String>("fid"));
			if(list != null && !list.isEmpty())
			{
				String id = list.get(0);
				return (CustomerInfo) BeanUtil.getInfo(CustomerInfo.class, id);
			}
			return null;
		}catch(Exception e)
		{
			throw e;
		}finally
		{
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	
    }

	
	
	protected void verifyToSave(Context ctx, Connection conn, Info model) throws Exception {
		CustomerInfo info = (CustomerInfo) model;
		super.verifyToSave(ctx, conn, info);
		
		String phone = info.getPhone();
		if(phone != null && !"".equals(phone))
		{
			LinkedList<Info> list = this.getInfoList(conn, " a.fphone = '" + phone + "' ", "");
			if(list != null && !list.isEmpty())
			{
				String customerId = info.getId();
				customerId = customerId != null ? customerId : "";
				for(Info itm : list)
				{
					String itmId = itm.getId();
					if(!customerId.equals(itmId))
					{
						throw new BizException("已存在手机号码为" + phone + "的客户， 请检查！");
					}
				}
			}
		}
	}

	
}
