package bas.sys.permission;

import java.sql.Connection;
import java.util.LinkedList;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.DbUtils;

import bean.IHttp;
import bean.IHttpSys;
import bean.Info;
import common.db.ConnectDb;
import common.db.Context;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpPermission")
public class IHttpPermission extends IHttpSys {
       
    /**
     * @see IHttp#IHttp()
     */
    public IHttpPermission() {
        super();
    }

	
	public String getbtStr() {
		return "0003";
	}
	
	
	public String save(Context ctx, Connection conn, Info info) throws Exception {
		PermissionInfo pInfo = (PermissionInfo) info;
		PermissionInfo parentInfo = pInfo.getParentInfo();
		if(parentInfo != null && parentInfo.getId() != null)
		{
			parentInfo = (PermissionInfo) this.getInfo(conn, parentInfo.getId());
			String longNumber = parentInfo.getLongnumber() + "!" + pInfo.getNumber();
			pInfo.setLongnumber(longNumber);
			
			String longName = parentInfo.getLongname() + "!" + pInfo.getName();
			pInfo.setLongname(longName);
		}
		else
		{
			pInfo.setLongnumber(pInfo.getNumber());
			pInfo.setLongname(pInfo.getName());
		}
		
		
		return super.save(ctx, conn, pInfo);
	}
	
	public LinkedList<Info> getPermissionList(Context ctx) throws Exception
	{
		//创建数据库连接
		Connection conn = null;
		try {
			 conn = ConnectDb.Connect();
			 return getPermissionList(ctx, conn);
		} catch (Exception e) {
			//抛出所有异常
			throw e;
		}finally{
			//无论执行是否成功都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	
	}
	
	public LinkedList<Info> getPermissionList(Context ctx, Connection conn) throws Exception
	{
		StringBuffer filter = new StringBuffer();
		filter.append("a.fpt <> 1 \n");
		filter.append("or a.fbtnpath in(\n");
		filter.append("select r.fid \n");
		filter.append("from sys_rpt_listrpt r \n");
		filter.append("left join sys_rpt_shop s on s.fparentid = r.fid \n");
		filter.append("where r.fisfree = 1 or s.fshopId = '" + ctx.getShopId() + "')\n");
		
		LinkedList<Info> list = getInfoList(conn, filter.toString(), "a.flongnumber asc");
		
		return list;
	}
	
	
	
	
	
	
	
	
}
