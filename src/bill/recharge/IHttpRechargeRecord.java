package bill.recharge;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.LinkedList;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.QueryRunner;

import bas.customer.CustomerInfo;
import bas.customer.IHttpCustomer;
import bas.sys.shopparam.IHttpShopParam;
import bas.sys.shopparam.ShopParamInfo;
import bean.IHttp;
import bean.Info;
import bean.bill.BillInfo;
import bean.bill.IHttpBill;
import bill.smsrecord.IHttpSmsRecord;
import bill.smsrecord.SmsRecordInfo;
import common.db.Context;
import common.util.DateTimeUtil;
import exp.BizException;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpRechargeRecord")
public class IHttpRechargeRecord extends IHttpBill {
     protected static IHttpRechargeRecord http = null;
     
    /**
     * @see IHttp#IHttp()
     */
    public IHttpRechargeRecord() {
        super();
    }
    
    public static IHttpRechargeRecord getInstance()
    {
    	if(http == null)
    		http = new IHttpRechargeRecord();
    	return http;
    }
	
	public String getbtStr() {
		return "0023";
	}

	public String setAuditTrue(Context ctx, Connection conn, BillInfo model) throws Exception {
		RechargeRecordInfo info = (RechargeRecordInfo) model;
		String pk = super.setAuditTrue(ctx, conn, info);
		updateCustomerBalance(ctx, conn, info, true);
		sendSaleSms(ctx, conn, info);
		return pk;
	}

	public String setAuditFalse(Context ctx, Connection conn, BillInfo info) throws Exception {
		String pk = super.setAuditFalse(ctx, conn, info);
		updateCustomerBalance(ctx, conn, (RechargeRecordInfo) info, false);
		return pk;
	}

	protected void verifyToAuditTrue(Context ctx, Connection conn, BillInfo model) throws Exception {
		RechargeRecordInfo info = (RechargeRecordInfo) model;
		super.verifyToAuditTrue(ctx, conn, info);
		
		CustomerInfo cusInfo = info.getCustomerInfo();
		if(cusInfo == null || cusInfo.getId() == null || "".equals(cusInfo.getId().trim()))
			throw new BizException("客户不能为空！");
	}
	
	protected void updateCustomerBalance(Context ctx, Connection conn, RechargeRecordInfo info, boolean isAudit) throws Exception
	{
		CustomerInfo cusInfo = info.getCustomerInfo();
		
		BigDecimal amt = info.getFactAmt();
		amt = amt != null ? amt : BigDecimal.ZERO;
		amt = isAudit ? amt : amt.negate();
		
		String sql = "update base_customer set fbalance = fbalance + ? where fid = ?";
		
		QueryRunner qRunner = new QueryRunner();
		qRunner.update(conn, sql.toString(), new Object[]{amt.doubleValue(), cusInfo.getId()});
	}

	protected void verifyToAuditFalse(Context ctx, Connection conn, BillInfo info) throws Exception {
		super.verifyToAuditFalse(ctx, conn, info);
		
		RechargeRecordInfo rInfo = (RechargeRecordInfo) info;
		CustomerInfo cusInfo = rInfo.getCustomerInfo();
		cusInfo = (CustomerInfo) IHttpCustomer.getInstance().getInfo(conn, cusInfo.getId());
		BigDecimal balance = cusInfo.getBalance();
		balance = balance != null ? balance : BigDecimal.ZERO;
		BigDecimal amt = rInfo.getFactAmt();
		if(balance.compareTo(amt) < 0)
			throw new BizException("客户余额为：" + balance + "， 不能反审核该单据！");
	}
	
	protected void sendSaleSms(Context ctx, Connection conn,  RechargeRecordInfo info) throws Exception
	{
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
		
		
		BigDecimal amt = info.getAmt().setScale(2, BigDecimal.ROUND_DOWN);
		BigDecimal giveAmt = info.getGiveAmt().setScale(2, BigDecimal.ROUND_DOWN);
		
		StringBuffer msg = new StringBuffer();
		msg.append("您于");
		msg.append(DateTimeUtil.getDateStr(info.getBizdate(), "yyyy年MM月dd日"));
		msg.append("在" + ctx.getShopInfo().getName());
		msg.append("充值" + amt.toString() + "元");
		if(giveAmt.compareTo(BigDecimal.ZERO) != 0)
		{
			msg.append("(赠送" + giveAmt.toString() + "元)");
		}
		msg.append(",当前余额️" + cInfo.getBalance() + "");
		
		System.out.println(msg.toString());
		
		SmsRecordInfo smsInfo = new SmsRecordInfo();
		smsInfo.setPhone(phone);
		smsInfo.setCtx(msg.toString());
		IHttpSmsRecord.getInstance().setAuditTrue(ctx, smsInfo);
	}
}
