package bean.base;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import bean.IHttp;
import bean.Info;
import common.db.BeanTableInfo;
import common.db.ConnectDb;
import common.db.Context;
import common.properties.BeanProperties;

/**
 * Servlet implementation class IHttp
 */
@WebServlet("/IHttpBase")
public abstract class IHttpBase extends IHttp {
	
	public String getNewNumber(Context ctx) throws Exception
	{
		//创建数据库连接
		Connection conn = null;
		try {
			 conn = ConnectDb.Connect();
			 return getNewNumber(ctx, conn);
		} catch (Exception e) {
			//抛出所有异常
			throw e;
		}finally{
			//无论执行是否成功都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	}
	
	public String getNewNumber(Context ctx, Connection conn) throws Exception
	{
		String clsName = BeanProperties.getProperties(this.getbtStr());
		Info info = (Info) Class.forName(clsName).newInstance();
		BeanTableInfo bt = info.getBT();
		String tbl = bt.getTableName();
		
		QueryRunner qRunner = new QueryRunner();
		String sql = "select max(fnumber) as number from " + tbl + " where fadminshopId = '" + ctx.getAdminShopId()  + "' and (fnumber REGEXP '[^0-9]') = 0";
		List<String> list = qRunner.query(conn, sql.toString(), new ColumnListHandler<String>("number"));
		if(list != null && !list.isEmpty())
		{
			String number = list.get(0);
			if(number != null && !"".equals(number) && !"null".equalsIgnoreCase(number))
			{
				BigDecimal maxSeq = new BigDecimal(number);
				return String.format("%04d", maxSeq.intValue() + 1);
			}
		}
		
		return "0001";
	}

	public String save(Context ctx, Connection conn, Info model) throws Exception {
		if(model instanceof BaseInfo)
		{
			BaseInfo info = (BaseInfo) model;
			String shopId = info.getShopId();
			if(shopId == null || "".equals(shopId))
				info.setShopId(ctx.getShopId());
			
			String adminShopId = info.getAdminShopId();
			if(adminShopId == null || "".equals(adminShopId))
				info.setAdminShopId(ctx.getAdminShopId());
		}
		
		
		return super.save(ctx, conn, model);
	}
	
	
}
