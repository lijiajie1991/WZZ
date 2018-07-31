package bill.invcheck;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import bas.material.MaterialInfo;
import bas.measureunit.MeasureUnitInfo;
import bean.IHttp;
import bean.Info;
import bean.bill.BillInfo;
import bean.bill.IHttpBill;
import bill.outwh.IHttpOutWh;
import bill.outwh.OutWhInfo;
import common.db.ConnectDb;
import common.db.Context;
import common.util.BigDecimalUtil;
import common.util.DateTimeUtil;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpInvCheck")
public class IHttpInvCheck extends IHttpBill {
	private static final long serialVersionUID = 1L;
	
	protected static IHttpInvCheck http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpInvCheck() {
        super();
    }
	
	public String getbtStr() {
		return "0038";
	}
	
	public static IHttpInvCheck getInstance()
    {
    	if(http == null)
    		http = new IHttpInvCheck();
    	return http;
    }

	public String setAuditTrue(Context ctx, Connection conn, BillInfo model) throws Exception {
		InvCheckInfo info = (InvCheckInfo) model;
		
		HashMap<String, BigDecimal> matMap = new HashMap<String, BigDecimal>();
		LinkedList<InvCheckEntryInfo> infoList = getInvCheckEntryList(ctx, conn, info.getShopId(), DateTimeUtil.getDateStr(info.getBizdate()));
		for(InvCheckEntryInfo entryInfo : infoList)
		{
			matMap.put(entryInfo.getMaterialInfo().getId(), entryInfo.getThisQty());
		}
		
		infoList = info.getEntryList();
		for(InvCheckEntryInfo entryInfo : infoList)
		{
			String mId = entryInfo.getMaterialInfo().getId();
			BigDecimal qty = matMap.get(mId);
			BigDecimal lostQty = qty.subtract(entryInfo.getCheckQty());
			
			entryInfo.setThisQty(qty);
			entryInfo.setLostQty(lostQty);
		}
		
		String pk = super.setAuditTrue(ctx, conn, info);
		
		IHttpOutWh iHttpOutWh = IHttpOutWh.getInstance();
		LinkedList<InvCheckEntryInfo> list = info.getEntryList();
		int size = list.size();
		for(int i = 0; i < size; i++)
		{
			InvCheckEntryInfo entryInfo = list.get(i);
			
			OutWhInfo whInfo = new OutWhInfo();
			whInfo.setShopId(info.getShopId());
			whInfo.setAdminShopId(info.getAdminShopId());
			whInfo.setBizdate(info.getBizdate());
			whInfo.setOutStockDate(info.getBizdate());
			whInfo.setSourceBillId(pk);
			whInfo.setMaterialInfo(entryInfo.getMaterialInfo());
			whInfo.setUnitInfo(entryInfo.getUnitInfo());
			whInfo.setQty(entryInfo.getLostQty());
			iHttpOutWh.setAuditTrue(ctx, conn, whInfo);
		}
		return pk;
	}

	public String setAuditFalse(Context ctx, Connection conn, BillInfo info) throws Exception {
		IHttpOutWh iHttpOutWh = IHttpOutWh.getInstance();
		LinkedList<Info> infoList = iHttpOutWh.getInfoList(conn, "a.fsourceBillId = '" + info.getId() + "'", "");
		for(Info whInfo : infoList)
		{
			iHttpOutWh.setAuditFalse(ctx, conn, (BillInfo) whInfo);
			iHttpOutWh.delete(ctx, conn, whInfo.getId());
		}
		
		String pk = super.setAuditFalse(ctx, conn, info);
		return pk;
	}
	
