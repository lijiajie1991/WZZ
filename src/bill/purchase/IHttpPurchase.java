package bill.purchase;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import bas.person.PersonInfo;
import bas.supplier.SupplierInfo;
import bean.IHttp;
import bean.bill.BillInfo;
import bean.bill.IHttpBill;
import bill.inwh.IHttpInWh;
import bill.inwh.InWhInfo;
import bill.outwh.IHttpOutWh;
import bill.outwh.OutWhInfo;
import common.db.ConnectDb;
import common.db.Context;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpPurchase")
public class IHttpPurchase extends IHttpBill {
       
	protected static IHttpPurchase http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpPurchase() {
        super();
    }
    
    public static IHttpPurchase getInstance()
    {
    	if(http == null)
    		http = new IHttpPurchase();
    	return http;
    }
	
	public String getbtStr() {
		return "0027";
	}

	public String setAuditTrue(Context ctx, Connection conn, BillInfo model) throws Exception {
		PurchaseInfo info = (PurchaseInfo) model;
		
		InWhInfo inInfo = new InWhInfo();
		inInfo.setShopId(info.getShopId());
		inInfo.setAdminShopId(info.getAdminShopId());
		inInfo.setMaterialInfo(info.getMaterialInfo());
		inInfo.setUnitInfo(info.getUnitInfo());
		inInfo.setInStockDate(info.getBizdate());
		inInfo.setQty(info.getQty());
		inInfo.setPrice(info.getPrice());
		inInfo.setAmt(info.getAmt());
		inInfo.setRemark("审核采购单生成");
		
		String pk = super.setAuditTrue(ctx, conn, info);
		
		inInfo.setSourceBillId(pk);
		IHttpInWh.getInstance().setAuditTrue(ctx, conn, inInfo);
		return pk;
	}

	public String setAuditFalse(Context ctx, Connection conn, BillInfo model) throws Exception {
		PurchaseInfo info = (PurchaseInfo) model;
		
		OutWhInfo outInfo = new OutWhInfo();
		outInfo.setShopId(info.getShopId());
		outInfo.setAdminShopId(info.getAdminShopId());
		outInfo.setMaterialInfo(info.getMaterialInfo());
		outInfo.setUnitInfo(info.getUnitInfo());
		outInfo.setOutStockDate(info.getBizdate());
		outInfo.setQty(info.getQty());
		outInfo.setPrice(info.getPrice());
		outInfo.setAmt(info.getAmt());
		outInfo.setRemark("反审核采购单生成");
		
		String pk = super.setAuditFalse(ctx, conn, info);
		
		outInfo.setSourceBillId(pk);
		IHttpOutWh.getInstance().setAuditTrue(ctx, conn, outInfo);
		return pk;
	}
	
	
	
	public Map<String, List<Map<String, Object>>> getDailyDataList(Context ctx, HashMap<String, Object> pm) throws Exception
	{
		Map<String, List<Map<String, Object>>> data = new HashMap<String, List<Map<String,Object>>>();
		
		String shopId = ctx.getShopId();
		
		String df = (String) pm.get("df");
		String dt = (String) pm.get("dt");
		PersonInfo pInfo = (PersonInfo) pm.get("person");
		SupplierInfo sInfo = (SupplierInfo) pm.get("supplier");
		
		StringBuffer sql = null;
		Connection conn = ConnectDb.Connect();
		QueryRunner qRunner = new QueryRunner();
		
		sql = new StringBuffer();
		sql.append("select\n");
		sql.append("p.fid as id,\n");
		sql.append("p.fnumber as number,\n");
		sql.append("DATE_FORMAT(p.fbizdate, '%Y-%m-%d') as bizdate,\n");
		sql.append("s.fname as supplier_name,\n");
		sql.append("m.fname as material_name,\n");
		sql.append("p.fprice as price,\n");
		sql.append("p.fqty as qty,\n");
		sql.append("p.famt as amt,\n");
		sql.append("p.fisAuditTrue as isaudittrue\n");
		sql.append("from bill_purchase p\n");
		sql.append("left join base_material m on m.fid = p.fmaterialId\n");
		sql.append("left join base_person per on per.fid = p.fpersonId\n");
		sql.append("left join base_supplier s on s.fid = p.fsupplierId\n");
		sql.append("where date_format(p.fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(p.fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		sql.append("and p.fshopId = '" + shopId + "' \n");
		sql.append("and ('all' = '" + pInfo.getId() + "' or per.fid = '" + pInfo.getId()+ "') \n");
		sql.append("and ('all' = '" + sInfo.getId() + "' or s.fid = '" + sInfo.getId()+ "') \n");
		sql.append("order by p.fnumber \n");
		List<Map<String, Object>> list = qRunner.query(conn, sql.toString(), new MapListHandler());
		data.put("list", list);
		
		
		sql = new StringBuffer();
		sql.append("select\n");
		sql.append("m.fname as material_name,\n");
		sql.append("sum(p.fqty) as qty,\n");
		sql.append("sum(p.famt) as amt,\n");
		sql.append("p.fisAuditTrue as isaudittrue\n");
		sql.append("from bill_purchase p\n");
		sql.append("left join base_material m on m.fid = p.fmaterialId\n");
		sql.append("left join base_person per on per.fid = p.fpersonId\n");
		sql.append("left join base_supplier s on s.fid = p.fsupplierId\n");
		sql.append("where date_format(p.fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(p.fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		sql.append("and p.fshopId = '" + shopId + "' \n");
		sql.append("and ('all' = '" + pInfo.getId() + "' or per.fid = '" + pInfo.getId()+ "') \n");
		sql.append("and ('all' = '" + sInfo.getId() + "' or s.fid = '" + sInfo.getId()+ "') \n");
		sql.append("group by m.fname, p.fisaudittrue \n");
		sql.append("order by m.fname \n");
		
		List<Map<String, Object>> groupList = qRunner.query(conn, sql.toString(), new MapListHandler());
		data.put("groupList", groupList);
		
		return data;
	}
}
