package bill.outwh;

import java.math.BigDecimal;
import java.sql.Connection;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.bill.BillInfo;
import bean.bill.IHttpBill;
import common.db.Context;
import common.util.ShopStockUtil;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpOutWh")
public class IHttpOutWh extends IHttpBill {
	protected static IHttpOutWh http = null;
    /**
     * @see IHttp#IHttp()
     */
    public IHttpOutWh() {
        super();
    }
    
    public static IHttpOutWh getInstance()
    {
    	if(http == null)
    		http = new IHttpOutWh();
    	return http;
    }
	
	public String getbtStr() {
		return "0019";
	}

	public String setAuditTrue(Context ctx, Connection conn, BillInfo info) throws Exception {
		OutWhInfo outInfo = (OutWhInfo) info;
		String shopId = outInfo.getShopId();
		String mId = outInfo.getMaterialInfo().getId();
		String unitId = outInfo.getUnitInfo().getId();
		BigDecimal qty = outInfo.getQty();
		qty = qty != null ? qty : BigDecimal.ZERO;
		ShopStockUtil.updateShopStock(ctx, conn, shopId, mId, unitId, qty.negate());
		
		return super.setAuditTrue(ctx, conn, info);
	}

	public String setAuditFalse(Context ctx, Connection conn, BillInfo info) throws Exception {
		OutWhInfo outInfo = (OutWhInfo) info;
		String shopId = outInfo.getShopId();
		String mId = outInfo.getMaterialInfo().getId();
		String unitId = outInfo.getUnitInfo().getId();
		BigDecimal qty = outInfo.getQty();
		qty = qty != null ? qty : BigDecimal.ZERO;
		ShopStockUtil.updateShopStock(ctx, conn, shopId, mId, unitId, qty);
		
		return super.setAuditFalse(ctx, conn, info);
	}
	
	
}
