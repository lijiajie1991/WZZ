package bill.sale.mutil;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import bas.customer.CustomerInfo;
import bas.customer.IHttpCustomer;
import bas.person.PersonInfo;
import bean.IHttp;
import bean.Info;
import bean.bill.BillInfo;
import bean.bill.IHttpBill;
import bill.sale.IHttpSale;
import bill.sale.SaleInfo;
import common.db.ConnectDb;
import common.db.Context;
import em.PayType;
import exp.BizException;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpSaleMutil")
public class IHttpSaleMutil extends IHttpBill {
	protected static IHttpSaleMutil http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpSaleMutil() {
        super();
    }
    
    public static IHttpSaleMutil getInstance()
    {
    	if(http == null)
    		http = new IHttpSaleMutil();
    	return http;
    }
	
	public String getbtStr() {
		return "002001";
	}

	public String setAuditTrue(Context ctx, Connection conn, BillInfo model) throws Exception {
		SaleMutilInfo info = (SaleMutilInfo) model;
		String pk = super.setAuditTrue(ctx, conn, info);
		LinkedList<SaleMutilEntryInfo> list = info.getEntryList();
		
		IHttpSale iHttpSale = IHttpSale.getInstance();
		for(SaleMutilEntryInfo entryInfo : list)
		{
			SaleInfo sInfo = new SaleInfo();
			sInfo.setNumber(iHttpSale.getNewNumber(ctx, conn));
			sInfo.setUseCount(0);
			sInfo.setSourceBillId(pk);
			sInfo.setShopId(info.getShopId());
			sInfo.setAdminShopId(info.getAdminShopId());
			sInfo.setCustomerInfo(info.getCustomerInfo());
			sInfo.setPersonInfo(info.getPersonInfo());
			sInfo.setBizdate(info.getBizdate());
			sInfo.setPt(info.getPt());
			sInfo.setIsBalance(info.getIsBalance());
			sInfo.setMaterialInfo(entryInfo.getMaterialInfo());
			sInfo.setUnitInfo(entryInfo.getUnitInfo());
			sInfo.setQty(entryInfo.getQty());
			sInfo.setPrice(entryInfo.getPrice());
			sInfo.setAmt(entryInfo.getAmt());
			sInfo.setFactamt(entryInfo.getFactAmt());
			sInfo.setRemark(entryInfo.getRemark());
			sInfo.setIsAuditTrue(false);
			
			iHttpSale.setAuditTrue(ctx, conn, sInfo);
		}
		
		
		return pk;
	}

	public String setAuditFalse(Context ctx, Connection conn, BillInfo model) throws Exception {
		SaleMutilInfo info = (SaleMutilInfo) model;
		if(info.getIsBalance())
		{
			throw new BizException("当前单据已结算， 不能改单");
		}
		
		String pk = super.setAuditFalse(ctx, conn, info);
		
		IHttpSale iHttpSale = IHttpSale.getInstance();
		LinkedList<Info> list = iHttpSale.getInfoList(conn, "a.fsourcebillid = '" + pk + "'", "");
		for(Info objInfo : list)
		{
			SaleInfo sInfo = (SaleInfo) objInfo;
			String sPk = iHttpSale.setAuditFalse(ctx, conn, sInfo);
			iHttpSale.delete(ctx, conn, sPk);
		}
		
		return pk;
	}
	
	protected void verifyToAuditTrue(Context ctx, Connection conn, BillInfo info) throws Exception {
		SaleMutilInfo saleInfo = (SaleMutilInfo) info;
		if(saleInfo.getPt() == PayType.Vip)
		{
			CustomerInfo cusInfo = saleInfo.getCustomerInfo();
			if(cusInfo == null || cusInfo.getId() == null)
				throw new BizException(PayType.Vip.getName() + "时， 客户不能为空！");
			
			cusInfo = (CustomerInfo) IHttpCustomer.getInstance().getInfo(conn, cusInfo.getId());
			BigDecimal balance = cusInfo.getBalance();
			if(balance.compareTo(saleInfo.getAmt()) < 0)
				throw new BizException("客户余额不足！");
		}
		
		super.verifyToAuditTrue(ctx, conn, saleInfo);
	}
	
