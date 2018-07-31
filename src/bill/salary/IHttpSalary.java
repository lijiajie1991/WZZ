package bill.salary;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import bas.percent.PercentEntryInfo;
import bas.person.IHttpPerson;
import bas.person.PersonInfo;
import bean.IHttp;
import bean.Info;
import bean.bill.BillInfo;
import bean.bill.IHttpBill;
import common.db.ConnectDb;
import common.db.Context;
import common.db.FilterInfo;
import common.db.FilterItemInfo;
import common.db.SortInfo;
import common.db.SortItemInfo;
import common.util.BeanUtil;
import common.util.BigDecimalUtil;
import common.util.BooleanUtil;
import common.util.DateTimeUtil;
import em.AttendanceDaysType;
import em.AttendanceType;
import em.CompareType;
import em.PercentType;
import em.SortType;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpSalary")
public class IHttpSalary extends IHttpBill {
	private static final long serialVersionUID = 1L;
	
	protected static IHttpSalary http = null;
       
    /**
     * @see IHttp#IHttp()
     */
    public IHttpSalary() {
        super();
    }
    
    public static IHttpSalary getInstance()
    {
    	if(http == null)
    		http = new IHttpSalary();
    	return http;
    }
	
	public String getbtStr() {
		return "0026";
	}
	
	public String setAuditTrue(Context ctx, Connection conn, BillInfo info) throws Exception {
		String pk = super.setAuditTrue(ctx, conn, info);
		
		SalaryInfo sInfo = (SalaryInfo) info;
		String personId = sInfo.getPersonInfo().getId();
		String df = DateTimeUtil.getDateStr(sInfo.getDateFrom());
		String dt = DateTimeUtil.getDateStr(sInfo.getDateTo());
		updateBillStatus(ctx, conn, personId, df, dt, true);
		
		return pk;
	}

	public String setAuditFalse(Context ctx, Connection conn, BillInfo info) throws Exception {
		String pk = super.setAuditFalse(ctx, conn, info);
		
		SalaryInfo sInfo = (SalaryInfo) info;
		String personId = sInfo.getPersonInfo().getId();
		String df = DateTimeUtil.getDateStr(sInfo.getDateFrom());
		String dt = DateTimeUtil.getDateStr(sInfo.getDateTo());
		updateBillStatus(ctx, conn, personId, df, dt, false);
		
		return pk;
	}
	