	public LinkedList<InvCheckEntryInfo> getInvCheckEntryList(Context ctx, String shopId, String dateStr) throws Exception {
		Connection conn = null;
		try {
			conn = ConnectDb.Connect();
			LinkedList<InvCheckEntryInfo> list = getInvCheckEntryList(ctx, conn, shopId, dateStr);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	}
	
	public LinkedList<InvCheckEntryInfo> getInvCheckEntryList(Context ctx, Connection conn, String shopId, String dateStr) throws Exception {
		LinkedList<InvCheckEntryInfo> infoList = new LinkedList<InvCheckEntryInfo>();
		QueryRunner qRunner = new QueryRunner();
		StringBuffer sql = null;
		
		//获取最大的盘点单日期
		sql = new StringBuffer();
		String maxDateStr = "2016-01-01";
		sql.append("select\n");
		sql.append("ifnull(DATE_FORMAT(max(c.fbizdate), '%Y-%m-%d'), '2016-01-01') as maxDateStr\n");
		sql.append("from bill_invcheck c\n");
		sql.append("where c.fisAuditTrue = 1 and c.fshopId = '" + shopId + "' \n");
		Map<String, Object> maxDate = qRunner.query(conn, sql.toString(), new MapHandler());
		if(maxDate != null && maxDate.containsKey("maxDateStr"))
		{
			maxDateStr = (String) maxDate.get("maxDateStr");
		}
		
		
		sql = new StringBuffer();
		sql.append("select\n");
		sql.append("m.fid as mId,\n");
		sql.append("m.fnumber as mNumber,\n");
		sql.append("m.fname as mName,\n");

		sql.append("u.fid as uId,\n");
		sql.append("u.fnumber as uNumber,\n");
		sql.append("u.fname as uName,\n");

		sql.append("sum(wh.qty / ifnull(u.fcoe, 1)) as qty \n");
		sql.append("from ( \n");
		sql.append("select \n");
		sql.append("ie.fmaterialId as mId, \n");
		sql.append("ifnull(ie.fcheckQty, 0) * ifnull(u.fcoe, 1) as qty \n");
		sql.append("from bill_invcheck i\n");
		sql.append("inner join bill_invcheck_entry ie on i.fid = ie.fparentid \n");
		sql.append("left join base_measureunit u on u.fid = ie.funitId \n");
		sql.append("where DATE_FORMAT(i.fbizdate, '%Y-%m-%d') = '" + maxDateStr + "' \n");
		sql.append("and i.fisAuditTrue = 1 \n");
		sql.append("and i.fshopId = '" + shopId + "' \n");
		sql.append("union all \n");
		sql.append("select \n");
		sql.append("inwh.fmaterialId as mId, \n");
		sql.append("ifnull(inwh.fqty, 0) * ifnull(u.fcoe, 1) * 1 as qty \n");
		sql.append("from bill_inwh inwh \n");
		sql.append("left join base_measureunit u on u.fid = inwh.funitId \n");
		sql.append("where inwh.fshopId = '" + shopId + "' \n");
		sql.append("and inwh.fisAuditTrue = 1 \n");
		sql.append("and DATE_FORMAT(inwh.finStockDate, '%Y-%m-%d') > '" + maxDateStr + "' \n");
		sql.append("and DATE_FORMAT(inwh.finStockDate, '%Y-%m-%d') <= '" + dateStr + "' \n");
		sql.append("union all \n");
		sql.append("select \n");
		sql.append("outwh.fmaterialId as mId, \n");
		sql.append("ifnull(outwh.fqty, 0) * ifnull(u.fcoe, 1) * (-1) as qty \n");
		sql.append("from bill_outwh outwh \n");
		sql.append("left join base_measureunit u on u.fid = outwh.funitId \n");
		sql.append("where outwh.fshopId = '" + shopId + "' \n");
		sql.append("and outwh.fisAuditTrue = 1 \n");
		sql.append("and DATE_FORMAT(outwh.foutStockDate, '%Y-%m-%d') > '" + maxDateStr + "' \n");
		sql.append("and DATE_FORMAT(outwh.foutStockDate, '%Y-%m-%d') <= '" + dateStr + "' \n");
		sql.append(") wh \n");
		sql.append("inner join base_material m on m.fid = wh.mId \n");
		sql.append("left join base_measureunit u on u.fid = m.funitId \n");
		sql.append("group by m.fid, m.fnumber, m.fname, u.fid, u.fnumber, u.fname \n");
		sql.append("order by m.fnumber  \n");

		List<Map<String, Object>> list = qRunner.query(conn, sql.toString(), new MapListHandler());
		if(list != null && !list.isEmpty())
		{
			Map<String, Object> map = list.get(0);
			InvCheckEntryInfo info = new InvCheckEntryInfo();
			
			MaterialInfo mInfo = new MaterialInfo();
			mInfo.setId((String) map.get("mId"));
			mInfo.setNumber((String) map.get("mNumber"));
			mInfo.setName((String) map.get("mName"));
			info.setMaterialInfo(mInfo);
			
			MeasureUnitInfo unitInfo = new MeasureUnitInfo();
			unitInfo.setId((String) map.get("uId"));
			unitInfo.setNumber((String) map.get("uNumber"));
			unitInfo.setName((String) map.get("uName"));
			info.setUnitInfo(unitInfo);
			
			BigDecimal qty = BigDecimalUtil.getBigDecimalVal(map.get("qty"));
			info.setThisQty(qty);
			info.setCheckQty(qty);
			info.setLostQty(BigDecimal.ZERO);
			
			infoList.addLast(info);
		}
		
		return infoList;
	}
	
	
	
}
