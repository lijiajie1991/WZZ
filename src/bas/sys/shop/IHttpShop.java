package bas.sys.shop;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.Date;
import java.util.LinkedList;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.DbUtils;

import bas.attendance.AttendanceEntryInfo;
import bas.attendance.AttendanceInfo;
import bas.attendance.IHttpAttendance;
import bas.customer.CustomerInfo;
import bas.customer.IHttpCustomer;
import bas.job.IHttpJob;
import bas.job.JobInfo;
import bas.material.IHttpMaterial;
import bas.material.MaterialInfo;
import bas.material.group.IHttpMaterialGroup;
import bas.material.group.MaterialGroupInfo;
import bas.percent.IHttpPercent;
import bas.percent.PercentEntryInfo;
import bas.percent.PercentInfo;
import bas.person.IHttpPerson;
import bas.person.PersonInfo;
import bas.project.IHttpProject;
import bas.project.ProjectInfo;
import bas.project.group.IHttpProjectGroup;
import bas.project.group.ProjectGroupInfo;
import bas.supplier.IHttpSupplier;
import bas.supplier.SupplierInfo;
import bas.sys.userrole.IHttpUserRole;
import bas.sys.userrole.UserRoleInfo;
import bas.vip.IHttpVip;
import bas.vip.VipInfo;
import bean.IHttp;
import bean.IHttpSys;
import bean.Info;
import bill.price.IHttpPrice;
import bill.price.MaterialPriceEntryInfo;
import bill.price.PriceInfo;
import bill.price.ProjectPriceEntryInfo;
import common.db.ConnectDb;
import common.db.Context;
import common.util.DateTimeUtil;
import em.AttendanceDaysType;
import em.AttendanceType;
import em.PercentType;
import em.PersonStatusType;
import em.ShopType;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpShop")
public class IHttpShop extends IHttpSys {
	protected static IHttpShop http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpShop() {
        super();
    }
    
    public static IHttpShop getInstance()
    {
    	if(http == null)
    		http = new IHttpShop();
    	return http;
    }
    
    public String save(Context ctx, Connection conn, Info info) throws Exception {
		ShopInfo sInfo = (ShopInfo) info;
		ShopInfo parentInfo = sInfo.getParentInfo();
		if(parentInfo != null && parentInfo.getId() != null)
		{
			parentInfo = (ShopInfo) this.getInfo(conn, parentInfo.getId());
			String longNumber = parentInfo.getLongnumber() + "!" + sInfo.getNumber();
			sInfo.setLongnumber(longNumber);
			
			String longName = parentInfo.getLongname() + "!" + sInfo.getName();
			sInfo.setLongname(longName);
		}
		else
		{
			sInfo.setLongnumber(sInfo.getNumber());
			sInfo.setLongname(sInfo.getName());
		}
		
		
		return super.save(ctx, conn, sInfo);
	}
    
    /**
      * @功能描述 获取指定店铺下的所有分店
      * @作者 黎嘉杰 
      * @日期 2016年9月10日 下午11:35:15 
      * @参数 
      * @返回
      */
    public LinkedList<ShopInfo> getChildrenShopList(String shopId) throws Exception
    {
    	LinkedList<Info> list = this.getInfoList("fparentId = '" + shopId + "'", "longnumber");
    	LinkedList<ShopInfo> shopList = new LinkedList<ShopInfo>();
    	for(Info info : list)
    	{
    		shopList.addLast((ShopInfo) info);
    	}
    	return shopList;
    }
	
	public String getbtStr() {
		return "0004";
	}