	public void updateBillStatus(Context ctx, Connection conn, String personId, String df, String dt, boolean isAudit) throws Exception {
	
		QueryRunner qRunner = new QueryRunner();
		StringBuffer sql = null;
		
		int isBalance = isAudit ? 1 : 0;
		int filterIsBalance = isAudit ? 0 : 1;
		
		sql = new StringBuffer();
		sql.append("update bill_service \n");
		sql.append("set fisbalance = " + isBalance + " \n");
		sql.append("where fisaudittrue = 1 \n");
		sql.append("and fisbalance = " + filterIsBalance + " \n");
		sql.append("and date_format(fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		sql.append("and fpersonId = '" + personId + "' \n");
		qRunner.update(conn, sql.toString());
		
		sql = new StringBuffer();
		sql.append("update bill_sale \n");
		sql.append("set fisbalance = " + isBalance + " \n");
		sql.append("where fisaudittrue = 1 \n");
		sql.append("and fisbalance = " + filterIsBalance + " \n");
		sql.append("and date_format(fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		sql.append("and fpersonId = '" + personId + "' \n");
		qRunner.update(conn, sql.toString());
		
		sql = new StringBuffer();
		sql.append("update bill_salemutil \n");
		sql.append("set fisbalance = " + isBalance + " \n");
		sql.append("where fisaudittrue = 1 \n");
		sql.append("and fisbalance = " + filterIsBalance + " \n");
		sql.append("and date_format(fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		sql.append("and fpersonId = '" + personId + "' \n");
		qRunner.update(conn, sql.toString());
		
		sql = new StringBuffer();
		sql.append("update bill_attendrecord \n");
		sql.append("set fisbalance = " + isBalance + " \n");
		sql.append("where fisaudittrue = 1 \n");
		sql.append("and fisbalance = " + filterIsBalance + " \n");
		sql.append("and date_format(fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		sql.append("and fpersonId = '" + personId + "' \n");
		qRunner.update(conn, sql.toString());
		
		sql = new StringBuffer();
		sql.append("update bill_advancerecord \n");
		sql.append("set fisbalance = " + isBalance + " \n");
		sql.append("where fisaudittrue = 1 \n");
		sql.append("and fisbalance = " + filterIsBalance + " \n");
		sql.append("and date_format(fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		sql.append("and fpersonId = '" + personId + "' \n");
		qRunner.update(conn, sql.toString());
	}

	public Date getThisSalaryDateFrom(Context ctx, String personId) throws Exception
	{
		Connection conn = null;
		try {
			//调用方法保存
			conn = ConnectDb.Connect();
			return getThisSalaryDateFrom(ctx, conn, personId);
			//提交
		} catch (Exception e) {
			e.printStackTrace();
			if(conn != null)
				conn.rollback();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	}
	
	public Date getThisSalaryDateFrom(Context ctx, Connection conn, String personId) throws Exception
	{
		QueryRunner qRunner = new QueryRunner();
		StringBuffer sql = null;
		List<String> list = null;
		
		sql = new StringBuffer();
		sql.append("select \n");
		sql.append("date_format(s.fdateto, '%Y-%m-%d') as lastDate \n");
		sql.append("from bill_salary s \n");
		sql.append("where s.fisaudittrue = 1 \n");
		sql.append("and s.fpersonId = '" + personId + "' \n");

		
		list = qRunner.query(conn, sql.toString(), new ColumnListHandler<String>("lastDate"));
		if(list != null && !list.isEmpty())
		{
			String dateStr = list.get(0);
			Date d = DateTimeUtil.parseStr(dateStr, DateTimeUtil.dayFormat);
			d = DateTimeUtil.getDateAfterDays(d, 1);
			return d;
		}
//		
//		sql = new StringBuffer();
//		sql.append("select \n");
//		sql.append("date_format(p.fcreatetime, '%Y-%m-%d') as lastDate \n");
//		sql.append("from base_person p\n");
//		sql.append("where p.fid = '" + personId + "' \n");
//
//		list = qRunner.query(conn, sql.toString(), new ColumnListHandler<String>("lastDate"));
//		if(list != null && !list.isEmpty())
//		{
//			String dateStr = list.get(0);
//			dateStr = dateStr != null && !"".equals(dateStr) ? dateStr : "2016-12-01";
//			Date d = DateTimeUtil.parseStr(dateStr, DateTimeUtil.dayFormat);
//			return d;
//		}
		
		return DateTimeUtil.getDateAfterDays(new Date(), -30);
	}
	
	public void setAllAuditTrue(Context ctx, LinkedList<SalaryInfo> list) throws Exception
	{

		//创建数据库连接
		Connection conn = null;
		try {
			//调用方法保存
			conn = ConnectDb.Connect();
			setAllAuditTrue(ctx, conn, list);
			//提交
		} catch (Exception e) {
			e.printStackTrace();
			if(conn != null)
				conn.rollback();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	
	}
	
	public void setAllAuditTrue(Context ctx, Connection conn, LinkedList<SalaryInfo> list) throws Exception
	{
		if(list == null || list.isEmpty())
			return;
		
		int size = list.size();
		for(int i = 0; i < size; i++)
		{
			SalaryInfo info = list.get(i);
			this.setAuditTrue(ctx, conn, info);
		}
	}
	
	
	public LinkedList<SalaryInfo> getPersonSalaryList(Context ctx) throws Exception
	{
		//创建数据库连接
		Connection conn = null;
		try {
			//调用方法保存
			conn = ConnectDb.Connect();
			return getPersonSalaryList(ctx, conn);
			//提交
		} catch (Exception e) {
			e.printStackTrace();
			if(conn != null)
				conn.rollback();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	}
	
	public LinkedList<SalaryInfo> getPersonSalaryList(Context ctx, Connection conn) throws Exception
	{
		LinkedList<SalaryInfo> infoList = new LinkedList<SalaryInfo>();
		
		SortInfo order = new SortInfo();
		order.addItem(new SortItemInfo("a.useCount", SortType.DESC));
		
		FilterInfo personfilter = new FilterInfo();
		personfilter.addItem(new FilterItemInfo("a.shopId", CompareType.EQUAL, ctx.getShopId()));
		personfilter.addItem(new FilterItemInfo("a.pst", CompareType.EQUAL, "0"));
		personfilter.setMkr("#0 and #1");
		LinkedList<Info> personList = IHttpPerson.getInstance().getInfoList(conn, personfilter, order);
		int size = personList.size();
		for(int i = 0; i < size; i++)
		{
			Info info = personList.get(i);
			Date df = this.getThisSalaryDateFrom(ctx, conn, info.getId());
			String dt = DateTimeUtil.getDateAfterDaysStr(new Date(), -1);
			SalaryInfo salaryInfo = getPersonSalary(ctx, conn, info.getId(), DateTimeUtil.getDateStr(df), dt);
			infoList.addLast(salaryInfo);
		}
		
		return infoList;
	}
	
	public LinkedList<SalaryInfo> getPersonSalaryList(Context ctx, String df, String dt) throws Exception
	{
		//创建数据库连接
		Connection conn = null;
		try {
			//调用方法保存
			conn = ConnectDb.Connect();
			return getPersonSalaryList(ctx, conn, df, dt);
			//提交
		} catch (Exception e) {
			e.printStackTrace();
			if(conn != null)
				conn.rollback();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	}
	
	public LinkedList<SalaryInfo> getPersonSalaryList(Context ctx, Connection conn, String df, String dt) throws Exception
	{
		LinkedList<SalaryInfo> infoList = new LinkedList<SalaryInfo>();
		SortInfo order = new SortInfo();
		order.addItem(new SortItemInfo("a.useCount", SortType.DESC));
		
		FilterInfo personfilter = new FilterInfo();
		personfilter.addItem(new FilterItemInfo("a.shopId", CompareType.EQUAL, ctx.getShopId()));
		personfilter.addItem(new FilterItemInfo("a.pst", CompareType.EQUAL, "0"));
		personfilter.setMkr("#0 and #1");
		LinkedList<Info> personList = IHttpPerson.getInstance().getInfoList(conn, personfilter, order);
		int size = personList.size();
		for(int i = 0; i < size; i++)
		{
			Info info = personList.get(i);
			SalaryInfo salaryInfo = getPersonSalary(ctx, conn, info.getId(), df, dt);
			infoList.addLast(salaryInfo);
		}
		
		return infoList;
	}
	
	public SalaryInfo getPersonSalary(Context ctx, String personId, String df, String dt) throws Exception
	{
		//创建数据库连接
		Connection conn = null;
		try {
			//调用方法保存
			conn = ConnectDb.Connect();
			return getPersonSalary(ctx, conn, personId, df, dt);
			//提交
		} catch (Exception e) {
			e.printStackTrace();
			if(conn != null)
				conn.rollback();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
	
	}
	
	public SalaryInfo getPersonSalary(Context ctx, Connection conn, String personId, String df, String dt) throws Exception
	{
		PersonInfo personInfo = (PersonInfo) IHttpPerson.getInstance().getInfo(conn, personId);
		
		SalaryInfo info = new SalaryInfo();
		info.setNumber(this.getNewNumber(ctx, conn));
		info.setPersonInfo(personInfo);
		info.setAmt(BigDecimal.ZERO);
		info.setPercentAmt(BigDecimal.ZERO);
		info.setPunishAmt(BigDecimal.ZERO);
		info.setOtherAmt(BigDecimal.ZERO);
		info.setBizdate(new Date());
		info.setDateFrom(DateTimeUtil.parseStr(df, DateTimeUtil.dayFormat));
		info.setDateTo(DateTimeUtil.parseStr(dt, DateTimeUtil.dayFormat));
		
		
		LinkedList<SalaryEntryInfo> list = info.getEntryList();
		list.clear();
		
		HashMap<String, PercentEntryInfo> perMap = new HashMap<String, PercentEntryInfo>();
		QueryRunner qRunner = new QueryRunner();
		StringBuffer sql = null;
		
		String jobId = null;
		sql = new StringBuffer();
		sql.append("select \n");
		sql.append("j.fid as jobId, \n");
		sql.append("j.fsalary as salary, \n");
		sql.append("j.fbounty as bounty \n");
		sql.append("from base_person p \n");
		sql.append("inner join base_job j on j.fid = p.fjobId \n");
		sql.append("where p.fid = '" + personId +"' \n");
		Map<String, Object> jobMap = qRunner.query(conn, sql.toString(), new MapHandler());
		if(jobMap != null)
		{
			jobId = (String) jobMap.get("jobId");
			
			if(jobMap.containsKey("salary") && jobMap.get("salary") != null)
				info.setSalary(BigDecimalUtil.getBigDecimalVal(jobMap.get("salary")));
			if(jobMap.containsKey("bounty") && jobMap.get("bounty") != null)
				info.setBounty(BigDecimalUtil.getBigDecimalVal(jobMap.get("bounty")));
		}
		
		

		sql = new StringBuffer();
		sql.append("select \n");
		sql.append("j.fid as job_id, \n");
		sql.append("j.fnumber as job_number, \n");
		sql.append("j.fname as job_name, \n");
		sql.append("pe.fpt as pt, \n");
		sql.append("pe.fval as val, \n");
		sql.append("pe.fotVal as otVal, \n");
		sql.append("pe.fspecVal as specVal, \n");
		sql.append("pe.fremark as remark, \n");
		sql.append("p.fid as pId \n");
		sql.append("from base_job j \n");
		sql.append("inner join base_percent_entry pe on pe.fjobId = j.fid \n");
		sql.append("inner join base_percent p on p.fid = pe.fparentId \n");
		sql.append("where j.fid = '" + jobId + "' \n");

		List<Map<String, Object>> perList = qRunner.query(conn, sql.toString(), new MapListHandler());
		if(perList != null && !perList.isEmpty())
		{
			for(Map<String, Object> map : perList)
			{
				String pId = (String) map.get("pId");
				PercentEntryInfo perInfo = (PercentEntryInfo) BeanUtil.getInfoFromMap(PercentEntryInfo.class, map);
				perMap.put(pId, perInfo);
			}
		}
		
		sql = new StringBuffer();
		sql.append("select \n");
		sql.append("sum(s.ffactAmt) as factAmt, \n");
		sql.append("p.fpcId as pcId, \n");
		sql.append("s.fisot as isOt, \n");
		sql.append("s.fisSpec as isSpec, \n");
		sql.append("p.fname as name \n");
		sql.append("from bill_service s \n");
		sql.append("inner join base_project p on p.fid = s.fprojectId \n");
		sql.append("where s.fisaudittrue = 1 \n");
		sql.append("and s.fisbalance = 0 \n");
		sql.append("and date_format(s.fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(s.fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		sql.append("and s.fpersonId = '" + personId + "' \n");
		sql.append("group by p.fname, p.fpcId, s.fisot, s.fisSpec \n");
		sql.append("union all \n");
		sql.append("select \n");
		sql.append("sum(s.ffactAmt) as factAmt, \n");
		sql.append("m.fpcId as pcId, \n");
		sql.append("0 as isOt, \n");
		sql.append("0 as isSpec, \n");
		sql.append("m.fname as name \n");
		sql.append("from bill_sale s \n");
		sql.append("inner join base_material m on m.fid = s.fmaterialId \n");
		sql.append("where s.fisaudittrue = 1 \n");
		sql.append("and s.fisbalance = 0 \n");
		sql.append("and date_format(s.fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(s.fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		sql.append("and s.fpersonId = '" + personId + "' \n");
		sql.append("group by m.fname, m.fpcId \n");
		List<Map<String, Object>> pmList = qRunner.query(conn, sql.toString(), new MapListHandler());
		if(pmList != null && !pmList.isEmpty())
		{
			for(Map<String, Object> map : pmList)
			{
				String pcId = (String) map.get("pcId");
				String name = (String) map.get("name");
				boolean isOt = BooleanUtil.getBooleanVal(map.get("isOt"));
				boolean isSpec = BooleanUtil.getBooleanVal(map.get("isSpec"));
				BigDecimal totalAmt = BigDecimalUtil.getBigDecimalVal(map.get("factAmt"));
				BigDecimal amt = BigDecimal.ZERO;
				
				if(isOt)
					name = name + "(加班)";
				if(isSpec)
					name = name + "(点牌)";
				
				
				String remark = null;
				if(perMap.containsKey(pcId))
				{
					PercentEntryInfo perInfo = perMap.get(pcId);
					PercentType pt = perInfo.getPt();
					BigDecimal val = BigDecimalUtil.getBigDecimalVal(perInfo.getVal());
					BigDecimal otVal = BigDecimalUtil.getBigDecimalVal(perInfo.getOtVal());
					BigDecimal specVal = BigDecimalUtil.getBigDecimalVal(perInfo.getSpecVal());
					if(pt == PercentType.AMT)
					{
						amt = val;
						amt = isOt ? amt.add(otVal) : amt;
						amt = isSpec ? amt.add(specVal) : amt;
						
						remark = "按固定金额： " + amt + "提成";
					}
					else if(pt == PercentType.PERCENT)
					{
						val = isOt ? val.add(otVal) : val;
						val = isSpec ? val.add(specVal) : val;
						
						remark = "按比例 " + val + "%提成";
						amt = totalAmt.multiply(val).divide(new BigDecimal(100), 2, BigDecimal.ROUND_HALF_UP);
					}
					else
					{
						remark = "不参与提成";
					}
				}
				
				SalaryEntryInfo entryInfo = new SalaryEntryInfo();
				entryInfo.setName(name);
				entryInfo.setRemark(remark);
				entryInfo.setAmt(amt);
				entryInfo.setTotalAmt(totalAmt);
				list.addLast(entryInfo);
				
				info.setPercentAmt(info.getPercentAmt().add(amt));
			}
		}
		
		sql = new StringBuffer();
		sql.append("select \n");
		sql.append("(select \n");
		sql.append("max(de.famt) \n");
		sql.append("from base_attendance d \n");
		sql.append("inner join base_attendance_entry de on d.fid = de.fparentId \n");
		sql.append("where d.fisenable = 1 \n");
		sql.append("and de.fjobId = '" + jobId + "' \n");
		sql.append("and d.fat = r.fat \n");
		sql.append("and d.fadt = r.fadt \n");
		sql.append(") as price, \n");
		sql.append("r.fqty as qty, \n");
		sql.append("r.fat as at, \n");
		sql.append("r.fadt as adt \n");
		sql.append("from bill_attendrecord r \n");
		sql.append("where r.fisaudittrue = 1 \n");
		sql.append("and r.fisbalance = 0 \n");
		sql.append("and r.fpersonId = '" + personId + "' \n");
		sql.append("and date_format(r.fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(r.fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		List<Map<String, Object>> adrList = qRunner.query(conn, sql.toString(), new MapListHandler());
		if(adrList != null && !adrList.isEmpty())
		{
			for(Map<String, Object> map : adrList)
			{
				BigDecimal price = BigDecimalUtil.getBigDecimalVal(map.get("price"));
				BigDecimal qty = BigDecimalUtil.getBigDecimalVal(map.get("qty"));
				int atVal = BigDecimalUtil.getIntegerVal(map.get("at"));
				int adtVal = BigDecimalUtil.getIntegerVal(map.get("adt"));
				BigDecimal amt = price.multiply(qty);
				
				AttendanceType at = AttendanceType.valueOf(atVal);
				AttendanceDaysType adt = AttendanceDaysType.valueOf(adtVal);
				
				String remark = "统计类型：" + adt.getName() + " 次数：" + qty;
				
				SalaryEntryInfo entryInfo = new SalaryEntryInfo();
				entryInfo.setName(at.getName());
				entryInfo.setRemark(remark);
				entryInfo.setAmt(amt.negate());
				entryInfo.setTotalAmt(amt);
				list.addLast(entryInfo);
				
				info.setPunishAmt(info.getPunishAmt().add(amt));
			}
		}
		
		
		sql = new StringBuffer();
		sql.append("select \n");
		sql.append("r.famt as amt \n");
		sql.append("from bill_advancerecord r \n");
		sql.append("where r.fisaudittrue = 1 \n");
		sql.append("and r.fisbalance = 0 \n");
		sql.append("and r.fpersonId = '" + personId + "' \n");
		sql.append("and date_format(r.fbizdate, '%Y-%m-%d') >= '" + df + "' \n");
		sql.append("and date_format(r.fbizdate, '%Y-%m-%d') <= '" + dt + "' \n");
		List<Map<String, Object>> yzList = qRunner.query(conn, sql.toString(), new MapListHandler());
		if(yzList != null && !yzList.isEmpty())
		{
			for(Map<String, Object> map : yzList)
			{
				BigDecimal amt = BigDecimalUtil.getBigDecimalVal(map.get("amt"));
				String remark = "预支：" + amt + "元";
				
				SalaryEntryInfo entryInfo = new SalaryEntryInfo();
				entryInfo.setName("预支");
				entryInfo.setRemark(remark);
				entryInfo.setAmt(amt.negate());
				entryInfo.setTotalAmt(amt);
				list.addLast(entryInfo);
				
				info.setPunishAmt(info.getPunishAmt().add(amt));
			}
		}
		
		info.setAmt(info.getSalary().add(info.getBounty()).add(info.getPercentAmt()).subtract(info.getPunishAmt()));
		
		return info;
	}
}
