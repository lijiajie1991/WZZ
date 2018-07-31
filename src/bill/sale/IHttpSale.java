package bill.sale;

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
import bas.sys.shopparam.IHttpShopParam;
import bas.sys.shopparam.ShopParamInfo;
import bean.IHttp;
import bean.Info;
import bean.bill.BillInfo;
import bean.bill.IHttpBill;
import bill.inwh.IHttpInWh;
import bill.inwh.InWhInfo;
import bill.outwh.IHttpOutWh;
import bill.outwh.OutWhInfo;
import bill.smsrecord.IHttpSmsRecord;
import bill.smsrecord.SmsRecordInfo;
import common.db.ConnectDb;
import common.db.Context;
import common.util.DateTimeUtil;
import em.PayType;
import exp.BizException;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpSale")
public class IHttpSale extends IHttpBill {
	protected static IHttpSale http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpSale() {
        super();
    }
	
	public String getbtStr() {
		return "0020";
	}
	
	public static IHttpSale getInstance()
    {
    	if(http == null)
    		http = new IHttpSale();
    	return http;
    }

	public String setAuditTrue(Context ctx, Connection conn, BillInfo info) throws Exception {
		OutWhInfo outInfo = new OutWhInfo();
		SaleInfo sInfo = (SaleInfo) info;
		outInfo.setShopId(sInfo.getShopId());
		outInfo.setAdminShopId(sInfo.getAdminShopId());
		outInfo.setMaterialInfo(sInfo.getMaterialInfo());
		outInfo.setUnitInfo(sInfo.getUnitInfo());
		outInfo.setOutStockDate(sInfo.getBizdate());
		outInfo.setQty(sInfo.getQty());
		outInfo.setPrice(sInfo.getPrice());
		outInfo.setAmt(sInfo.getAmt());
		outInfo.setRemark("审核销售单生成");
		
		String pk = super.setAuditTrue(ctx, conn, info);
		updateCustomerBalance(ctx, conn, sInfo, true);
		
		//发送客户短信
		sendSaleSms(ctx, conn, sInfo);
		
		outInfo.setSourceBillId(pk);
		IHttpOutWh.getInstance().setAuditTrue(ctx, conn, outInfo);
		return pk;
	}

	public String setAuditFalse(Context ctx, Connection conn, BillInfo model) throws Exception {
		SaleInfo info = (SaleInfo) model;
		if(info.getIsBalance())
		{
			throw new BizException("当前单据已结算， 不能改单");
		}
		
		InWhInfo inInfo = new InWhInfo();
		inInfo.setShopId(info.getShopId());
		inInfo.setAdminShopId(info.getAdminShopId());
		inInfo.setMaterialInfo(info.getMaterialInfo());
		inInfo.setUnitInfo(info.getUnitInfo());
		inInfo.setInStockDate(info.getBizdate());
		inInfo.setQty(info.getQty());
		inInfo.setPrice(info.getPrice());
		inInfo.setAmt(info.getAmt());
		inInfo.setRemark("反审核销售单生成");
		
		String pk = super.setAuditFalse(ctx, conn, info);
		updateCustomerBalance(ctx, conn, info, false);
		
		inInfo.setSourceBillId(pk);
		IHttpInWh.getInstance().setAuditTrue(ctx, conn, inInfo);
		return pk;
	}
	
	protected void updateCustomerBalance(Context ctx, Connection conn, SaleInfo info, boolean isAudit) throws Exception
	{
		PayType pt = info.getPt();
		CustomerInfo cusInfo = info.getCustomerInfo();
		if(cusInfo == null || cusInfo.getId() == null)
			return;
		
		BigDecimal amt = info.getFactamt();
		amt = amt != null ? amt : BigDecimal.ZERO;
		amt = isAudit ? amt.negate() : amt;
		int points = amt.negate().intValue();
		
		amt = pt != null && pt == PayType.Vip ? amt : BigDecimal.ZERO;
		String sql = "update base_customer set fbalance = fbalance + ?, fpoints = fpoints + ? where fid = ?";
		
		QueryRunner qRunner = new QueryRunner();
		qRunner.update(conn, sql.toString(), new Object[]{amt.doubleValue(), points, cusInfo.getId()});
	}