	public void initShopData(Context ctx, String shopId) throws Exception
	{
		Connection conn = null;
		try {
			//调用方法保存
			conn = ConnectDb.Connect();
			conn.setAutoCommit(false);
			initShopData(ctx, conn, shopId);
			conn.commit();
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
	
	public void initShopData(Context ctx, Connection conn, String shopId) throws Exception
	{
		ShopInfo shopInfo = (ShopInfo) this.getInfo(conn, shopId);
		ShopType st = shopInfo.getSt();
		String adminShopId = shopInfo.getParentInfo().getId();
		
		ctx.setShopInfo(shopInfo);
		if(st == ShopType.ADMIN)
		{
			IHttpUserRole iUserRole = IHttpUserRole.getInstance();
			
			UserRoleInfo adminRole = (UserRoleInfo) iUserRole.getInfo(conn, "0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749");
			adminRole.setShopId(shopId);
			adminRole.setAdminShopId(adminShopId);
			adminRole.setName(shopInfo.getName() + "管理员");
			adminRole.setNumber(iUserRole.getNewNumber(ctx, conn));
			adminRole.setId(null);
			iUserRole.save(ctx, conn, adminRole);
			
			UserRoleInfo syyRole = (UserRoleInfo) iUserRole.getInfo(conn, "0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09");
			syyRole.setShopId(shopId);
			syyRole.setAdminShopId(adminShopId);
			syyRole.setName(shopInfo.getName() + "收银员");
			syyRole.setNumber(iUserRole.getNewNumber(ctx, conn));
			syyRole.setId(null);
			iUserRole.save(ctx, conn, syyRole);
			
			IHttpMaterialGroup iMaterialGroup = IHttpMaterialGroup.getInstance();
			MaterialGroupInfo mgInfo1 = new MaterialGroupInfo();
			mgInfo1.setName("美甲类产品");
			mgInfo1.setShopId(shopId);
			mgInfo1.setAdminShopId(shopId);
			mgInfo1.setNumber(iMaterialGroup.getNewNumber(ctx, conn));
			iMaterialGroup.save(ctx, conn, mgInfo1);
			
			MaterialGroupInfo mgInfo2 = new MaterialGroupInfo();
			mgInfo2.setName("纹绣类产品");
			mgInfo2.setShopId(shopId);
			mgInfo2.setAdminShopId(shopId);
			mgInfo2.setNumber(iMaterialGroup.getNewNumber(ctx, conn));
			iMaterialGroup.save(ctx, conn, mgInfo2);
			
			IHttpProjectGroup iProjectGroup = IHttpProjectGroup.getInstance();
			ProjectGroupInfo pgInfo1 = new ProjectGroupInfo();
			pgInfo1.setName("美甲类项目");
			pgInfo1.setShopId(shopId);
			pgInfo1.setAdminShopId(shopId);
			pgInfo1.setNumber(iProjectGroup.getNewNumber(ctx, conn));
			iProjectGroup.save(ctx, conn, pgInfo1);
			
			ProjectGroupInfo pgInfo2 = new ProjectGroupInfo();
			pgInfo2.setName("纹绣类项目");
			pgInfo2.setShopId(shopId);
			pgInfo2.setAdminShopId(shopId);
			pgInfo2.setNumber(iProjectGroup.getNewNumber(ctx, conn));
			iProjectGroup.save(ctx, conn, pgInfo2);
			
			IHttpVip iVip = IHttpVip.getInstance();
			VipInfo vip1 = new VipInfo();
			vip1.setName("金卡会员");
			vip1.setShopId(shopId);
			vip1.setAdminShopId(shopId);
			vip1.setNumber(iVip.getNewNumber(ctx, conn));
			iVip.save(ctx, conn, vip1);
			
			VipInfo vip2 = new VipInfo();
			vip2.setName("银卡会员");
			vip2.setShopId(shopId);
			vip2.setAdminShopId(shopId);
			vip2.setNumber(iVip.getNewNumber(ctx, conn));
			iVip.save(ctx, conn, vip2);
			
			IHttpSupplier iSupplier = IHttpSupplier.getInstance();
			SupplierInfo supInfo = new SupplierInfo();
			supInfo.setNumber(iSupplier.getNewNumber(ctx, conn));
			supInfo.setName("供应商");
			supInfo.setPhone("020-123456");
			supInfo.setAddress("广东省广州市白云区");
			supInfo.setRemark("供应XXX产品");
			supInfo.setShopId(shopId);
			supInfo.setAdminShopId(shopId);
			iSupplier.save(ctx, conn, supInfo);
		}
		else
		{
			IHttpJob iJob = IHttpJob.getInstance();
			JobInfo job1 = new JobInfo();
			job1.setName("美甲师");
			job1.setShopId(shopId);
			job1.setAdminShopId(shopId);
			job1.setNumber(iJob.getNewNumber(ctx, conn));
			job1.setSalary(new BigDecimal(1000));
			job1.setBounty(new BigDecimal(100));
			String jobId1 = iJob.save(ctx, conn, job1);
			job1.setId(jobId1);
			
			JobInfo job2 = new JobInfo();
			job2.setName("纹绣师");
			job2.setShopId(shopId);
			job2.setAdminShopId(shopId);
			job2.setNumber(iJob.getNewNumber(ctx, conn));
			job2.setSalary(new BigDecimal(2000));
			job2.setBounty(new BigDecimal(200));
			String jobId2 = iJob.save(ctx, conn, job2);
			job2.setId(jobId2);
			
			JobInfo job3 = new JobInfo();
			job3.setName("实习生");
			job3.setShopId(shopId);
			job3.setAdminShopId(shopId);
			job3.setNumber(iJob.getNewNumber(ctx, conn));
			job3.setSalary(new BigDecimal(0));
			job3.setBounty(new BigDecimal(100));
			String jobId3 = iJob.save(ctx, conn, job3);
			job3.setId(jobId3);
			
			IHttpAttendance iAttendance = IHttpAttendance.getInstance();
			for(AttendanceType at : AttendanceType.values())
			{
				for(AttendanceDaysType adt : AttendanceDaysType.values())
				{
					AttendanceInfo aInfo = new AttendanceInfo();
					aInfo.setNumber(iAttendance.getNewNumber(ctx, conn));
					aInfo.setName(at.getName() + "/" + adt.getName());
					aInfo.setAt(at);
					aInfo.setAdt(adt);
					aInfo.setShopId(shopId);
					aInfo.setAdminShopId(adminShopId);
					aInfo.setIsEnable(true);
					
					LinkedList<AttendanceEntryInfo> atList = aInfo.getAtList();
					AttendanceEntryInfo e1 = new AttendanceEntryInfo();
					e1.setJobInfo(job1);
					e1.setAmt(BigDecimal.ZERO);
					atList.addLast(e1);
					
					AttendanceEntryInfo e2 = new AttendanceEntryInfo();
					e1.setJobInfo(job2);
					e1.setAmt(BigDecimal.ZERO);
					atList.addLast(e2);
					
					AttendanceEntryInfo e3 = new AttendanceEntryInfo();
					e1.setJobInfo(job3);
					e1.setAmt(BigDecimal.ZERO);
					atList.addLast(e3);
					
					iAttendance.save(ctx, conn, aInfo);
				}
			}
			
			IHttpPercent iPercent = IHttpPercent.getInstance();
			PercentInfo pcInfo = new PercentInfo();
			pcInfo.setNumber(iPercent.getNewNumber(ctx, conn));
			pcInfo.setName("提成比例");
			pcInfo.setShopId(shopId);
			pcInfo.setAdminShopId(adminShopId);
			LinkedList<PercentEntryInfo> perList = pcInfo.getPerList();
			PercentEntryInfo pe1 = new PercentEntryInfo();
			pe1.setJobInfo(job1);
			pe1.setPt(PercentType.PERCENT);
			pe1.setVal(new BigDecimal(10));
			perList.addLast(pe1);
			
			PercentEntryInfo pe2 = new PercentEntryInfo();
			pe2.setJobInfo(job2);
			pe2.setPt(PercentType.PERCENT);
			pe2.setVal(new BigDecimal(10));
			perList.addLast(pe2);
			
			PercentEntryInfo pe3 = new PercentEntryInfo();
			pe3.setJobInfo(job1);
			pe3.setPt(PercentType.PERCENT);
			pe3.setVal(new BigDecimal(10));
			perList.addLast(pe3);
			
			String pcId = iPercent.save(ctx, conn, pcInfo);
			pcInfo.setId(pcId);
			
			IHttpPerson iPerson = IHttpPerson.getInstance();
			PersonInfo pInfo1 = new PersonInfo();
			pInfo1.setNumber(iPerson.getNewNumber(ctx, conn));
			pInfo1.setName(job1.getName() + "1号");
			pInfo1.setJobInfo(job1);
			pInfo1.setPersonId("0000001");
			pInfo1.setBirth("2000-01-01");
			pInfo1.setPst(PersonStatusType.IN);
			pInfo1.setShopId(shopId);
			pInfo1.setAdminShopId(adminShopId);
			iPerson.save(ctx, conn, pInfo1);
			
			PersonInfo pInfo2 = new PersonInfo();
			pInfo2.setNumber(iPerson.getNewNumber(ctx, conn));
			pInfo2.setName(job2.getName() + "1号");
			pInfo2.setJobInfo(job2);
			pInfo2.setPersonId("0000002");
			pInfo2.setBirth("2000-01-01");
			pInfo2.setPst(PersonStatusType.IN);
			pInfo2.setShopId(shopId);
			pInfo2.setAdminShopId(adminShopId);
			iPerson.save(ctx, conn, pInfo2);
			
			PersonInfo pInfo3 = new PersonInfo();
			pInfo3.setNumber(iPerson.getNewNumber(ctx, conn));
			pInfo3.setName(job3.getName() + "1号");
			pInfo3.setJobInfo(job3);
			pInfo3.setPersonId("0000003");
			pInfo3.setBirth("2000-01-01");
			pInfo3.setPst(PersonStatusType.IN);
			pInfo3.setShopId(shopId);
			pInfo3.setAdminShopId(adminShopId);
			iPerson.save(ctx, conn, pInfo3);
			
			
			IHttpProject iProject = IHttpProject.getInstance();
			LinkedList<Info> progList = IHttpProjectGroup.getInstance().getInfoList(conn, "a.fshopId = '" + adminShopId + "'", "");
			ProjectInfo proInfo1 = new ProjectInfo();
			proInfo1.setNumber(iProject.getNewNumber(ctx, conn));
			proInfo1.setName("项目1号");
			proInfo1.setPtInfo((ProjectGroupInfo) progList.get(0));
			proInfo1.setPcInfo(pcInfo);
			proInfo1.setPrice(new BigDecimal(100));
			proInfo1.setIsEnable(true);
			proInfo1.setShopId(shopId);
			proInfo1.setAdminShopId(adminShopId);
			String proId = iProject.save(ctx, conn, proInfo1);
			proInfo1.setId(proId);
			
			IHttpMaterial iMaterial = IHttpMaterial.getInstance();
			LinkedList<Info> mgList = IHttpMaterialGroup.getInstance().getInfoList(conn, "a.fshopId = '" + adminShopId + "'", "");
			MaterialInfo mInfo1 = new MaterialInfo();
			mInfo1.setNumber(iMaterial.getNewNumber(ctx, conn));
			mInfo1.setName("项目1号");
			mInfo1.setMgInfo((MaterialGroupInfo) mgList.get(0));
			mInfo1.setPcInfo(pcInfo);
			mInfo1.setPrice(new BigDecimal(100));
			mInfo1.setIsEnable(true);
			mInfo1.setShopId(shopId);
			mInfo1.setAdminShopId(adminShopId);
			String mId = iMaterial.save(ctx, conn, mInfo1);
			mInfo1.setId(mId);
			
			IHttpPrice iPrice = IHttpPrice.getInstance();
			PriceInfo prInfo = new PriceInfo();
			prInfo.setNumber(iPrice.getNewNumber(ctx, conn));
			prInfo.setDateFrom(new Date());
			prInfo.setDateTo(DateTimeUtil.parseStr("2030-01-01", DateTimeUtil.dayFormat));
			
			LinkedList<ProjectPriceEntryInfo> proList = prInfo.getProjectList();
			ProjectPriceEntryInfo pre = new ProjectPriceEntryInfo();
			pre.setProjectInfo(proInfo1);
			pre.setPrice(proInfo1.getPrice());
			pre.setIsFloat(true);
			pre.setRemark("是否浮动指的是当前项目在相应单据上的单价是否不能修改");
			proList.addLast(pre);
			
			LinkedList<MaterialPriceEntryInfo> matList = prInfo.getMaterialList();
			MaterialPriceEntryInfo mre = new MaterialPriceEntryInfo();
			mre.setMaterialInfo(mInfo1);
			mre.setPrice(proInfo1.getPrice());
			mre.setIsFloat(true);
			mre.setRemark("是否浮动指的是当前产品在相应单据上的单价是否不能修改");
			matList.addLast(mre);
			
			iPrice.save(ctx, conn, prInfo);
			
			
			LinkedList<Info> vipList = IHttpVip.getInstance().getInfoList(conn, "a.fshopId = '" + adminShopId + "'", "");
			IHttpCustomer iCustomer = IHttpCustomer.getInstance();
			CustomerInfo cInfo = new CustomerInfo();
			cInfo.setNumber(iCustomer.getNewNumber(ctx, conn));
			cInfo.setName("金卡客户");
			cInfo.setVipInfo((VipInfo) vipList.get(0));
			cInfo.setPhone("13801235984");
			cInfo.setBalance(BigDecimal.ZERO);
			cInfo.setPoints(BigDecimal.ZERO);
			cInfo.setIsEnable(true);
			cInfo.setBirth("1980-01-01");
			cInfo.setShopId(shopId);
			cInfo.setAdminShopId(adminShopId);
			iCustomer.save(ctx, conn, cInfo);
		}
	}
}
























