package report.base.bean;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import bas.sys.menu.MenuInfo;
import bean.IHttp;
import bean.bill.IHttpBill;
import common.db.ConnectDb;
import common.db.Context;
import common.util.BeanUtil;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpRpt")
public abstract class IHttpRpt extends IHttpBill {
       
    /**
     * @see IHttp#IHttp()
     */
    public IHttpRpt() {
        super();
    }
	
	public void delete(Context ctx, Connection conn, String id) throws Exception {
		BeanUtil.deleteBatch(ctx, conn, MenuInfo.class, " frptId = '" + id + "'");
		super.delete(ctx, conn, id);
	}

	public List<Map<String, Object>> getRptData(Context ctx, String sql) throws Exception
	{
		//创建数据库连接
		Connection conn = null; 
		try {
			conn = ConnectDb.Connect();
			//调用方法保存
			return getRptData(ctx, sql, conn);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	}
	
	public List<Map<String, Object>> getRptData(Context ctx, String sql, Connection conn) throws Exception
	{
		QueryRunner qRunner = new QueryRunner();
		List<Map<String, Object>> list = qRunner.query(conn, sql, new MapListHandler());
		return list;
	}
}
