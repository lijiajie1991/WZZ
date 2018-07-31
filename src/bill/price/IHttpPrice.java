package bill.price;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import bas.discount.IHttpDiscount;
import bas.discount.MaterialDiscountEntryInfo;
import bas.discount.ProjectDiscountEntryInfo;
import bas.measureunit.MeasureUnitInfo;
import bean.IHttp;
import bean.bill.BillInfo;
import bean.bill.IHttpBill;
import common.db.ConnectDb;
import common.db.Context;
import common.util.BeanUtil;
import common.util.BigDecimalUtil;
import common.util.DateTimeUtil;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpPrice")
public class IHttpPrice extends IHttpBill {
	private static final long serialVersionUID = 1L;
	
	protected static IHttpPrice http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpPrice() {
        super();
    }
	
	public String getbtStr() {
		return "0016";
	}
	
	public static IHttpPrice getInstance()
    {
    	if(http == null)
    		http = new IHttpPrice();
    	return http;
    }

	public String setAuditTrue(Context ctx, Connection conn, BillInfo info) throws Exception {
		PriceInfo pInfo = (PriceInfo) info;
		String dateStr = DateTimeUtil.getDateAfterDaysStr(pInfo.getDateFrom(), -1);
		String shopId = pInfo.getShopId();
		
		String tbl = pInfo.getBT().getTableName();
		StringBuffer sql = new StringBuffer();
		sql.append("update " + tbl + "\n");
		sql.append("set fdateto = '" + dateStr + "'\n");
		sql.append("where fshopId = '" + shopId + "'");
		sql.append("and fisaudittrue = 1 ");
		sql.append("and DATE_FORMAT(fdateto,'%Y-%m-%d') = '2030-01-01' \n");
		
		QueryRunner qRunner = new QueryRunner();
		qRunner.update(conn, sql.toString());
		
		String pk = super.setAuditTrue(ctx, conn, info);
		return pk;
	}

	public String setAuditFalse(Context ctx, Connection conn, BillInfo info) throws Exception {
		String pk = super.setAuditFalse(ctx, conn, info);
		
		PriceInfo pInfo = (PriceInfo) info;
		String dateStr = DateTimeUtil.getDateAfterDaysStr(pInfo.getDateFrom(), -1);
		String shopId = pInfo.getShopId();
		
		String tbl = pInfo.getBT().getTableName();
		StringBuffer sql = new StringBuffer();
		sql.append("update " + tbl + "\n");
		sql.append("set fdateto = '2030-01-01' \n");
		sql.append("where fshopId = '" + shopId + "'");
		sql.append("and fisaudittrue = 1 ");
		sql.append("and DATE_FORMAT(fdateto,'%Y-%m-%d') = '" + dateStr + "' \n");
		
		QueryRunner qRunner = new QueryRunner();
		qRunner.update(conn, sql.toString());
		
		return pk;
	}
	
