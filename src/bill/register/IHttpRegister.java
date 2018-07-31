package bill.register;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.Date;
import java.util.LinkedList;

import javax.servlet.annotation.WebServlet;

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
import bas.measureunit.IHttpMeasureUnit;
import bas.measureunit.MeasureUnitInfo;
import bas.percent.IHttpPercent;
import bas.percent.PercentEntryInfo;
import bas.percent.PercentInfo;
import bas.person.IHttpPerson;
import bas.person.PersonInfo;
import bas.project.IHttpProject;
import bas.project.ProjectInfo;
import bas.project.group.IHttpProjectGroup;
import bas.project.group.ProjectGroupInfo;
import bas.shopbalance.IHttpShopBalance;
import bas.shopbalance.ShopBalanceInfo;
import bas.supplier.IHttpSupplier;
import bas.supplier.SupplierInfo;
import bas.sys.param.IHttpParam;
import bas.sys.param.ParamInfo;
import bas.sys.shop.IHttpShop;
import bas.sys.shop.ShopInfo;
import bas.sys.shopparam.IHttpShopParam;
import bas.sys.shopparam.ShopParamInfo;
import bas.sys.user.IHttpUser;
import bas.sys.user.UserInfo;
import bas.sys.user.UserRoleEntryInfo;
import bas.sys.user.UserShopEntryInfo;
import bas.sys.userrole.IHttpUserRole;
import bas.sys.userrole.UserRoleInfo;
import bas.vip.IHttpVip;
import bas.vip.VipInfo;
import bean.IHttp;
import bean.Info;
import bean.bill.BillInfo;
import bean.bill.IHttpBill;
import bill.price.IHttpPrice;
import bill.price.MaterialPriceEntryInfo;
import bill.price.PriceInfo;
import bill.price.ProjectPriceEntryInfo;
import common.db.Context;
import common.util.DateTimeUtil;
import em.AttendanceDaysType;
import em.AttendanceType;
import em.PercentType;
import em.PersonStatusType;
import em.ShopType;
import exp.BizException;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpRegister")
public class IHttpRegister extends IHttpBill {
	protected static IHttpRegister http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpRegister() {
        super();
    }
	
	public String getbtStr() {
		return "0032";
	}
	
	public static IHttpRegister getInstance()
    {
    	if(http == null)
    		http = new IHttpRegister();
    	return http;
    }

	public String setAuditTrue(Context ctx, Connection conn, BillInfo model) throws Exception {
		RegisterInfo info = (RegisterInfo) model;
		String remark = initShopData(ctx, conn, info);
		info.setRemark(remark);
		String pk = super.setAuditTrue(ctx, conn, info);
		return pk;
	}

	public String setAuditFalse(Context ctx, Connection conn, BillInfo model) throws Exception {
		throw new BizException("不能取消注册");
	}
	
