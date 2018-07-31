package bill.purchase.mutil;

import java.sql.Connection;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import bas.person.PersonInfo;
import bas.supplier.SupplierInfo;
import bean.IHttp;
import bean.Info;
import bean.bill.BillInfo;
import bean.bill.IHttpBill;
import bill.purchase.IHttpPurchase;
import bill.purchase.PurchaseInfo;
import common.db.ConnectDb;
import common.db.Context;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpPurchaseMutil")
public class IHttpPurchaseMutil extends IHttpBill {
	protected static IHttpPurchaseMutil http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpPurchaseMutil() {
        super();
    }
    
    public static IHttpPurchaseMutil getInstance()
    {
    	if(http == null)
    		http = new IHttpPurchaseMutil();
    	return http;
    }
	
	public String getbtStr() {
		return "002701";
	}

	public String setAuditTrue(Context ctx, Connection conn, BillInfo model) throws Exception {
		PurchaseMutilInfo info = (PurchaseMutilInfo) model;
		String pk = super.setAuditTrue(ctx, conn, info);
		
		IHttpPurchase iHttpPurchase = IHttpPurchase.getInstance();
		LinkedList<PurchaseMutilEntryInfo> list = info.getEntryList();
		for(PurchaseMutilEntryInfo entryInfo : list)
		{
			PurchaseInfo pInfo = new PurchaseInfo();
			pInfo.setShopId(info.getShopId());
			pInfo.setAdminShopId(info.getAdminShopId());
			pInfo.setBizdate(info.getBizdate());
			pInfo.setPersonInfo(info.getPersonInfo());
			pInfo.setSupplierInfo(info.getSupplierInfo());
			pInfo.setNumber(iHttpPurchase.getNewNumber(ctx, conn));
			pInfo.setSourceBillId(pk);
			
			pInfo.setMaterialInfo(entryInfo.getMaterialInfo());
			pInfo.setUnitInfo(entryInfo.getUnitInfo());
			pInfo.setQty(entryInfo.getQty());
			pInfo.setPrice(entryInfo.getPrice());
			pInfo.setAmt(entryInfo.getAmt());
			
			iHttpPurchase.setAuditTrue(ctx, conn, pInfo);
		}
		
		return pk;
	}

	public String setAuditFalse(Context ctx, Connection conn, BillInfo model) throws Exception {
		PurchaseMutilInfo info = (PurchaseMutilInfo) model;
		
		String pk = super.setAuditFalse(ctx, conn, info);
		
		IHttpPurchase iHttpPurchase = IHttpPurchase.getInstance();
		LinkedList<Info> list = iHttpPurchase.getInfoList(conn, "a.fsourcebillid = '" + pk + "'", "");
		for(Info objInfo : list)
		{
			PurchaseInfo pInfo = (PurchaseInfo) objInfo;
			String pPk = iHttpPurchase.setAuditFalse(ctx, conn, pInfo);
			iHttpPurchase.delete(ctx, conn, pPk);
		}
		
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
		sql.append("pe.fprice as price,\n");
		sql.append("pe.fqty as qty,\n");
		sql.append("pe.famt as amt,\n");
		sql.append("p.fisAuditTrue as isaudittrue\n");
		sql.append("from bill_purchasemutil p\n");
		sql.append("inner join bill_purchasemutil_entry pe on p.fid = pe.fparentid \n");
		sql.append("left join base_material m on m.fid = pe.fmaterialId\n");
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
		sql.append("sum(pe.fqty) as qty,\n");
		sql.append("sum(pe.famt) as amt,\n");
		sql.append("p.fisAuditTrue as isaudittrue\n");
		sql.append("from bill_purchasemutil p\n");
		sql.append("inner join bill_purchasemutil_entry pe on p.fid = pe.fparentid \n");
		sql.append("left join base_material m on m.fid = pe.fmaterialId\n");
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