	protected void verifyToAuditTrue(Context ctx, Connection conn, BillInfo info) throws Exception {
		SaleInfo saleInfo = (SaleInfo) info;
		if(saleInfo.getPt() == PayType.Vip)
		{
			CustomerInfo cusInfo = saleInfo.getCustomerInfo();
			if(cusInfo == null || cusInfo.getId() == null)
				throw new BizException(PayType.Vip.getName() + "时， 客户不能为空！");
			
			cusInfo = (CustomerInfo) IHttpCustomer.getInstance().getInfo(conn, cusInfo.getId());
			BigDecimal balance = cusInfo.getBalance();
			if(balance.compareTo(saleInfo.getFactamt()) < 0)
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
		
		StringBuffer filterSql = new StringBuffer();
		filterSql.append("a.fbizdate >= '" + pm.get("df") + "'\n");
		filterSql.append("and a.fbizdate <= '" + pm.get("dt") + "'\n");
		filterSql.append("and a.fshopId = '" + shopId + "'\n");
		filterSql.append("and ('all' = '" + pInfo.getId() + "' or person.fid = '" + pInfo.getId() + "')\n");
		filterSql.append("and ('all' = '" + cInfo.getId() + "' or customer.fid = '" + cInfo.getId() + "')\n");
		
		List<Map<String, Object>> list = this.getMapListData(ctx, filterSql.toString(), "a.fnumber");
		data.put("list", list);
		
		
		StringBuffer sql = new StringBuffer();
		sql.append("select \n");
		sql.append("m.fname as material_name, \n");
		sql.append("count(s.fid) as qty, \n");
		sql.append("sum(s.famt) as amt, \n");
		sql.append("sum(s.ffactamt) as factamt, \n");
		sql.append("s.fisaudittrue as isaudittrue \n");
		sql.append("from bill_sale s \n");
		sql.append("inner join base_material m on m.fid = s.fmaterialid \n");
		sql.append("left join base_person per on per.fid = s.fpersonId \n");
		sql.append("left join base_customer c on c.fid = s.fcustomerId \n");
		sql.append("where date_format(s.fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(s.fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		sql.append("and s.fshopId = '" + shopId + "' \n");
		sql.append("and ('all' = '" + pInfo.getId() + "' or per.fid = '" + pInfo.getId()+ "') \n");
		sql.append("and ('all' = '" + cInfo.getId() + "' or c.fid = '" + cInfo.getId()+ "') \n");
		sql.append("group by m.fname, s.fisaudittrue \n");

		
		Connection conn = ConnectDb.Connect();
		QueryRunner qRunner = new QueryRunner();
		List<Map<String, Object>> groupList = qRunner.query(conn, sql.toString(), new MapListHandler());
		data.put("groupList", groupList);
		
		return data;
	}


	protected void sendSaleSms(Context ctx, Connection conn,  SaleInfo info) throws Exception
	{
		//由其他单据生成的销售单不发送短信， 需要发送短信的在上游单据实现
		if(info.getSourceBillId() != null && !"".equals(info.getSourceBillId()))
			return;
		
		//客户
		CustomerInfo cInfo = info.getCustomerInfo();
		if(cInfo == null || cInfo.getId() == null)
			return;
				
		ShopParamInfo spInfo = new ShopParamInfo();
		LinkedList<Info> spList = IHttpShopParam.getInstance().getInfoList(conn, "a.fshopId = '" + ctx.getShopId() + "'", "");
		if(spList != null && !spList.isEmpty())
			spInfo = (ShopParamInfo) spList.get(0);
		
		if(!spInfo.getIsCustomerSms())
			return;
		
		cInfo = (CustomerInfo) IHttpCustomer.getInstance().getInfo(conn, cInfo.getId());
		String phone = cInfo.getPhone();
		
		
		BigDecimal amt = info.getFactamt().setScale(1, BigDecimal.ROUND_DOWN);
		
		StringBuffer msg = new StringBuffer();
		msg.append("您于");
		msg.append(DateTimeUtil.getDateStr(info.getBizdate(), "yyyy年MM月dd日"));
		msg.append("在" + ctx.getShopInfo().getName());
		msg.append("消费" + amt.toString() + "元， 当前余额️" + cInfo.getBalance().setScale(1, BigDecimal.ROUND_DOWN) + "元");
		
		SmsRecordInfo smsInfo = new SmsRecordInfo();
		smsInfo.setPhone(phone);
		smsInfo.setCtx(msg.toString());
		IHttpSmsRecord.getInstance().setAuditTrue(ctx, smsInfo);
	}

}
