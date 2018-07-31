package bas.sys.print;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import bean.base.IHttpBase;
import common.db.ConnectDb;
import common.db.Context;
import common.util.BigDecimalUtil;
import common.util.BooleanUtil;
import em.ShopStatusType;

@WebServlet("/IHttpPrint")
public class IHttpPrint extends IHttpBase {
	private static final long serialVersionUID = 1L;
	protected static IHttpPrint http = null;
	
    public IHttpPrint() {
        super();
    }
    
    public static IHttpPrint getInstance()
    {
    	if(http == null)
    		http = new IHttpPrint();
    	return http;
    }
    
	public String getbtStr() {
		return "0042";
	}
	
	public LinkedList<PrintInfo> getPrintInfoList(Context ctx, String shopId, String clsName) throws Exception
	{
		Connection conn = null;
		try {
			conn = ConnectDb.Connect();
			return getPrintInfoList(ctx, conn, shopId, clsName);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	}
	
	public LinkedList<PrintInfo> getPrintInfoList(Context ctx, Connection conn, String shopId, String clsName)  throws Exception
	{
		LinkedList<PrintInfo> infoList = new LinkedList<PrintInfo>();
		StringBuffer sql = new StringBuffer();
		sql.append("select\n");
		sql.append("p.fid as pId,\n");
		sql.append("p.fname as pName, \n");
		sql.append("p.fprintMethod as pm, \n");
		sql.append("pe.fisdef as isDef \n");
		sql.append("from sys_print p \n");
		sql.append("inner join sys_print_entry pe on p.fid = pe.fparentId \n");
		sql.append("where p.fclsName = '" + clsName + "'\n");
		sql.append("and pe.fshopId = '" + shopId + "'\n");
		sql.append("order by pe.fisdef desc\n");
		
		QueryRunner qRunner = new QueryRunner();
		List<Map<String, Object>> list = qRunner.query(conn, sql.toString(), new MapListHandler());
		int size = list.size();
		for(int index = 0; index < size; index++)
		{
			Map<String, Object> map = list.get(index);
			String pId = (String) map.get("pId");
			String pName = (String) map.get("pName");
			String pm = (String) map.get("pm");
			boolean isDef = BooleanUtil.getBooleanVal( map.get("isDef"));
			
			PrintInfo info = new PrintInfo();
			info.setId(pId);
			info.setName(pName);
			info.setPrintMethod(pm);
			infoList.addLast(info);
			
			if(isDef)
			{
				infoList.clear();
				infoList.addLast(info);
				return infoList;
			}
		}
		
		return infoList;
	}
}
























