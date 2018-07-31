package bill.advancerecord;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.Date;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.bill.BillInfo;
import bean.bill.IHttpBill;
import bill.salary.IHttpSalary;
import bill.salary.SalaryInfo;
import common.db.Context;
import common.util.DateTimeUtil;
import exp.BizException;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpAdvanceRecord")
public class IHttpAdvanceRecord extends IHttpBill {
       
    /**
     * @see IHttp#IHttp()
     */
    public IHttpAdvanceRecord() {
        super();
    }
	
	public String getbtStr() {
		return "0041";
	}

	public String setAuditTrue(Context ctx, Connection conn, BillInfo model) throws Exception {
		return super.setAuditTrue(ctx, conn, model);
	}

	public String setAuditFalse(Context ctx, Connection conn, BillInfo model) throws Exception {
		AdvanceRecordInfo info = (AdvanceRecordInfo) model;
		if(info.getIsBalance())
		{
			throw new BizException("当前单据已结算， 不能改单");
		}
		return super.setAuditFalse(ctx, conn, info);
	}

	protected void verifyToAuditTrue(Context ctx, Connection conn, BillInfo model) throws Exception {
		AdvanceRecordInfo info = (AdvanceRecordInfo) model;
		String personId = info.getPersonInfo().getId();
		Date dt = info.getBizdate();
		
		IHttpSalary iHttpSalary = IHttpSalary.getInstance();
		Date df = iHttpSalary.getThisSalaryDateFrom(ctx, conn, personId);
		SalaryInfo salaryInfo = iHttpSalary.getPersonSalary(ctx, personId, DateTimeUtil.getDateStr(df), DateTimeUtil.getDateStr(dt));
		
		BigDecimal salaryAmt = salaryInfo.getPercentAmt().subtract(salaryInfo.getPunishAmt());
		BigDecimal amt = info.getAmt();
		amt = amt != null ? amt : BigDecimal.ZERO;
		if(BigDecimal.ZERO.compareTo(amt) >= 0)
			throw new BizException("预支金额不能小于0！");
		
		if(salaryAmt.compareTo(amt) < 0)
			throw new BizException("预支金额不能大于当前结算工资金额（不含底工资和补贴）！");
		
		super.verifyToAuditTrue(ctx, conn, info);
	}

	protected void verifyToAuditFalse(Context ctx, Connection conn, BillInfo model) throws Exception {
		AdvanceRecordInfo info = (AdvanceRecordInfo) model;
		if(info.getIsBalance())
			throw new BizException("当前预支记录已结算， 不能改单！");
		super.verifyToAuditFalse(ctx, conn, info);
	}

	
	
}
