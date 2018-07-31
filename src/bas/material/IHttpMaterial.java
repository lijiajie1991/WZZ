package bas.material;

import java.sql.Connection;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import bean.IHttp;
import bean.base.IHttpBase;
import common.db.ConnectDb;
import common.util.BeanUtil;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpMaterial")
public class IHttpMaterial extends IHttpBase {
	protected static IHttpMaterial http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpMaterial() {
        super();
    }
	
	public String getbtStr() {
		return "0012";
	}
	
	public static IHttpMaterial getInstance()
    {
    	if(http == null)
    		http = new IHttpMaterial();
    	return http;
    }
	
	public MaterialInfo getMaterialInfo(String barcode) throws Exception
    {
		Connection conn = null;
		try{
			conn = ConnectDb.Connect();
			QueryRunner qRunner = new QueryRunner();
			String sql = "select fid from base_material where fbarcode = '" + barcode + "'";
			List<String> list = qRunner.query(conn, sql.toString(), new ColumnListHandler<String>("fid"));
			if(list != null && !list.isEmpty())
			{
				String id = list.get(0);
				return (MaterialInfo) BeanUtil.getInfo(MaterialInfo.class, id);
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
	
}
