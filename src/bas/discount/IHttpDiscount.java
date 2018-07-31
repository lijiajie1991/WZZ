package bas.discount;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import bean.IHttp;
import bean.base.IHttpBase;
import common.db.ConnectDb;
import common.db.Context;
import common.util.BeanUtil;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpDiscount")
public class IHttpDiscount extends IHttpBase {
	protected static IHttpDiscount http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpDiscount() {
        super();
    }
	
    public static IHttpDiscount getInstance()
    {
    	if(http == null)
    		http = new IHttpDiscount();
    	return http;
    }
    
	public String getbtStr() {
		return "0022";
	}

	public MaterialDiscountEntryInfo getMaterialDiscount(Context ctx, String cusId, String mId) throws Exception {
		Connection conn = null;
		try {
			conn = ConnectDb.Connect();
			MaterialDiscountEntryInfo info = getMaterialDiscount(ctx, conn, cusId, mId);
			return info;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	}

	public MaterialDiscountEntryInfo getMaterialDiscount(Context ctx, Connection conn, String cusId, String mId) throws Exception {
		String shopId = ctx.getShopId();
		String adminShopId = ctx.getAdminShopId();
		
		StringBuffer sql = new StringBuffer();
		sql.append("select a.* from( \n");
		sql.append("select \n");
		sql.append("case when d.fshopId = '" + shopId + "' then 0 else 1 end as seq, \n");
		sql.append("m.fid as material_id, \n");
		sql.append("m.fnumber as material_number, \n");
		sql.append("m.fname as material_name, \n");
		sql.append(" \n");
		sql.append("dm.fdiscount as discount, \n");
		sql.append("dm.fremark as remark \n");
		sql.append("from base_discount d \n");
		sql.append("inner join base_discount_materialentry dm on d.fid = dm.fparentid \n");
		sql.append("inner join base_material m on m.fid = dm.fmaterialid \n");
		sql.append("inner join base_customer c on c.fvipId = d.fvipId \n");
		sql.append("where d.fisenable = 1 \n");
		sql.append("and (d.fshopid = '" + shopId +"' \n");
		sql.append("or d.fadminshopid = '" + adminShopId +"') \n");
		sql.append("and m.fid = '" + mId + "'\n");
		sql.append("and c.fid = '" + cusId + "'\n");
		sql.append(") a order by a.seq asc \n");

		QueryRunner qRunner = new QueryRunner();
		List<Map<String, Object>> list = qRunner.query(conn, sql.toString(), new MapListHandler());
		if(list != null && !list.isEmpty())
		{
			Map<String, Object> map = list.get(0);
			MaterialDiscountEntryInfo info = (MaterialDiscountEntryInfo) BeanUtil.getInfoFromMap(MaterialDiscountEntryInfo.class, map);
			return info;
		}
		
		return null;
	}
	
	public ProjectDiscountEntryInfo getProjectDiscount(Context ctx, String cusId, String proId) throws Exception {

		Connection conn = null;
		try {
			conn = ConnectDb.Connect();
			ProjectDiscountEntryInfo info = getProjectDiscount(ctx, conn, cusId, proId);
			return info;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	
	}
	
	public ProjectDiscountEntryInfo getProjectDiscount(Context ctx, Connection conn, String cusId, String proId) throws Exception {
		String shopId = ctx.getShopId();
		String adminShopId = ctx.getAdminShopId();
		
		StringBuffer sql = new StringBuffer();
		sql.append("select a.* from( \n");
		sql.append("select \n");
		sql.append("case when d.fshopId = '" + shopId + "' then 0 else 1 end as seq, \n");
		sql.append("p.fid as project_id, \n");
		sql.append("p.fnumber as project_number, \n");
		sql.append("p.fname as project_name, \n");
		sql.append(" \n");
		sql.append("dp.fdiscount as discount, \n");
		sql.append("dp.fremark as remark \n");
		sql.append("from base_discount d \n");
		sql.append("inner join base_discount_projectentry dp on d.fid = dp.fparentid \n");
		sql.append("inner join base_project p on p.fid = dp.fprojectid \n");
		sql.append("inner join base_customer c on c.fvipId = d.fvipId \n");
		sql.append("where d.fisenable = 1 \n");
		sql.append("and (d.fshopid = '" + shopId +"' \n");
		sql.append("or d.fadminshopid = '" + adminShopId +"') \n");
		sql.append("and p.fid = '" + proId + "'\n");
		sql.append("and c.fid = '" + cusId + "'\n");
		sql.append(") a order by a.seq asc \n");

		QueryRunner qRunner = new QueryRunner();
		List<Map<String, Object>> list = qRunner.query(conn, sql.toString(), new MapListHandler());
		if(list != null && !list.isEmpty())
		{
			Map<String, Object> map = list.get(0);
			ProjectDiscountEntryInfo info = (ProjectDiscountEntryInfo) BeanUtil.getInfoFromMap(ProjectDiscountEntryInfo.class, map);
			return info;
		}
		
		return null;
	}
}
