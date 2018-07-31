package bas.shopbalance;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.Map;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;

import bas.sys.shop.IHttpShop;
import bas.sys.shop.ShopInfo;
import bean.IHttp;
import bean.base.IHttpBase;
import common.db.ConnectDb;
import common.db.Context;
import common.util.BigDecimalUtil;
import em.ShopStatusType;
import em.ShopType;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpShopBalance")
public class IHttpShopBalance extends IHttpBase {
	protected static IHttpShopBalance http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpShopBalance() {
        super();
    }
	
	public String getbtStr() {
		return "0028";
	}
	
	public static IHttpShopBalance getInstance() {
		if (http == null)
			http = new IHttpShopBalance();
		return http;
	}
	
	public ShopStatusType getShopStatus(Context ctx, String shopId) throws Exception
	{
		Connection conn = null;
		try {
			conn = ConnectDb.Connect();
			return getShopStatus(ctx, conn, shopId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	}
	
	public ShopStatusType getShopStatus(Context ctx, Connection conn, String shopId) throws Exception
	{
		QueryRunner qRunner = new QueryRunner();
		
		ShopInfo shopInfo = (ShopInfo) IHttpShop.getInstance().getInfo(conn, shopId);
		ShopType st = shopInfo.getSt();
		if(st == ShopType.STORE)
			shopId = shopInfo.getParentInfo().getId();
		
		StringBuffer sql = new StringBuffer();
		sql.append("select \n");
		sql.append("( \n");
		sql.append("select \n");
		sql.append("count(c.fid) \n");
		sql.append("from base_shop c \n");
		sql.append("where c.fparentId = s.fid \n");
		sql.append(") as qty, \n");
		sql.append("sb.fprice as price, \n");
		sql.append("sb.famt as amt \n");
		sql.append(" \n");
		sql.append("from base_shop s \n");
		sql.append("inner join base_shopbalance sb on s.fid = sb.fcustomerShopId \n");
		sql.append("where s.fid = '" + shopId + "' \n");

		Map<String, Object> map = qRunner.query(conn, sql.toString(), new MapHandler());
		if(map != null)
		{
			BigDecimal qty = BigDecimalUtil.getBigDecimalVal(map.get("qty"));
			BigDecimal price = BigDecimalUtil.getBigDecimalVal(map.get("price"));
			BigDecimal amt = BigDecimalUtil.getBigDecimalVal(map.get("amt"));
			
			BigDecimal fee = qty.multiply(price);
			if(amt.compareTo(fee) >= 0)
				return ShopStatusType.NORMAL;
			
			if(amt.compareTo(BigDecimal.ZERO) <= 0)
				return ShopStatusType.ARREARS;
			
			if(amt.compareTo(fee) < 0)
				return ShopStatusType.WARNNING;
		}
		
		return ShopStatusType.ARREARS;
	}
}
