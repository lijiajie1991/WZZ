/**
  * @说明 
  * @作者 黎嘉杰 
  * @日期 2016年9月9日 下午12:47:28 
  */
package bean.bill;

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
import exp.BizException;

/**
  * @说明 
  * @作者 黎嘉杰 
  * @日期 2016年9月9日 下午12:47:28 
  */
@WebServlet("/IHttpBill")
public abstract class IHttpBill extends IHttp{
	
	public String getNewNumber(Context ctx) throws Exception
	{
		//创建数据库连接
		Connection conn = null; 
		try {
			conn = ConnectDb.Connect();
			//调用方法保存
			return getNewNumber(ctx, conn);
		} catch (Exception e) {
			e.printStackTrace();
			if(conn != null)
				conn.rollback();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	
	}
	
	public String save(Context ctx, Connection conn, Info model) throws Exception {
		if(model instanceof BillInfo)
		{
			BillInfo info = (BillInfo) model;
			String shopId = info.getShopId();
			if(shopId == null || "".equals(shopId))
				info.setShopId(ctx.getShopId());
			
			String adminShopId = info.getAdminShopId();
			if(adminShopId == null || "".equals(adminShopId))
				info.setAdminShopId(ctx.getAdminShopId());
		}
		
		
		return super.save(ctx, conn, model);
	}
	
	public String getNewNumber(Context ctx, Connection conn) throws Exception
	{
		String clsName = BeanProperties.getProperties(this.getbtStr());
		Info info = (Info) Class.forName(clsName).newInstance();
		BeanTableInfo bt = info.getBT();
		String tbl = bt.getTableName();
		
		QueryRunner qRunner = new QueryRunner();
		String sql = "select max(fnumber) as number from " + tbl + " where fshopId = '" + ctx.getShopId() + "' and (fnumber REGEXP '[^0-9]') = 0";
		List<String> list = qRunner.query(conn, sql.toString(), new ColumnListHandler<String>("number"));
		if(list != null && !list.isEmpty())
		{
			String number = list.get(0);
			if(number != null && !"".equals(number) && !"null".equalsIgnoreCase(number))
			{
				BigDecimal maxSeq = new BigDecimal(number);
				return String.format("%05d", maxSeq.intValue() + 1);
			}
		}
		
		return "00001";
	}
	
	/**
	  * @功能描述 无数据库连接的审核方法
	  * @作者 黎嘉杰 
	  * @日期 2016年8月27日 下午11:38:31 
	  * @参数 
	  * @返回
	  */
	public String setAuditTrue(Context ctx, BillInfo info) throws Exception
	{
		//创建数据库连接
		Connection conn = null; 
		try {
			conn = ConnectDb.Connect();
			//设置为不是自动提交
			conn.setAutoCommit(false);
			
			//调用方法保存
			String id = setAuditTrue(ctx, conn, info);
			//提交
			conn.commit();
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			if(conn != null)
				conn.rollback();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	  * @功能描述 包含数据库连接的方法
	  * @作者 黎嘉杰 
	  * @日期 2016年8月27日 下午11:38:52 
	  * @参数 
	  * @返回
	  */
	public String setAuditTrue(Context ctx, Connection conn, BillInfo info) throws Exception
	{
		verifyToAuditTrue(ctx, conn, info);
		info.setIsAuditTrue(true);
		return super.save(ctx, conn, info);
	}
	
	
	/**
	  * @功能描述 无数据库连接的反审核方法
	  * @作者 黎嘉杰 
	  * @日期 2016年8月27日 下午11:39:39 
	  * @参数 
	  * @返回
	  */
	public String setAuditFalse(Context ctx, BillInfo info) throws Exception
	{
		//创建数据库连接
		Connection conn = ConnectDb.Connect();
		//设置为不是自动提交
		conn.setAutoCommit(false);
		try {
			//调用方法保存
			String id = setAuditFalse(ctx, conn, info);
			//提交
			conn.commit();
			
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	  * @功能描述 有数据库连接的反审核方法
	  * @作者 黎嘉杰 
	  * @日期 2016年8月27日 下午11:39:53 
	  * @参数 
	  * @返回
	  */
	public String setAuditFalse(Context ctx, Connection conn, BillInfo info) throws Exception
	{
		verifyToAuditFalse(ctx, conn, info);
		info.setIsAuditTrue(false);
		return super.save(ctx, conn, info);
	}
	
	
	//----------------------------------以下为校验方法--------------------------------------------------
	/**
	 * @校验是否可以审核， 不可以就抛出异常， 异常信息里包含不能保存的原因
	 * @throws Exception
	 */
	protected void verifyToAuditTrue(Context ctx, Connection conn, BillInfo info) throws Exception
	{
		if(info.getIsAuditTrue())
			throw new BizException("当前单据已确认， 不能再次确认！");
	}
	
	/**
	 * @校验是否可以反审核， 不可以就抛出异常， 异常信息里包含不能保存的原因
	 * @throws Exception
	 */
	protected void verifyToAuditFalse(Context ctx, Connection conn, BillInfo info) throws Exception
	{
		if(!info.getIsAuditTrue())
			throw new BizException("当前单据未确认， 不能改单！");
	}
	
	
	
}