	public String initShopData(Context ctx, Connection conn, RegisterInfo rInfo) throws Exception
	{
		IHttpShop iShop = IHttpShop.getInstance();
		IHttpParam iParam = IHttpParam.getInstance();
		IHttpUserRole iUserRole = IHttpUserRole.getInstance();
		IHttpMaterialGroup iMaterialGroup = IHttpMaterialGroup.getInstance();
		IHttpSupplier iSupplier = IHttpSupplier.getInstance();
		IHttpUser iUser = IHttpUser.getInstance();
		IHttpShopBalance iShopBalance = IHttpShopBalance.getInstance();
		IHttpMeasureUnit iHttpMeasureUnit = IHttpMeasureUnit.getInstance();
		IHttpShopParam iHttpShopParam = IHttpShopParam.getInstance();
		
		ShopInfo curShopInfo = ctx.getShopInfo();
		
		//注册信息
		StringBuffer remark = new StringBuffer();
		
		//创建管理店铺
		ShopInfo adminShopInfo = new ShopInfo();
		adminShopInfo.setNumber(iShop.getNewNumber(ctx, conn));
		adminShopInfo.setName(rInfo.getShopName());
		adminShopInfo.setAddress(rInfo.getShopAddress());
		adminShopInfo.setPhone(rInfo.getShopPhone());
		adminShopInfo.setPft(rInfo.getPft());
		adminShopInfo.setSt(ShopType.ADMIN);
		String adminShopId = iShop.save(ctx, conn, adminShopInfo);
		adminShopInfo.setId(adminShopId);
		
		adminShopInfo.setParentInfo(adminShopInfo);
		ctx.setShopInfo(adminShopInfo);
		

		ShopBalanceInfo sb = new ShopBalanceInfo();
		sb.setCustomerShopInfo(adminShopInfo);
		sb.setAmt(new BigDecimal(30));
		sb.setIsSms(false);
		sb.setPrice(new BigDecimal(30));
		iShopBalance.save(ctx, conn, sb);
		
		//创建老板手机号码参数
		ParamInfo pInfo = new ParamInfo();
		pInfo.setNumber("adminphone");
		pInfo.setName("老板手机号码");
		pInfo.setVal(rInfo.getShopPhone());
		String pId = iParam.save(ctx, conn, pInfo);		
		pInfo.setId(pId);

		//创建管理员角色
		UserRoleInfo adminRoleInfo = (UserRoleInfo) iUserRole.getInfo(conn, "0002-97a6bb8c-0333-4ab7-a9c1-e0e9adf7f749");
		adminRoleInfo.setShopId(adminShopId);
		adminRoleInfo.setAdminShopId(adminShopId);
		adminRoleInfo.setName(rInfo.getShopName() + "管理员");
		adminRoleInfo.setNumber(iUserRole.getNewNumber(ctx, conn));
		adminRoleInfo.setId(null);
		String adminRoleId = iUserRole.save(ctx, conn, adminRoleInfo);
		adminRoleInfo.setId(adminRoleId);
		
		//创建收银员角色
		UserRoleInfo syyRoleInfo = (UserRoleInfo) iUserRole.getInfo(conn, "0002-4fda8a48-97f5-45e0-aeff-7ed0ae885a09");
		syyRoleInfo.setShopId(adminShopId);
		syyRoleInfo.setAdminShopId(adminShopId);
		syyRoleInfo.setName(rInfo.getShopName() + "收银员");
		syyRoleInfo.setNumber(iUserRole.getNewNumber(ctx, conn));
		syyRoleInfo.setId(null);
		String syyRoleId = iUserRole.save(ctx, conn, syyRoleInfo);
		syyRoleInfo.setId(syyRoleId);
		
		//创建产品类别
		MaterialGroupInfo mgInfo1 = new MaterialGroupInfo();
		mgInfo1.setName("美甲类产品");
		mgInfo1.setShopId(adminShopId);
		mgInfo1.setAdminShopId(adminShopId);
		mgInfo1.setNumber(iMaterialGroup.getNewNumber(ctx, conn));
		String mgId1 = iMaterialGroup.save(ctx, conn, mgInfo1);
		mgInfo1.setId(mgId1);
		
		MaterialGroupInfo mgInfo2 = new MaterialGroupInfo();
		mgInfo2.setName("纹绣类产品");
		mgInfo2.setShopId(adminShopId);
		mgInfo2.setAdminShopId(adminShopId);
		mgInfo2.setNumber(iMaterialGroup.getNewNumber(ctx, conn));
		String mgId2 = iMaterialGroup.save(ctx, conn, mgInfo2);
		mgInfo2.setId(mgId2);
		
		
		//创建项目类别
		IHttpProjectGroup iProjectGroup = IHttpProjectGroup.getInstance();
		ProjectGroupInfo pgInfo1 = new ProjectGroupInfo();
		pgInfo1.setName("美甲类项目");
		pgInfo1.setShopId(adminShopId);
		pgInfo1.setAdminShopId(adminShopId);
		pgInfo1.setNumber(iProjectGroup.getNewNumber(ctx, conn));
		String pgId1 = iProjectGroup.save(ctx, conn, pgInfo1);
		pgInfo1.setId(pgId1);
		
		ProjectGroupInfo pgInfo2 = new ProjectGroupInfo();
		pgInfo2.setName("纹绣类项目");
		pgInfo2.setShopId(adminShopId);
		pgInfo2.setAdminShopId(adminShopId);
		pgInfo2.setNumber(iProjectGroup.getNewNumber(ctx, conn));
		String pgId2 = iProjectGroup.save(ctx, conn, pgInfo2);
		pgInfo2.setId(pgId2);
		
		//创建会员类别
		IHttpVip iVip = IHttpVip.getInstance();
		VipInfo vip1 = new VipInfo();
		vip1.setName("金卡会员");
		vip1.setShopId(adminShopId);
		vip1.setAdminShopId(adminShopId);
		vip1.setNumber(iVip.getNewNumber(ctx, conn));
		String vipId1 = iVip.save(ctx, conn, vip1);
		vip1.setId(vipId1);
		
		VipInfo vip2 = new VipInfo();
		vip2.setName("银卡会员");
		vip2.setShopId(adminShopId);
		vip2.setAdminShopId(adminShopId);
		vip2.setNumber(iVip.getNewNumber(ctx, conn));
		String vipId2 = iVip.save(ctx, conn, vip2);
		vip2.setId(vipId2);
		
		
		//创建供应商
		SupplierInfo supInfo = new SupplierInfo();
		supInfo.setNumber(iSupplier.getNewNumber(ctx, conn));
		supInfo.setName("供应商");
		supInfo.setPhone("020-123456");
		supInfo.setAddress("广东省广州市白云区");
		supInfo.setRemark("供应XXX产品");
		supInfo.setShopId(adminShopId);
		supInfo.setAdminShopId(adminShopId);
		String supId = iSupplier.save(ctx, conn, supInfo);
		supInfo.setId(supId);
		
		IHttpJob iJob = IHttpJob.getInstance();
		JobInfo job1 = new JobInfo();
		job1.setName("美甲师");
		job1.setShopId(adminShopId);
		job1.setAdminShopId(adminShopId);
		job1.setNumber(iJob.getNewNumber(ctx, conn));
		job1.setSalary(new BigDecimal(1000));
		job1.setBounty(new BigDecimal(100));
		String jobId1 = iJob.save(ctx, conn, job1);
		job1.setId(jobId1);
		
		JobInfo job2 = new JobInfo();
		job2.setName("纹绣师");
		job2.setShopId(adminShopId);
		job2.setAdminShopId(adminShopId);
		job2.setNumber(iJob.getNewNumber(ctx, conn));
		job2.setSalary(new BigDecimal(2000));
		job2.setBounty(new BigDecimal(200));
		String jobId2 = iJob.save(ctx, conn, job2);
		job2.setId(jobId2);
		
		JobInfo job3 = new JobInfo();
		job3.setName("实习生");
		job3.setShopId(adminShopId);
		job3.setAdminShopId(adminShopId);
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
				aInfo.setShopId(adminShopId);
				aInfo.setAdminShopId(adminShopId);
				aInfo.setIsEnable(true);
				
				LinkedList<AttendanceEntryInfo> atList = aInfo.getAtList();
				AttendanceEntryInfo e1 = new AttendanceEntryInfo();
				e1.setJobInfo(job1);
				e1.setAmt(BigDecimal.ZERO);
				atList.addLast(e1);
				
				AttendanceEntryInfo e2 = new AttendanceEntryInfo();
				e2.setJobInfo(job2);
				e2.setAmt(BigDecimal.ZERO);
				atList.addLast(e2);
				
				AttendanceEntryInfo e3 = new AttendanceEntryInfo();
				e3.setJobInfo(job3);
				e3.setAmt(BigDecimal.ZERO);
				atList.addLast(e3);
				
				iAttendance.save(ctx, conn, aInfo);
			}
		}
		
		IHttpPercent iPercent = IHttpPercent.getInstance();
		PercentInfo pcInfo = new PercentInfo();
		pcInfo.setNumber(iPercent.getNewNumber(ctx, conn));
		pcInfo.setName("提成比例");
		pcInfo.setShopId(adminShopId);
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
		
		

		IHttpProject iProject = IHttpProject.getInstance();
		LinkedList<Info> progList = IHttpProjectGroup.getInstance().getInfoList(conn, "a.fshopId = '" + adminShopId + "'", "");
		ProjectInfo proInfo1 = new ProjectInfo();
		proInfo1.setNumber(iProject.getNewNumber(ctx, conn));
		proInfo1.setName("项目1号");
		proInfo1.setPtInfo((ProjectGroupInfo) progList.get(0));
		proInfo1.setPcInfo(pcInfo);
		proInfo1.setPrice(new BigDecimal(100));
		proInfo1.setIsEnable(true);
		proInfo1.setShopId(adminShopId);
		proInfo1.setAdminShopId(adminShopId);
		String proId = iProject.save(ctx, conn, proInfo1);
		proInfo1.setId(proId);
		
		MeasureUnitInfo unitInfo = null;
		LinkedList<Info> unitList = iHttpMeasureUnit.getInfoList(conn, "a.fadminshopid is null or a.fadminshopid = ''", "");
		for(Info uInfo : unitList)
		{
			unitInfo = (MeasureUnitInfo) uInfo;
			unitInfo.setId(null);
			unitInfo.setAdminShopId(adminShopInfo.getId());
			unitInfo.setShopId(adminShopInfo.getId());
			
			String unitId = iHttpMeasureUnit.save(ctx, conn, unitInfo);
			unitInfo.setId(unitId);
		}
		
		IHttpMaterial iMaterial = IHttpMaterial.getInstance();
		LinkedList<Info> mgList = IHttpMaterialGroup.getInstance().getInfoList(conn, "a.fshopId = '" + adminShopId + "'", "");
		MaterialInfo mInfo1 = new MaterialInfo();
		mInfo1.setNumber(iMaterial.getNewNumber(ctx, conn));
		mInfo1.setName("产品1号");
		mInfo1.setMgInfo((MaterialGroupInfo) mgList.get(0));
		mInfo1.setUnitInfo(unitInfo);
		mInfo1.setPcInfo(pcInfo);
		mInfo1.setPrice(new BigDecimal(100));
		mInfo1.setModel("100ML");
		mInfo1.setIsEnable(true);
		mInfo1.setShopId(adminShopId);
		mInfo1.setAdminShopId(adminShopId);
		String mId = iMaterial.save(ctx, conn, mInfo1);
		mInfo1.setId(mId);
		
		LinkedList<UserShopEntryInfo> shopList = new LinkedList<UserShopEntryInfo>();
		
		LinkedList<RegisterEntryInfo> list = rInfo.getEntryList();
		for(RegisterEntryInfo entryInfo : list)
		{
			ShopInfo shop = new ShopInfo();
			shop.setParentInfo(adminShopInfo);
			shop.setNumber(iShop.getNewNumber(ctx, conn));
			shop.setName(entryInfo.getShopName());
			shop.setAddress(entryInfo.getShopAddress());
			shop.setPhone(entryInfo.getShopPhone());
			String shopId = iShop.save(ctx, conn, shop);
			shop.setId(shopId);
			
			UserShopEntryInfo useInfo = new UserShopEntryInfo(); 
			useInfo.setShopInfo(shop);
			shopList.addLast(useInfo);
			
			ctx.setShopInfo(shop);
			
			
			
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
			mre.setUnitInfo(mInfo1.getUnitInfo());
			mre.setPrice(proInfo1.getPrice());
			mre.setIsFloat(true);
			mre.setRemark("是否浮动指的是当前产品在相应单据上的单价是否不能修改");
			matList.addLast(mre);
			
			iPrice.setAuditTrue(ctx, conn, prInfo);
			
			
			LinkedList<Info> vipList = IHttpVip.getInstance().getInfoList(conn, "a.fshopId = '" + adminShopId + "'", "");
			IHttpCustomer iCustomer = IHttpCustomer.getInstance();
			CustomerInfo cInfo = new CustomerInfo();
			cInfo.setNumber(iCustomer.getNewNumber(ctx, conn));
			cInfo.setName(shop.getName() + "金卡客户");
			cInfo.setVipInfo((VipInfo) vipList.get(0));
			cInfo.setPhone("13801235984");
			cInfo.setBalance(BigDecimal.ZERO);
			cInfo.setPoints(BigDecimal.ZERO);
			cInfo.setIsEnable(true);
			cInfo.setBirth("1980-01-01");
			cInfo.setShopId(shopId);
			cInfo.setAdminShopId(adminShopId);
			iCustomer.save(ctx, conn, cInfo);
			
			
			//创建收银员
			UserInfo syyInfo = new UserInfo();
			syyInfo.setNumber(shop.getNumber());
			syyInfo.setPassword("123456");
			syyInfo.setName(shop.getName() + "收银员");
			syyInfo.setDefShopInfo(shop);
			
			LinkedList<UserRoleEntryInfo> syyRoleList = new LinkedList<UserRoleEntryInfo>();
			UserRoleEntryInfo re = new UserRoleEntryInfo();
			re.setRoleInfo(syyRoleInfo);
			syyRoleList.addLast(re);
			syyInfo.setRoleList(syyRoleList);
			
			LinkedList<UserShopEntryInfo> syyShopList = new LinkedList<UserShopEntryInfo>();
			UserShopEntryInfo se = new UserShopEntryInfo();
			se.setShopInfo(shop);
			syyShopList.addLast(se);
			syyInfo.setShopList(syyShopList);
			String userId = iUser.save(ctx, conn, syyInfo);
			syyInfo.setId(userId);
			
			ShopParamInfo spInfo = new ShopParamInfo();
			spInfo.setShopId(shopId);
			spInfo.setAdminShopId(adminShopId);
			spInfo.setName(shop.getName());
			spInfo.setShopPhone(rInfo.getSmsPhone());
			spInfo.setHour(rInfo.getHour());;
			spInfo.setDay(rInfo.getDay());
			spInfo.setIsBossSms(rInfo.getIsBossSms());
			spInfo.setIsCustomerSms(rInfo.getIsCustomerSms());
			spInfo.setIsPurchaseEntry(rInfo.getIsPurchaseEntry());
			spInfo.setIsSaleEntry(rInfo.getIsSaleEntry());
			iHttpShopParam.save(ctx, conn, spInfo);
			
			remark.append(syyInfo.getName() + "\n");
			remark.append("账号：" + syyInfo.getNumber() + "   密码：" + syyInfo.getPassword() + "\n\n");
		}
		
		ctx.setShopInfo(curShopInfo);
		
		//创建管理员
		UserInfo adminInfo = new UserInfo();
		adminInfo.setNumber(adminShopInfo.getNumber());
		adminInfo.setPassword("123456");
		adminInfo.setName(adminShopInfo.getName() + "管理员");
		adminInfo.setDefShopInfo(adminShopInfo);
		adminInfo.setShopId(adminShopId);
		
		LinkedList<UserRoleEntryInfo> adminRoleList = new LinkedList<UserRoleEntryInfo>();
		UserRoleEntryInfo re = new UserRoleEntryInfo();
		re.setRoleInfo(adminRoleInfo);
		adminRoleList.addLast(re);
		adminInfo.setRoleList(adminRoleList);
		
		UserShopEntryInfo se = new UserShopEntryInfo();
		se.setShopInfo(adminShopInfo);
		shopList.addLast(se );
		adminInfo.setShopList(shopList);
		iUser.save(ctx, conn, adminInfo);
		
		StringBuffer temp = new StringBuffer();
		temp.append(adminInfo.getName() + "\n");
		temp.append("账号：" + adminInfo.getNumber() + "   密码：" + adminInfo.getPassword() + "\n\n");
		temp.append(remark.toString());
		
		return temp.toString();
	}
}
