package bas.sys.user;

import java.sql.Connection;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import bas.sys.shop.IHttpShop;
import bas.sys.shop.ShopInfo;
import bean.IHttp;
import bean.Info;
import bean.base.IHttpBase;
import common.db.ConnectDb;
import common.db.Context;
import common.util.BeanUtil;
import exp.BizException;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpUser")
public class IHttpUser extends IHttpBase {
	protected static IHttpUser http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpUser() {
        super();
    }
    
    public static IHttpUser getInstance()
    {
    	if(http == null)
    		http = new IHttpUser();
    	return http;
    }

	public String save(Context ctx, Connection conn, Info model) throws Exception {
		UserInfo info = (UserInfo) model;
		LinkedList<Info> uList = this.getInfoList("a.fnumber = '" + info.getNumber() + "'", "");
		if(uList != null && !uList.isEmpty())
		{
			Info uInfo = uList.getFirst();
			String thisId = info.getId();
			thisId = thisId != null ? thisId : "";
			if(!uInfo.getId().equals(thisId))
			{
				throw new BizException("当前账号已被使用， 请重新输入！");
			}
		}
		return super.save(ctx, conn, info);
	}




	/**
     * @功能描述  获取用户的所有UI路径
     * @作者 黎嘉杰 
     * @日期 2016年9月11日 上午1:07:48 
     * @参数 
     * @返回
     */
   public HashSet<String> getUserUIPermissionSet(String userId) throws Exception
   {
	   	StringBuffer sql = new StringBuffer();
	   	sql.append("select \n");
	   	sql.append("p.fuipath as uipath \n");
	   	sql.append("from base_user u \n");
	   	sql.append("inner join base_user_roleentry ur on ur.fparentId = u.fid \n");
	   	sql.append("inner join base_userrole r on r.fid = ur.froleId \n");
	   	sql.append("inner join base_userrole_perentry rp on r.fid = rp.fparentId \n");
	   	sql.append("inner join base_permission p on p.fid = rp.fpermissionId \n");
	   	sql.append("left join base_permission parent on parent.fid = p.fparentId \n");
	   	sql.append("where (p.fpt = 1 or p.fpt = 2) \n");
	   	sql.append("and u.fid = '" + userId + "'\n");
	   	sql.append("order by p.flongnumber");
	   	
	   	Connection conn = ConnectDb.Connect();
	   	
	   	try{
		   	QueryRunner qRunner = new QueryRunner();
			List<String> list = qRunner.query(conn, sql.toString(), new ColumnListHandler<String>("uipath"));
		   	HashSet<String> perSet = new HashSet<String>();
		   	for(String str : list)
		   	{
		   		if(str != null)
		   			perSet.add(str);
		   	}
		   	return perSet;
	   	}catch(Exception e)
	   	{
	   		throw e;
	   	}finally{
	   		DbUtils.closeQuietly(conn);
	   	}
   }
   
   /**
    * @功能描述  获取用户的所有UI路径
    * @作者 黎嘉杰 
    * @日期 2016年9月11日 上午1:07:48 
    * @参数 
    * @返回
    */
  public HashSet<String> getUserBtnPermission(String userId, String clsName) throws Exception
  {
	   	StringBuffer sql = new StringBuffer();
	   	sql.append("select \n");
	   	sql.append("p.fbtnpath as btnpath \n");
	   	sql.append("from base_user u \n");
	   	sql.append("inner join base_user_roleentry ur on ur.fparentId = u.fid \n");
	   	sql.append("inner join base_userrole r on r.fid = ur.froleId \n");
	   	sql.append("inner join base_userrole_perentry rp on r.fid = rp.fparentId \n");
	   	sql.append("inner join base_permission p on p.fid = rp.fpermissionId \n");
	   	sql.append("inner join base_permission parent on parent.fid = p.fparentId \n");
	   	sql.append("where (p.fpt = 2 or p.fpt = 3 or p.fpt = 4 or p.fpt = 5) \n");
	   	sql.append("and u.fid = '" + userId + "'\n");
	   	sql.append("and p.fuipath = '" + clsName + "'\n");
	   	sql.append("order by p.flongnumber");
	   	
	   	Connection conn = ConnectDb.Connect();
	   	
	   	try{
		   	QueryRunner qRunner = new QueryRunner();
			List<String> list = qRunner.query(conn, sql.toString(), new ColumnListHandler<String>("btnpath"));
		   	HashSet<String> perSet = new HashSet<String>();
		   	for(String str : list)
		   	{
		   		if(str != null)
		   			perSet.add(str.toLowerCase());
		   	}
		   	return perSet;
	   	}catch(Exception e)
	   	{
	   		throw e;
	   	}finally{
	   		DbUtils.closeQuietly(conn);
	   	}
  }
	
   public LinkedList<ShopInfo> getUserShopList(String userId) throws Exception
   {
	   if("001".equals(userId))
	   {
		   LinkedList<Info> list = IHttpShop.getInstance().getInfoList("", "a.flongnumber");
		   LinkedList<ShopInfo> shopList = new LinkedList<ShopInfo>();
		   for(Info info : list)
			   shopList.addLast((ShopInfo) info);
		   return shopList;
	   }
	   
	   
	   	StringBuffer sql = new StringBuffer();
	   	sql.append("select \n");
	   	sql.append("s.fid as shopId \n");
	   	sql.append("from base_user u \n");
	   	sql.append("inner join base_user_shopentry us on us.fparentId = u.fid \n");
	   	sql.append("inner join base_shop s on s.fid = us.fshopId \n");
	   	sql.append("where u.fid = '" + userId + "'\n");
	   	sql.append("union all \n");
	   	sql.append("select\n");
	   	sql.append("s.fid as shopId \n");
		sql.append("from base_user u \n");
	   	sql.append("inner join base_shop s on s.fid = u.fdefShopId \n");
	   	sql.append("where u.fid = '" + userId + "'\n");
	   	
	   	Connection conn = ConnectDb.Connect();
	   	try{
		   	QueryRunner qRunner = new QueryRunner();
			List<String> list = qRunner.query(conn, sql.toString(), new ColumnListHandler<String>("shopId"));
			
			LinkedList<ShopInfo> shopList = new LinkedList<ShopInfo>();
			if(list != null && !list.isEmpty())
			{
				StringBuffer filter = new StringBuffer();
				filter.append("a.fid in (");
			   	for(String str : list)
			   	{
			   		filter.append("'" + str + "',");
			   	}
				filter = filter.replace(filter.length() - 1, filter.length(), ")\n");
			   	
				LinkedList<Info> infoList = BeanUtil.getInfoList(conn, ShopInfo.class, filter.toString(), "a.flongnumber");
				for(Info info : infoList)
				{
					shopList.addLast((ShopInfo) info);
				}
			}
			
		   	return shopList;
	   	}catch(Exception e)
	   	{
	   		throw e;
	   	}finally{
	   		DbUtils.closeQuietly(conn);
	   	}
	   	
   }
   
   public void setPassWord(String userId, String password) throws Exception
   {
		Connection conn = ConnectDb.Connect();
	   
		try{
		QueryRunner qRunner = new QueryRunner();
	   	String sql = "update base_user set fpassword = '" + password + "' where fid = '" + userId + "'";
	   	qRunner.update(conn, sql);
		}catch(Exception e)
		{
			throw e;
		}finally
		{
			DbUtils.closeQuietly(conn);
		}
   }

   public String getbtStr() {
		return "0001";
	}
}
