/**
  * @说明 
  * @作者 黎嘉杰 
  * @日期 2016年9月25日 下午9:00:18 
  */
package common.util;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.Date;
import java.util.LinkedList;

import bas.material.MaterialInfo;
import bas.measureunit.MeasureUnitInfo;
import bas.stock.ShopStockInfo;
import bean.Info;
import common.db.Context;
import common.db.FilterInfo;
import common.db.FilterItemInfo;
import common.db.SortInfo;
import em.CompareType;

/**
  * @说明 
  * @作者 黎嘉杰 
  * @日期 2016年9月25日 下午9:00:18 
  */
public class ShopStockUtil {
	
	public static void updateShopStock(Context ctx, Connection conn, String shopId, String mId, String unitId, BigDecimal qty) throws Exception
	{
		qty = qty != null ? qty : BigDecimal.ZERO;
		if(BigDecimal.ZERO.compareTo(qty) == 0)
			return;
		
		MeasureUnitInfo unitInfo = (MeasureUnitInfo) BeanUtil.getInfo(conn, MeasureUnitInfo.class, unitId);
		BigDecimal coe = unitInfo.getCoe();
		coe = coe != null ? coe : BigDecimal.ZERO;
		qty = qty.multiply(coe);
		
		FilterInfo filter = new FilterInfo();
		filter.addItem(new FilterItemInfo("a.shopId", CompareType.EQUAL, shopId));
		filter.addItem(new FilterItemInfo("material.id", CompareType.EQUAL, mId));
		filter.setMkr("#0 and #1");
		SortInfo order = new SortInfo();
		LinkedList<Info> infoList = BeanUtil.getInfoList(conn, ShopStockInfo.class, filter, order);
		
		ShopStockInfo info = null;
		if(infoList != null && !infoList.isEmpty())
			info = (ShopStockInfo) infoList.getFirst();
		
		if(info == null)
		{
			MaterialInfo mInfo = new MaterialInfo();
			mInfo.setId(mId);
			
			info = new ShopStockInfo();
			info.setShopId(shopId);
			info.setMaterialInfo(mInfo);
			info.setQty(BigDecimal.ZERO);
			info.setQty(qty);
			info.setUpTime(DateTimeUtil.getDateStr(new Date(), DateTimeUtil.secondFormat));
			BeanUtil.save(ctx, conn, info);
		}
		else
		{
			BigDecimal stockQty = info.getQty();
			stockQty = stockQty != null ? stockQty : BigDecimal.ZERO;
			stockQty = stockQty.add(qty);
			info.setQty(stockQty);
			info.setUpTime(DateTimeUtil.getDateStr(new Date(), DateTimeUtil.secondFormat));
			BeanUtil.save(ctx, conn, info);
		}
	}
}
