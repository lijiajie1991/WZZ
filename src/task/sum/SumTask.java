/**
  * @说明 
  * @作者 黎嘉杰 
  * @日期 2016年10月7日 下午1:03:52 
  */
package task.sum;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimerTask;
import java.util.UUID;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import bas.sys.shop.ShopInfo;
import bas.sys.user.UserInfo;
import bill.smsrecord.IHttpSmsRecord;
import bill.smsrecord.SmsRecordInfo;
import common.db.ConnectDb;
import common.db.Context;
import common.util.BigDecimalUtil;
import common.util.DateTimeUtil;
import em.PayType;

/**
  * @说明 
  * @作者 黎嘉杰 
  * @日期 2016年10月7日 下午1:03:52 
  */
public class SumTask extends TimerTask{

	/**
	  * @功能描述
	  * @作者 黎嘉杰 
	  * @日期 2016年10月7日 下午1:04:22 
	  * @参数 
	  * @返回
	  */
	public void run() {
		System.out.println("开始执行任务");
		
		Connection conn = null; 
		try{
			UserInfo userInfo = new UserInfo();
			userInfo.setId("001");
			Context ctx = new Context();
			ctx.setUserInfo(userInfo);
			
			int hour = Integer.parseInt(DateTimeUtil.getDateStr(new Date(), "HH"));
			
			conn = ConnectDb.Connect();
			QueryRunner qRunner = new QueryRunner();
			
			String logSql = "insert into sys_log(fid, fremark, fcreatetime) values(?, ?, now())";
			qRunner.update(conn, logSql, new Object[]{UUID.randomUUID().toString(), "执行任务"});
			
			StringBuffer shopSql = new StringBuffer();
			shopSql.append("select \n");
			shopSql.append("sum(s.amt) as amt, \n");
			shopSql.append("s.pt as pt \n");
			shopSql.append("from ( \n");
			shopSql.append("select \n");
			shopSql.append("sum(s.ffactamt) as amt, \n");
			shopSql.append("s.fpt as pt \n");
			shopSql.append("from bill_sale s \n");
			shopSql.append("where s.fisAuditTrue = 1 \n");
			shopSql.append("and s.fshopId = '@shopId' \n");
			shopSql.append("and DATE_FORMAT(s.fbizdate,'%Y-%m-%d') >= '@dateStr' \n");
			shopSql.append("and DATE_FORMAT(s.fbizdate,'%Y-%m-%d') <= '@dateStr' \n");
			shopSql.append("group by s.fpt \n");
			shopSql.append("union all \n");
			shopSql.append("select \n");
			shopSql.append("sum(s.ffactamt) as amt, \n");
			shopSql.append("s.fpt as pt \n");
			shopSql.append("from bill_service s \n");
			shopSql.append("where s.fisAuditTrue = 1 \n");
			shopSql.append("and s.fshopId = '@shopId' \n");
			shopSql.append("and DATE_FORMAT(s.fbizdate,'%Y-%m-%d') >= '@dateStr' \n");
			shopSql.append("and DATE_FORMAT(s.fbizdate,'%Y-%m-%d') <= '@dateStr' \n");
			shopSql.append("group by s.fpt \n");
			shopSql.append(") s \n");
			shopSql.append("group by s.pt \n");
			shopSql.append("order by s.pt \n");
			
			StringBuffer chargeSql = new StringBuffer();
			chargeSql.append("select \n");
			chargeSql.append("sum(r.famt) as amt\n");
			chargeSql.append("from bill_rechargerecord r\n");
			chargeSql.append("where r.fisAuditTrue = 1\n");
			chargeSql.append("and r.fshopId = '@shhopId'\n");
			chargeSql.append("and DATE_FORMAT(r.fbizdate,'%Y-%m-%d') >= '@dateStr'\n");
			chargeSql.append("and DATE_FORMAT(r.fbizdate,'%Y-%m-%d') <= '@dateStr'\n");
			
			//查找设置为当前时间发送营业情况的店铺
			StringBuffer sql =  new StringBuffer();
			sql.append("select * from (\n");
			sql.append("select \n");
			sql.append("s.fid as shopId, \n");
			sql.append("s.fparentId as spId, \n");
			sql.append("s.fname as shopName, \n");
			sql.append("p.fshopPhone as phone, \n");
			sql.append("case when p.fday = 0 \n");
			sql.append("then DATE_FORMAT(DATE_ADD(now(), INTERVAL -1 DAY), '%Y-%m-%d') \n");
			sql.append("else DATE_FORMAT(now(), '%Y-%m-%d') end as dateStr \n");
			sql.append("from base_shopparam p \n");
			sql.append("inner join base_shop s on s.fid = p.fshopId \n");
			sql.append("where p.fisBossSms = 1 \n");
			sql.append("and p.fhour = " + hour + ") p\n");
			sql.append("where not exists(");
			sql.append("select \n");
			sql.append("r.fid \n");
			sql.append("from sys_sumrecord r \n");
			sql.append("where r.fshopId = p.shopId \n");
			sql.append("and r.fdateStr = p.dateStr) \n");
			
			List<Map<String, Object>> list = qRunner.query(conn, sql.toString(), new MapListHandler());
			for(Map<String, Object> map : list)
			{
				String shopId = (String) map.get("shopId");
				String spId = (String) map.get("spId");
				String shopName = (String) map.get("shopName");
				String phone = (String) map.get("phone");
				String dateStr = (String) map.get("dateStr");
				
				StringBuffer msg = new StringBuffer();
				msg.append(shopName);
				msg.append(dateStr);
				
				BigDecimal cashAmt = BigDecimal.ZERO;
				BigDecimal shopAmt = BigDecimal.ZERO;
				
				
				String realSql = shopSql.toString().replace("@shopId", shopId).replace("@dateStr", dateStr);
				List<Map<String, Object>> shopDataList = qRunner.query(conn, realSql, new MapListHandler());
				for(Map<String, Object> sd : shopDataList)
				{
					BigDecimal amt = BigDecimalUtil.getBigDecimalVal(sd.get("amt"));
					PayType pt = PayType.valueOf(Integer.parseInt(sd.get("pt").toString()));
					//if(amt.compareTo(BigDecimal.ZERO) != 0)
					//	msg.append(pt.getName() + amt.setScale(0, BigDecimal.ROUND_DOWN) + ";");
					
					shopAmt = shopAmt.add(amt);
					if(pt == PayType.Cash)
						cashAmt = cashAmt.add(amt);
				}
				
				
				realSql = chargeSql.toString().replace("@shopId", shopId).replace("@dateStr", dateStr);
				List<Map<String, Object>> chargeList = qRunner.query(conn, realSql, new MapListHandler());
				if(!chargeList.isEmpty())
				{
					Map<String, Object> chargeMap = chargeList.get(0);
					if(chargeMap.containsKey("amt"))
					{
						BigDecimal amt = BigDecimalUtil.getBigDecimalVal(chargeMap.get("amt"));
						//if(amt.compareTo(BigDecimal.ZERO) != 0)
						//	msg.append("充值金额：" + amt.setScale(0, BigDecimal.ROUND_DOWN) + ";");
						
						shopAmt = shopAmt.add(amt);
						cashAmt = cashAmt.add(amt);
					}
				}
				
				msg.append("营业额：" + shopAmt.setScale(0, BigDecimal.ROUND_DOWN) + ";");
				msg.append("总现金：" + cashAmt.setScale(0, BigDecimal.ROUND_DOWN) + ";");
				
				
				if(shopDataList.isEmpty() && chargeList.isEmpty())
					continue;
				
				String srId = UUID.randomUUID().toString();
				String srSql = "insert into sys_sumrecord(fid, fshopId, fdateStr) values(?, ?, ?)";
				qRunner.update(conn, srSql, new Object[]{srId, shopId, dateStr});
				
				ShopInfo spInfo = new ShopInfo();
				spInfo.setId(spId);
				
				ShopInfo shopInfo = new ShopInfo();
				shopInfo.setId(shopId);
				shopInfo.setParentInfo(spInfo);
				shopInfo.setName(shopName);
				ctx.setShopInfo(shopInfo);
				
				SmsRecordInfo info = new SmsRecordInfo();
				info.setNumber(IHttpSmsRecord.getInstance().getNewNumber(ctx));
				info.setShopId(shopId);
				info.setPhone(phone);
				info.setCtx(msg.toString());
				IHttpSmsRecord.getInstance().setAuditTrue(ctx, info);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
			if(conn != null)
			{
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
		System.out.println("完成任务");
	}

}
