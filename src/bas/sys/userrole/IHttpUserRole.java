package bas.sys.userrole;

import java.sql.Connection;
import java.util.HashSet;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import bean.IHttp;
import bean.base.IHttpBase;
import common.db.ConnectDb;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpUserRole")
public class IHttpUserRole extends IHttpBase {
	protected static IHttpUserRole http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpUserRole() {
        super();
    }
    
    public static IHttpUserRole getInstance()
    {
    	if(http == null)
    		http = new IHttpUserRole();
    	return http;
    }
    
    /**
      * @功能描述  获取指定角色的所有UI路径
      * @作者 黎嘉杰 
      * @日期 2016年9月11日 上午1:07:48 
      * @参数 
      * @返回
      */
    public HashSet<String> getRoleUIPermissionSet(String roleId) throws Exception
    {
    	StringBuffer sql = new StringBuffer();
    	sql.append("select \n");
    	sql.append("p.fuipath as uipath \n");
    	sql.append("from base_userrole r \n");
    	sql.append("inner join base_userrole_perentry rp on r.fid = rp.fparentId \n");
    	sql.append("inner join base_permission p on p.fid = rp.fpermissionId \n");
    	sql.append("where p.fpt = 0 \n");
    	sql.append("and r.fid = '" + roleId + "'\n");
    	sql.append("order by p.fnumber");
    	
    	Connection conn = ConnectDb.Connect();
    	QueryRunner qRunner = new QueryRunner();
		List<String> list = qRunner.query(conn, sql.toString(), new ColumnListHandler<String>("uipath"));
    	HashSet<String> perSet = new HashSet<String>();
    	for(String str : list)
    	{
    		if(str != null)
    			perSet.add(str);
    	}
    	
    	return perSet;
    }
    
	
	public String getbtStr() {
		return "0002";
	}

}
