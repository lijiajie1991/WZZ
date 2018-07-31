package bill.attendrecord;

import java.sql.Connection;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.bill.BillInfo;
import bean.bill.IHttpBill;
import common.db.Context;
import exp.BizException;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpAttendRecord")
public class IHttpAttendRecord extends IHttpBill {
       
    /**
     * @see IHttp#IHttp()
     */
    public IHttpAttendRecord() {
        super();
    }
	
	public String getbtStr() {
		return "0025";
	}

	public String setAuditTrue(Context ctx, Connection conn, BillInfo model) throws Exception {
		return super.setAuditTrue(ctx, conn, model);
	}

	public String setAuditFalse(Context ctx, Connection conn, BillInfo model) throws Exception {
		AttendRecordInfo info = (AttendRecordInfo) model;
		if(info.getIsBalance())
		{
			throw new BizException("当前单据已结算， 不能改单");
		}
		return super.setAuditFalse(ctx, conn, info);
	}

	
	
}