	public MaterialPriceEntryInfo getMaterialPrice(Context ctx, String mId, String dateStr) throws Exception {
		Connection conn = null;
		try {
			conn = ConnectDb.Connect();
			MaterialPriceEntryInfo info = getMaterialPrice(ctx, conn, mId, dateStr);
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

	public MaterialPriceEntryInfo getMaterialPrice(Context ctx, Connection conn, String mId, String dateStr) throws Exception {
		String shopId = ctx.getShopId();
		String adminShopId = ctx.getAdminShopId();
		
		StringBuffer sql = new StringBuffer();
		
		sql.append("select a.* from( \n");
		sql.append("select \n");
		sql.append("case when p.fshopId = '" + shopId + "' then 0 else 1 end as seq, \n");
		sql.append(" \n");
		sql.append("m.fid as mId, \n");
		sql.append("m.fnumber as mNumber, \n");
		sql.append("m.fname as mName, \n");
		sql.append(" \n");
		sql.append("u.fid as uId, \n");
		sql.append("u.fnumber as uNumber, \n");
		sql.append("u.fname as uName, \n");
		sql.append("u.fcoe as ucoe, \n");
		sql.append(" \n");
		sql.append("pe.fprice as price, \n");
		sql.append("pe.fisfloat as isFloat \n");
		sql.append(" \n");
		sql.append("from bill_price p \n");
		sql.append("inner join bill_price_materialentry pe on p.fid = pe.fparentId \n");
		sql.append("inner join base_material m on m.fid = pe.fmaterialId \n");
		sql.append("inner join base_measureunit u on u.fid = pe.funitId \n");
		sql.append("where p.fisaudittrue = 1 \n");
		sql.append("and (p.fshopId = '" + shopId + "' or p.fshopId = '" + adminShopId + "') \n");
		sql.append("and DATE_FORMAT(p.fdatefrom, '%Y-%m-%d') <= '" + dateStr + "' \n");
		sql.append("and DATE_FORMAT(p.fdateto, '%Y-%m-%d') >= '" + dateStr + "' \n");
		sql.append("and pe.fmaterialId = '" + mId + "' \n");
		sql.append(") a order by a.seq asc \n");
		
		QueryRunner qRunner = new QueryRunner();
		List<Map<String, Object>> list = qRunner.query(conn, sql.toString(), new MapListHandler());
		if(list != null && !list.isEmpty())
		{
			Map<String, Object> map = list.get(0);
			MaterialPriceEntryInfo info = (MaterialPriceEntryInfo) BeanUtil.getInfoFromMap(MaterialPriceEntryInfo.class, map);
			MeasureUnitInfo unitInfo = info.getUnitInfo();
			Object obj = map.get("ucoe");
			BigDecimal coe = BigDecimalUtil.getBigDecimalVal(obj);
			unitInfo.setCoe(coe);
			
			return info;
		}
		
		return null;
	}
	
	public ProjectPriceEntryInfo getProjectPrice(Context ctx, String proId, String dateStr) throws Exception {

		Connection conn = null;
		try {
			conn = ConnectDb.Connect();
			ProjectPriceEntryInfo info = getProjectPrice(ctx, conn, proId, dateStr);
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

	public ProjectPriceEntryInfo getProjectPrice(Context ctx, Connection conn, String proId, String dateStr) throws Exception {
		String shopId = ctx.getShopId();
		String adminShopId = ctx.getAdminShopId();
		
		StringBuffer sql = new StringBuffer();
		
		sql.append("select a.* from( \n");
		sql.append("select \n");
		sql.append("case when p.fshopId = '" + shopId + "' then 0 else 1 end as seq, \n");
		sql.append(" \n");
		sql.append("pro.fid as proId, \n");
		sql.append("pro.fnumber as proNumber, \n");
		sql.append("pro.fname as proName, \n");
		sql.append(" \n");
		sql.append("pe.fprice as price, \n");
		sql.append("pe.fisfloat as isFloat \n");
		sql.append(" \n");
		sql.append("from bill_price p \n");
		sql.append("inner join bill_price_projectentry pe on p.fid = pe.fparentId \n");
		sql.append("inner join base_project pro on pro.fid = pe.fprojectId \n");
		sql.append("where p.fisaudittrue = 1 \n");
		sql.append("and (p.fshopId = '" + shopId + "' or p.fshopId = '" + adminShopId + "') \n");
		sql.append("and DATE_FORMAT(p.fdatefrom, '%Y-%m-%d') <= '" + dateStr + "' \n");
		sql.append("and DATE_FORMAT(p.fdateto, '%Y-%m-%d') >= '" + dateStr + "' \n");
		sql.append("and pe.fprojectId = '" + proId + "' \n");
		sql.append(") a order by a.seq asc \n");
		
		QueryRunner qRunner = new QueryRunner();
		List<Map<String, Object>> list = qRunner.query(conn, sql.toString(), new MapListHandler());
		if(list != null && !list.isEmpty())
		{
			Map<String, Object> map = list.get(0);
			ProjectPriceEntryInfo info = (ProjectPriceEntryInfo) BeanUtil.getInfoFromMap(ProjectPriceEntryInfo.class, map);
			
			return info;
		}
		
		return null;
	}
	
	
	public MaterialPriceEntryInfo getMaterialPrice(Context ctx, String cusId, String mId, String dateStr) throws Exception {
		Connection conn = null;
		try {
			conn = ConnectDb.Connect();
			MaterialPriceEntryInfo info = getMaterialPrice(ctx, conn, cusId, mId, dateStr);
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
	
	public MaterialPriceEntryInfo getMaterialPrice(Context ctx, Connection conn, String cusId, String mId, String dateStr) throws Exception {
		MaterialPriceEntryInfo info = getMaterialPrice(ctx, conn, mId, dateStr);
		if(info != null && cusId != null && !"".equals(cusId))
		{
			MaterialDiscountEntryInfo disInfo = IHttpDiscount.getInstance().getMaterialDiscount(ctx, conn, cusId, mId);
			BigDecimal dis = disInfo != null ? disInfo.getDiscount() : null;
			dis = dis != null ? dis : new BigDecimal(100);
			
			BigDecimal price = info.getPrice();
			price = price != null ? price : BigDecimal.ZERO;
			
			price = price.multiply(dis).divide(new BigDecimal(100), 5, BigDecimal.ROUND_HALF_UP);
			info.setPrice(price);
		}
		return info;
	}
	
	public ProjectPriceEntryInfo getProjectPrice(Context ctx, String cusId, String proId, String dateStr) throws Exception {
		Connection conn = null;
		try {
			conn = ConnectDb.Connect();
			ProjectPriceEntryInfo info = getProjectPrice(ctx, conn, cusId, proId, dateStr);
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
	public ProjectPriceEntryInfo getProjectPrice(Context ctx, Connection conn, String cusId, String proId, String dateStr) throws Exception {
		ProjectPriceEntryInfo info = getProjectPrice(ctx, conn, proId, dateStr);
		if(info != null && cusId != null && !"".equals(cusId))
		{
			ProjectDiscountEntryInfo disInfo = IHttpDiscount.getInstance().getProjectDiscount(ctx, conn, cusId, proId);
			BigDecimal dis = disInfo != null ? disInfo.getDiscount() : null;
			dis = dis != null ? dis : new BigDecimal(100);
			
			BigDecimal price = info.getPrice();
			price = price != null ? price : BigDecimal.ZERO;
			
			price = price.multiply(dis).divide(new BigDecimal(100), 5, BigDecimal.ROUND_HALF_UP);
			info.setPrice(price);
		}
		return info;
	}
	
}
