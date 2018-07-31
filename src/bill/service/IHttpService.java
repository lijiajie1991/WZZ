package bill.service;

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
@WebServlet("/IHttpService")
public class IHttpService extends IHttpBill {
       
    /**
     * @see IHttp#IHttp()
     */
    public IHttpService() {
        super();
    }
	
	public String getbtStr() {
		return "0021";
	}

	public String setAuditTrue(Context ctx, Connection conn, BillInfo model) throws Exception {
		ServiceInfo info = (ServiceInfo) model;
		String pk = super.setAuditTrue(ctx, conn, info);
		updateCustomerBalance(ctx, conn, info, true);
		
		//发送客户短信
		sendSaleSms(ctx, conn, info);
		return pk;
	}

	public String setAuditFalse(Context ctx, Connection conn, BillInfo model) throws Exception {
		ServiceInfo info = (ServiceInfo) model;
		if(info.getIsBalance())
		{
			throw new BizException("当前单据已结算， 不能改单");
		}
		String pk = super.setAuditFalse(ctx, conn, info);
		updateCustomerBalance(ctx, conn, info, false);
		return pk;
	}
	
	protected void updateCustomerBalance(Context ctx, Connection conn, ServiceInfo info, boolean isAudit) throws Exception
	{
		PayType pt = info.getPt();
		CustomerInfo cusInfo = info.getCustomerInfo();
		
		if(cusInfo == null || cusInfo.getId() == null || "".equals(cusInfo.getId().trim()))
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
		ServiceInfo serviceInfo = (ServiceInfo) info;
		if(serviceInfo.getPt() == PayType.Vip)
		{
			CustomerInfo cusInfo = serviceInfo.getCustomerInfo();
			if(cusInfo == null || cusInfo.getId() == null)
				throw new BizException(PayType.Vip.getName() + "时， 客户不能为空！");
			
			cusInfo = (CustomerInfo) IHttpCustomer.getInstance().getInfo(conn, cusInfo.getId());
			BigDecimal balance = cusInfo.getBalance();
			if(balance.compareTo(serviceInfo.getFactamt()) < 0)
				throw new BizException("客户余额不足！");
		}
		
		super.verifyToAuditTrue(ctx, conn, serviceInfo);
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
		sql.append("p.fname as project_name, \n");
		sql.append("count(s.fid) as qty, \n");
		sql.append("sum(s.famt) as amt, \n");
		sql.append("sum(s.ffactamt) as factamt, \n");
		sql.append("s.fisaudittrue as isaudittrue \n");
		sql.append("from bill_service s \n");
		sql.append("inner join base_project p on p.fid = s.fprojectId \n");
		sql.append("left join base_person per on per.fid = s.fpersonId \n");
		sql.append("left join base_customer c on c.fid = s.fcustomerId \n");
		sql.append("where date_format(s.fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(s.fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		sql.append("and s.fshopId = '" + shopId + "' \n");
		sql.append("and ('all' = '" + pInfo.getId() + "' or per.fid = '" + pInfo.getId()+ "') \n");
		sql.append("and ('all' = '" + cInfo.getId() + "' or c.fid = '" + cInfo.getId()+ "') \n");
		sql.append("group by p.fname, s.fisaudittrue \n");
		sql.append("union all \n");
		sql.append("select \n");
		sql.append("'总计' as project_name, \n");
		sql.append("count(s.fid) as qty, \n");
		sql.append("sum(s.famt) as amt, \n");
		sql.append("sum(s.ffactamt) as factamt, \n");
		sql.append("1 as isaudittrue \n");
		sql.append("from bill_service s \n");
		sql.append("inner join base_project p on p.fid = s.fprojectId \n");
		sql.append("left join base_person per on per.fid = s.fpersonId \n");
		sql.append("left join base_customer c on c.fid = s.fcustomerId \n");
		sql.append("where date_format(s.fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(s.fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		sql.append("and s.fshopId = '" + shopId + "' \n");
		sql.append("and ('all' = '" + pInfo.getId() + "' or per.fid = '" + pInfo.getId()+ "') \n");
		sql.append("and ('all' = '" + cInfo.getId() + "' or c.fid = '" + cInfo.getId()+ "') \n");
		
		System.out.println(sql.toString());
		
		Connection conn = ConnectDb.Connect();
		QueryRunner qRunner = new QueryRunner();
		List<Map<String, Object>> groupList = qRunner.query(conn, sql.toString(), new MapListHandler());
		data.put("groupList", groupList);
		
		
		return data;
	}
	
	
	protected void sendSaleSms(Context ctx, Connection conn,  ServiceInfo info) throws Exception
	{
		//客户
		CustomerInfo cInfo = info.getCustomerInfo();
		if(cInfo == null || cInfo.getId() == null || "".equals(cInfo.getId().trim()))
			return;
				
		ShopParamInfo spInfo = new ShopParamInfo();
		LinkedList<Info> spList = IHttpShopParam.getInstance().getInfoList(conn, "a.fshopId = '" + ctx.getShopId() + "'", "");
		if(spList != null && !spList.isEmpty())
			spInfo = (ShopParamInfo) spList.get(0);
		
		if(!spInfo.getIsCustomerSms())
			return;
		
		cInfo = (CustomerInfo) IHttpCustomer.getInstance().getInfo(conn, cInfo.getId());
		String phone = cInfo.getPhone();
		
		
		BigDecimal amt = info.getFactamt().setScale(2, BigDecimal.ROUND_DOWN);
		
		StringBuffer msg = new StringBuffer();
		msg.append("您于");
		msg.append(DateTimeUtil.getDateStr(info.getBizdate(), "yyyy年MM月dd日"));
		msg.append("在" + ctx.getShopInfo().getName());
		msg.append("消费" + amt.toString() + "元， 当前余额️" + cInfo.getBalance().setScale(2, BigDecimal.ROUND_DOWN) + "元");
		
		SmsRecordInfo smsInfo = new SmsRecordInfo();
		smsInfo.setPhone(phone);
		smsInfo.setCtx(msg.toString());
		IHttpSmsRecord.getInstance().setAuditTrue(ctx, smsInfo);
	}
}
