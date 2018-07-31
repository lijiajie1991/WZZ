package bill.shoppayment;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.LinkedList;

import javax.servlet.annotation.WebServlet;

import bas.shopbalance.IHttpShopBalance;
import bas.shopbalance.ShopBalanceInfo;
import bas.sys.shop.ShopInfo;
import bean.IHttp;
import bean.Info;
import bean.bill.BillInfo;
import bean.bill.IHttpBill;
import common.db.Context;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpShopPayMent")
public class IHttpShopPayMent extends IHttpBill {
       
    /**
     * @see IHttp#IHttp()
     */
    public IHttpShopPayMent() {
        super();
    }
	
	public String getbtStr() {
		return "0029";
	}

	public String setAuditTrue(Context ctx, Connection conn, BillInfo model) throws Exception {
		ShopPayMentInfo info = (ShopPayMentInfo) model;
		ShopInfo shopInfo = info.getCustomerShopInfo();
		
		ShopBalanceInfo sbInfo = null;
		LinkedList<Info> list = IHttpShopBalance.getInstance().getInfoList(conn, "a.fcustomershopId = '" + shopInfo.getId() + "'", "");
		if(list != null && list.size() > 0)
		{
			sbInfo = (ShopBalanceInfo) list.get(0);
			
		}
		
		if(sbInfo == null)
		{
			sbInfo = new ShopBalanceInfo();
			sbInfo.setNumber(this.getNewNumber(ctx, conn));
			sbInfo.setName(shopInfo.getName());
		}
		sbInfo.setCustomerShopInfo(shopInfo);
		BigDecimal sbAmt = sbInfo.getAmt();
		sbAmt = sbAmt != null ? sbAmt : BigDecimal.ZERO;
		
		BigDecimal pAmt = info.getAmt();
		pAmt = pAmt != null ? pAmt : BigDecimal.ZERO;
		
		BigDecimal amt = sbAmt = sbAmt.add(pAmt);
		sbInfo.setAmt(amt);
		sbInfo.setIsSms(info.getIsSms());
		IHttpShopBalance.getInstance().save(ctx, conn, sbInfo);
		
		String pk = super.setAuditTrue(ctx, conn, info);
		return pk;
	}

	public String setAuditFalse(Context ctx, Connection conn, BillInfo model) throws Exception {
		ShopPayMentInfo info = (ShopPayMentInfo) model;
		ShopInfo shopInfo = info.getCustomerShopInfo();
		
		ShopBalanceInfo sbInfo = null;
		LinkedList<Info> list = IHttpShopBalance.getInstance().getInfoList(conn, "a.fcustomershopId = '" + shopInfo.getId() + "'", "");
		if(list != null && list.size() > 0)
		{
			sbInfo = (ShopBalanceInfo) list.get(0);
		}
		sbInfo = sbInfo != null ? sbInfo : new ShopBalanceInfo();
		sbInfo.setCustomerShopInfo(shopInfo);
		BigDecimal sbAmt = sbInfo.getAmt();
		sbAmt = sbAmt != null ? sbAmt : BigDecimal.ZERO;
		
		BigDecimal pAmt = info.getAmt();
		pAmt = pAmt != null ? pAmt : BigDecimal.ZERO;
		
		BigDecimal amt = sbAmt = sbAmt.subtract(pAmt);
		sbInfo.setAmt(amt);
		sbInfo.setIsSms(info.getIsSms());
		IHttpShopBalance.getInstance().save(ctx, conn, sbInfo);
		
		String pk = super.setAuditFalse(ctx, conn, info);
		return pk;
	}
}
