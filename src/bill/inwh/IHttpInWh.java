package bill.inwh;

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
@WebServlet("/IHttpInWh")
public class IHttpInWh extends IHttpBill {
     protected static IHttpInWh http = null;
     
    /**
     * @see IHttp#IHttp()
     */
    public IHttpInWh() {
        super();
    }
    
    public static IHttpInWh getInstance()
    {
    	if(http == null)
    		http = new IHttpInWh();
    	return http;
    }
	
	public String getbtStr() {
		return "0018";
	}

	public String setAuditTrue(Context ctx, Connection conn, BillInfo info) throws Exception {
		InWhInfo inInfo = (InWhInfo) info;
		String shopId = inInfo.getShopId();
		String mId = inInfo.getMaterialInfo().getId();
		String unitId = inInfo.getUnitInfo().getId();
		BigDecimal qty = inInfo.getQty();
		qty = qty != null ? qty : BigDecimal.ZERO;
		ShopStockUtil.updateShopStock(ctx, conn, shopId, mId, unitId, qty);
		
		return super.setAuditTrue(ctx, conn, info);
	}

	public String setAuditFalse(Context ctx, Connection conn, BillInfo info) throws Exception {
		InWhInfo inInfo = (InWhInfo) info;
		String shopId = inInfo.getShopId();
		String mId = inInfo.getMaterialInfo().getId();
		String unitId = inInfo.getUnitInfo().getId();
		BigDecimal qty = inInfo.getQty();
		qty = qty != null ? qty : BigDecimal.ZERO;
		ShopStockUtil.updateShopStock(ctx, conn, shopId, mId, unitId, qty.negate());
		
		return super.setAuditFalse(ctx, conn, info);
	}
	
	
}