	public Map<String, List<Map<String, Object>>> getDailyDataList(Context ctx, HashMap<String, Object> pm) throws Exception
	{
		Map<String, List<Map<String, Object>>> data = new HashMap<String, List<Map<String,Object>>>();
		
		String shopId = ctx.getShopId();
		
		String df = (String) pm.get("df");
		String dt = (String) pm.get("dt");
		PersonInfo pInfo = (PersonInfo) pm.get("person");
		CustomerInfo cInfo = (CustomerInfo) pm.get("customer");
		
		StringBuffer sql = null;
		Connection conn = ConnectDb.Connect();
		QueryRunner qRunner = new QueryRunner();
		
		sql = new StringBuffer();
		sql.append("select \n");
		sql.append("s.fid as id, \n");
		sql.append("s.fnumber as number, \n");
		sql.append("DATE_FORMAT(s.fbizdate, '%Y-%m-%d') as bizdate, \n");
		sql.append("c.fname as customer_name, \n");
		sql.append("m.fname as material_name, \n");
		sql.append("se.fprice as price, \n");
		sql.append("se.fqty as qty, \n");
		sql.append("se.famt as amt, \n");
		sql.append("se.ffactamt as factamt, \n");
		sql.append("s.fpt as pt, \n");
		sql.append("s.fisAuditTrue as isaudittrue \n");
		sql.append("from bill_salemutil s \n");
		sql.append("inner join bill_salemutil_entry se on s.fid = se.fparentid \n");
		sql.append("left join base_person per on per.fid = s.fpersonId \n");
		sql.append("left join base_customer c on c.fid = s.fcustomerId \n");
		sql.append("left join base_material m on m.fid = se.fmaterialId \n");
		sql.append("where date_format(s.fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(s.fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		sql.append("and s.fshopId = '" + shopId + "' \n");
		sql.append("and ('all' = '" + pInfo.getId() + "' or per.fid = '" + pInfo.getId()+ "') \n");
		sql.append("and ('all' = '" + cInfo.getId() + "' or c.fid = '" + cInfo.getId()+ "') \n");
		sql.append("order by s.fnumber \n");
		List<Map<String, Object>> list = qRunner.query(conn, sql.toString(), new MapListHandler());
		data.put("list", list);
		
		
		sql = new StringBuffer();
		sql.append("select \n");
		sql.append("m.fname as material_name, \n");
		sql.append("sum(se.fqty) as qty, \n");
		sql.append("sum(se.famt) as amt, \n");
		sql.append("sum(se.ffactamt) as factamt, \n");
		sql.append("s.fisAuditTrue as isaudittrue \n");
		sql.append("from bill_salemutil s \n");
		sql.append("inner join bill_salemutil_entry se on s.fid = se.fparentid \n");
		sql.append("left join base_person per on per.fid = s.fpersonId \n");
		sql.append("left join base_customer c on c.fid = s.fcustomerId \n");
		sql.append("left join base_material m on m.fid = se.fmaterialId \n");
		sql.append("where date_format(s.fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(s.fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		sql.append("and s.fshopId = '" + shopId + "' \n");
		sql.append("and ('all' = '" + pInfo.getId() + "' or per.fid = '" + pInfo.getId()+ "') \n");
		sql.append("and ('all' = '" + cInfo.getId() + "' or c.fid = '" + cInfo.getId()+ "') \n");
		sql.append("group by m.fname, s.fisaudittrue \n");
		sql.append("order by m.fname \n");
		
		List<Map<String, Object>> groupList = qRunner.query(conn, sql.toString(), new MapListHandler());
		data.put("groupList", groupList);
		
		return data;
	}
}
