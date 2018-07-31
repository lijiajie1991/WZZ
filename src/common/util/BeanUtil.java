package common.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.Connection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import bean.EntryInfo;
import bean.HeadInfo;
import bean.Info;
import bean.SysBaseInfo;
import bean.base.BaseInfo;
import bean.bill.BillInfo;
import common.db.BeanTableInfo;
import common.db.ConnectDb;
import common.db.Context;
import common.db.FilterInfo;
import common.db.SortInfo;
import exp.BizException;

/**
 * @说明 该类存放Bean相关的静态方法
 * @作者 黎嘉杰
 * @日期 2016-08-27
 */
public class BeanUtil {

	//--------------------------------------------以下为获取实体对象相关的方法-----------------------------------------------------
	/**
	 * @功能描述 获取Bean实体对象
	 * @作者 黎嘉杰
	 * @日期 2016-08-27
	 * @param cls  bean的Class
	 * @param id   bean的ID
	 * @return
	 * @throws Exception
	 */
	public static Info getInfo(Class<?> cls, String id) throws Exception
	{
		//创建数据库连接
		Connection conn = ConnectDb.Connect();
		try {
			//调用方法进行初始化
			return getInfo(conn, cls, id);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			DbUtils.closeQuietly(conn);
		}
	}
	
	/**
	 * @功能描述 获取Bean实体对象
	 * @作者 黎嘉杰
	 * @日期 2016-08-27
	 * @param cls  bean的Class
	 * @param id   bean的ID
	 * @return
	 * @throws Exception
	 */
	public static Info getInfo(Connection conn, Class<?> cls, String id) throws Exception
	{
		//获取查询SQL， 并追加过滤条件
		String sql = BeanUtil.getQuerySql(cls);
		sql = sql + "and a.fid = '" + id + "'\n";
		
		//把查询数据存放到map对象中
		QueryRunner qRunner = new QueryRunner();
		Map<String, Object> map = qRunner.query(conn, sql, new MapHandler());
		
		//调用方法对bean对象进行设置
		Info info = getInfoFromMap(cls, map);
		
		BeanTableInfo bt = info.getBT();
		if(bt.isHasEntry())
		{
			HashMap<String, Method> mds = BeanUtil.getMethods(cls);
			HashMap<String, BeanTableInfo> em = bt.getEntryMap();
			Iterator<Entry<String, BeanTableInfo>> it = em.entrySet().iterator();
			while(it.hasNext())
			{
				Entry<String, BeanTableInfo> entry = it.next();
				String entryName = entry.getKey().toLowerCase();
				BeanTableInfo entryBt = entry.getValue();
				
				Class<?> entryCls = Class.forName(entryBt.getClsName());			
				LinkedList<Info> entryList = BeanUtil.getInfoList(conn, entryCls, "a.fparentId = '" + id + "'", "a.fseq");
				
				Method m = mds.get("set" + entryName);
				if(m != null)
					m.invoke(info, entryList);
				else
					throw new BizException(cls.getName() + "没有为分录" + entryName + "定义set方法");
			}
		}
		
		return info;
	}
	
	/**
	 * @功能描述 获取指定过滤条件的bean对象列表， 需要注意这个方法获取的只有表头的数据不会获取分录的数据
	 * @作者 黎嘉杰
	 * @日期 2016年8月27日
	 * @param cls
	 * @param filterSql
	 * @return
	 * @throws Exception
	 */
	public static LinkedList<Info> getInfoList(Class<?> cls, String filterSql, String order) throws Exception
	{
		//创建数据库连接
		Connection conn = ConnectDb.Connect();
		//创建返回列表
		LinkedList<Info> list = null;
		try {
			//获取列表
			list = BeanUtil.getInfoList(conn, cls, filterSql, order);
		} catch (Exception e) {
			//抛出所有异常
			throw e;
		}finally{
			//无论执行是否成功都要关闭连接
			DbUtils.closeQuietly(conn);
		}
		return list;
	}
	
	/**
	  * @功能描述 获取bean对象列表， 需要注意这个方法获取的只有表头的数据不会获取分录的数据
	  * @作者 黎嘉杰 
	  * @日期 2016年8月27日 下午2:36:59 
	  * @参数 conn 数据库连接； cls bean的类； filterSql sql过滤条件
	  * @返回
	 */
	public static LinkedList<Info> getInfoList(Connection conn, Class<?> cls, String filterSql, String order) throws Exception
	{
		//创建列表
		LinkedList<Info> infoList = new LinkedList<Info>();
		
		//获取该对象查询sql语句并追加过滤条件
		String sql = BeanUtil.getQuerySql(cls);
		if(filterSql != null && !"".equals(filterSql))
			sql = sql + " and (" + filterSql + ")\n";
		if(order != null && !"".equals(order))
			sql = sql + "order by " + order;
		
		//查询数据， 并把数据存放到列表中
		QueryRunner qRunner = new QueryRunner();
		List<Map<String, Object>> list = qRunner.query(conn, sql, new MapListHandler());
		//遍历查询结果
		for(Map<String, Object> map : list)
		{
			//调用senInfo方法设置bean相关字段值
			Info info = BeanUtil.getInfoFromMap(cls, map);
			//把bean放到返回列表中
			infoList.addLast(info);
		}
		
		//返回
		return infoList;
	}
	
	
	
	/**
	 * @功能描述 获取Bean实体对象
	 * @作者 黎嘉杰
	 * @日期 2016-08-27
	 * @param cls  bean的Class
	 * @param id   bean的ID
	 * @return
	 * @throws Exception
	 */
	public static Info getInfo(Class<?> cls, FilterInfo filter) throws Exception
	{
		return BeanUtil.getInfo(cls, filter.toString());
	}
	
	/**
	 * @功能描述 获取Bean实体对象
	 * @作者 黎嘉杰
	 * @日期 2016-08-27
	 * @param cls  bean的Class
	 * @param id   bean的ID
	 * @return
	 * @throws Exception
	 */
	public static Info getInfo(Connection conn, Class<?> cls, FilterInfo filter) throws Exception
	{
		return BeanUtil.getInfo(conn, cls, filter.toString());
	}
	
	/**
	 * @功能描述 获取指定过滤条件的bean对象列表， 需要注意这个方法获取的只有表头的数据不会获取分录的数据
	 * @作者 黎嘉杰
	 * @日期 2016年8月27日
	 * @param cls
	 * @param filterSql
	 * @return
	 * @throws Exception
	 */
	public static LinkedList<Info> getInfoList(Class<?> cls, FilterInfo filter, SortInfo order) throws Exception
	{
		return BeanUtil.getInfoList(cls, filter.toString(), order.toString());
	}
	
	/**
	  * @功能描述 获取bean对象列表， 需要注意这个方法获取的只有表头的数据不会获取分录的数据
	  * @作者 黎嘉杰 
	  * @日期 2016年8月27日 下午2:36:59 
	  * @参数 conn 数据库连接； cls bean的类； filterSql sql过滤条件
	  * @返回
	 */
	public static LinkedList<Info> getInfoList(Connection conn, Class<?> cls, FilterInfo filter, SortInfo order) throws Exception
	{
		return BeanUtil.getInfoList(conn, cls, filter.toString(), order.toString());
	}
	
	
	
	
	
	/**
	 * @功能描述 根据map， 设置当前的bean字段值
	 * @作者 黎嘉杰
	 * @日期 2016-08-26
	 * @param infoMap
	 * @throws Exception
	 */
	public static Info getInfoFromMap(Class<?> cls, Map<String, Object> infoMap) throws Exception
	{
		Info info = (Info) cls.newInstance();
		
		//获取当前Bean所有公共方法， 以方法小写名称为key存放的Map
		HashMap<String, Method> mMap = BeanUtil.getMethods(cls);
		//获取当前Bean所有的字段
		LinkedList<Field> fList = BeanUtil.getFields(cls);
		
		//遍历所有字段
		for(Field f : fList)
		{
			String fName = f.getName().toLowerCase();  //字段的小写名称
			Class<?> ftCls = f.getType(); //字段类型的CLASS
			String ftName = ftCls.getName(); //字段类型的名称
			
			//如果字段属于基本数据类型或者字符串或者日期
			if(ftCls.isEnum() 
					|| "double".equalsIgnoreCase(ftName) 
					|| "int".equalsIgnoreCase(ftName) 
					|| "java.lang.String".equalsIgnoreCase(ftName) 
					|| "boolean".equalsIgnoreCase(ftName)
					|| "java.util.Date".equalsIgnoreCase(ftName)
					|| "java.math.BigDecimal".equalsIgnoreCase(ftName))
			{
				//从map中获取对应的值
				Object val = infoMap.get(fName);
				if("double".equalsIgnoreCase(ftName))
				{
					//做空处理并转换为对应的数据类型
					val = val != null ? Double.parseDouble(val.toString()) : 0.0;
				}
				else if("java.math.BigDecimal".equalsIgnoreCase(ftName))
				{
					//做空处理并转换为对应的数据类型， 空时范围为当前日期
					val = val != null ? new BigDecimal(val.toString()) : BigDecimal.ZERO;
				}
				else if("int".equalsIgnoreCase(ftName))
				{
					//做空处理并转换为对应的数据类型
					val = val != null ? Integer.parseInt(val.toString()) : 0;
				}
				else if("java.lang.String".equalsIgnoreCase(ftName))
				{
					//做空处理并转换为对应的数据类型
					val = val != null ? val.toString() : "";
				}
				else if("boolean".equalsIgnoreCase(ftName))
				{
					//做空处理
					val = val != null ? val.toString() : "";
					//转换为对应的数据类型
					val = "true".equalsIgnoreCase(val.toString()) || "1".equalsIgnoreCase(val.toString()) ? true : false;
				}
				else if("java.util.Date".equalsIgnoreCase(ftName))
				{
					//做空处理并转换为对应的数据类型， 空时范围为当前日期
					val = DateTimeUtil.parseStr(val);
				}
				else if(ftCls.isEnum())
				{
					//做空处理并转换为对应的数据类型
					val = val != null ? Integer.parseInt(val.toString()) : 0;
					//调用枚举的静态valueOf方法获取相应的枚举
					Method m = ftCls.getMethod("valueOf", int.class);
					val = m.invoke(info, val);
				}
				
				//找到对应的方法体,调用方法设置当前bean的值
				Method m = mMap.get("set" + fName);
				if(m != null)
					m.invoke(info, val);
				else
					throw new BizException(cls.getName() + "没有为字段" + fName + "定义set方法");
			}
			//如果当前字段类型也为bean对象
			else if(Info.class.isAssignableFrom(ftCls))
			{
				//创建一个新的bean对象
				Info fInfo = (Info) ftCls.newInstance();
				//获取别名， 所有bean对象的字段， 均已XXXInfo格式命名， XXX为别名
				String alias = fName.substring(0, fName.length() - 4);
				//获取ID值
				Object idVal = infoMap.get(alias + "_id");
				idVal = idVal != null ? idVal.toString() : "";
				
				//设置ID值
				fInfo.setId(idVal.toString());
				
				//如果当前bean对象是BaseInfo类型， 则还需要获取编码和名称
				if(fInfo instanceof BaseInfo || fInfo instanceof SysBaseInfo)
				{
					Object numberVal = infoMap.get(alias + "_number");
					Object nameVal = infoMap.get(alias + "_name");
					
					numberVal = numberVal != null ? numberVal.toString() : "";
					nameVal = nameVal != null ? nameVal.toString() : "";
					
					if(fInfo instanceof BaseInfo)
					{
						((BaseInfo)fInfo).setNumber(numberVal.toString());
						((BaseInfo)fInfo).setName(nameVal.toString());
					}
					else if(fInfo instanceof SysBaseInfo)
					{
						((SysBaseInfo)fInfo).setNumber(numberVal.toString());
						((SysBaseInfo)fInfo).setName(nameVal.toString());
					}
				}
				//如果当前bean对象是BaseInfo类型， 则还需要获取编码
				else if(fInfo instanceof BillInfo)
				{
					Object numberVal = infoMap.get(alias + "_number");
					numberVal = numberVal != null ? numberVal.toString() : "";
					((BillInfo)fInfo).setNumber(numberVal.toString());
				}
				
				//调用方法设置当前bean的字段
				Method m = mMap.get("set" + fName);
				if(m != null)
					m.invoke(info, fInfo);
				else
					throw new BizException(cls.getName() + "没有为字段" + fName + "定义set方法");
			}
		}
		
		return info;
	}
	
	//--------------------------------------------以下为保存相关方法-----------------------------------------------------
	public static String save(Context ctx, Info info) throws Exception
	{
		//创建数据库连接
		Connection conn = ConnectDb.Connect();
		try {
			//调用方法进行初始化
			return BeanUtil.save(ctx, conn, info);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			DbUtils.closeQuietly(conn);
		}
	}
	
	public static String save(Context ctx, Connection conn, Info info) throws Exception
	{
		//实际执行的SQL
		StringBuffer sql = new StringBuffer();
		//SQL参数
		LinkedList<Object> params = new LinkedList<>();
		
		//获取当前bean对象数据库相关信息
		BeanTableInfo btInfo = info.getBT();
		
		//获取字段和方法
		LinkedList<Field> fList = BeanUtil.getFields(info.getClass());
		HashMap<String, Method> mMap = BeanUtil.getMethods(info.getClass());
		
		//获取ID
		String thisId = info.getId();
		//id为空时， 插入记录
		if(thisId == null || "".equals(thisId))
		{
			//设置默认值
			if(info instanceof HeadInfo)
			{
				HeadInfo hInfo = (HeadInfo) info;
				hInfo.setCreaterId(ctx.getUserId());
				hInfo.setCreateTime(new Date());
				hInfo.setLastUpdateUserId(ctx.getUserId());
				hInfo.setLastUpdateTime(new Date());
				
				if(hInfo.getShopId() == null || hInfo.getShopId().equals(""))
					hInfo.setShopId(ctx.getShopId());
			}
			
			//创建ID
			thisId = btInfo.getPk() + "-" + UUID.randomUUID().toString().replace("-", "");
			
			//字段SQL
			StringBuffer fieldSql = new StringBuffer();
			//值SQL
			StringBuffer valueSql = new StringBuffer();
			
			//遍历所有字段
			for(Field f : fList)
			{
				String fName = f.getName().toLowerCase();  //字段的小写名称
				Class<?> ftCls = f.getType(); //字段类型的CLASS
				String ftName = ftCls.getName(); //字段类型的名称
				
				//调用方法获取相应的字段值
				Method m = mMap.get("get" + fName);
				if(m == null)
					throw new BizException(info.getClass().getName() + "没有为字段" + fName + "定义get方法");
				Object val = m.invoke(info);
				
				
				//如果字段属于基本数据类型或者字符串或者日期
				if(ftCls.isEnum() 
						|| "double".equalsIgnoreCase(ftName) 
						|| "int".equalsIgnoreCase(ftName) 
						|| "java.lang.String".equalsIgnoreCase(ftName) 
						|| "boolean".equalsIgnoreCase(ftName)
						|| "java.util.Date".equalsIgnoreCase(ftName)
						|| "java.math.BigDecimal".equalsIgnoreCase(ftName))
				{
					fieldSql.append("f" + fName + ",");
					valueSql.append("?,");
					
					//如果是ID的， 则直接用新建的ID
					if("id".equalsIgnoreCase(fName))
					{
						val = thisId;
					}
					//日期要转换为一定格式的字符串
					else if("java.util.Date".equalsIgnoreCase(ftName))
					{
						val = val != null && val instanceof Date ? val : new Date();
						val = DateTimeUtil.getDateStr((Date) val, DateTimeUtil.secondFormat);
					}
					//枚举的要获取枚举相应的值
					else if(ftCls.isEnum())
					{
						if(val != null)
						{
							//调用枚举的静态valueOf方法获取相应的枚举
							Method enumMethod = ftCls.getMethod("getValue");
							val = enumMethod.invoke(val);
						}
						else
						{
							val = 0;
						}
					}
					else if("boolean".equalsIgnoreCase(ftName))
					{
						val = val != null && "true".equalsIgnoreCase(val.toString()) ? 1 : 0;
					}
					else
					{
						val = val != null ? val.toString() : "";
					}
					
					params.addLast(val.toString());
				}
				//如果当前字段类型也为bean对象
				else if(Info.class.isAssignableFrom(ftCls))
				{
					String alias = fName.substring(0, fName.length() - 4);
					
					fieldSql.append("f" + alias + "id,");
					valueSql.append("?,");
					
					if(val != null && val instanceof Info)
					{
						params.addLast(((Info)val).getId());
						if(val instanceof HeadInfo)
							BeanUtil.addUseCount(conn, ((HeadInfo)val));
					}
					else
					{
						params.addLast("");
					}
						
				}
				else if("java.util.LinkedList".equals(ftName))
				{
					@SuppressWarnings("unchecked")
					LinkedList<EntryInfo> entryList = (LinkedList<EntryInfo>) val;
					if(entryList != null && !entryList.isEmpty())
					{
						int entrySize = entryList.size();
						for(int entryIndex = 0; entryIndex < entrySize; entryIndex++)
						{
							EntryInfo entryInfo = entryList.get(entryIndex);
							entryInfo.setId(null);
							entryInfo.setParentId(thisId);
							BeanUtil.save(ctx, conn, entryInfo);
						}
					}
				}
			}
			
			fieldSql.replace(fieldSql.length() - 1, fieldSql.length(), ")");
			valueSql.replace(valueSql.length() - 1, valueSql.length(), ")");
			
			sql.append("insert into " + btInfo.getTableName() + "(");
			sql.append(fieldSql.toString());
			sql.append("values(");
			sql.append(valueSql.toString());
		}
		//id不为空时， 更新记录
		else
		{
			//设置默认值
			if(info instanceof HeadInfo)
			{
				HeadInfo hInfo = (HeadInfo) info;
				hInfo.setLastUpdateUserId(ctx.getUserId());
				hInfo.setLastUpdateTime(new Date());
			}
			
			StringBuffer fieldSql = new StringBuffer();
			//遍历所有字段
			for(Field f : fList)
			{
				String fName = f.getName().toLowerCase();  //字段的小写名称
				Class<?> ftCls = f.getType(); //字段类型的CLASS
				String ftName = ftCls.getName(); //字段类型的名称
				
				if("id".equalsIgnoreCase(fName))
					continue;
				
				Method m = mMap.get("get" + fName);
				if(m == null)
					throw new BizException(info.getClass().getName() + "没有为字段" + fName + "定义get方法");
				Object val = m.invoke(info);
				
				//如果字段属于基本数据类型或者字符串或者日期
				if(ftCls.isEnum() 
						|| "double".equalsIgnoreCase(ftName) 
						|| "int".equalsIgnoreCase(ftName) 
						|| "java.lang.String".equalsIgnoreCase(ftName) 
						|| "boolean".equalsIgnoreCase(ftName)
						|| "java.util.Date".equalsIgnoreCase(ftName)
						|| "java.math.BigDecimal".equalsIgnoreCase(ftName))
				{
					fieldSql.append("f" + fName + " = ?,");
					
					if("java.util.Date".equalsIgnoreCase(ftName))
					{
						val = val != null && val instanceof Date ? val : new Date();
						val = DateTimeUtil.getDateStr((Date) val, DateTimeUtil.secondFormat);
					}
					else if(ftCls.isEnum())
					{
						if(val != null)
						{
							//调用枚举的静态valueOf方法获取相应的枚举
							Method enumMethod = ftCls.getMethod("getValue");
							val = enumMethod.invoke(val);
						}
						else
						{
							val = 0;
						}
					}
					else if("boolean".equalsIgnoreCase(ftName))
					{
						val = val != null && "true".equalsIgnoreCase(val.toString()) ? 1 : 0;
					}
					params.addLast(val != null ? val.toString() : "");
				}
				//如果当前字段类型也为bean对象
				else if(Info.class.isAssignableFrom(ftCls))
				{
					String alias = fName.substring(0, fName.length() - 4);
					
					fieldSql.append("f" + alias + "id = ?,");
					
					if(val != null && val instanceof Info)
						params.addLast(((Info)val).getId());
					else
						params.addLast("");
						
				}
				//如果存在分录
				else if("java.util.LinkedList".equals(ftName))
				{
					//先删除原有记录
					BeanTableInfo entryBt = btInfo.getEntryBt(f.getName());
					Class<?> entryCls = Class.forName(entryBt.getClsName());
					BeanUtil.deleteBatch(ctx, conn, entryCls, "fparentId = '" + thisId + "'");
					
					//再重新保存数据
					@SuppressWarnings("unchecked")
					LinkedList<EntryInfo> entryList = (LinkedList<EntryInfo>) val;
					if(entryList != null && !entryList.isEmpty())
					{
						int entrySize = entryList.size();
						for(int entryIndex = 0; entryIndex < entrySize; entryIndex++)
						{
							EntryInfo entryInfo = entryList.get(entryIndex);
							entryInfo.setId(null);
							entryInfo.setParentId(thisId);
							BeanUtil.save(ctx, conn, entryInfo);
						}
					}
				}
			}
			
			fieldSql.replace(fieldSql.length() - 1, fieldSql.length(), "");
			
			sql.append("update " + btInfo.getTableName() + " set ");
			sql.append(fieldSql.toString());
			sql.append(" where fid = ?");
			params.addLast(thisId);
		}
		
		
		//把查询数据存放到map对象中
		QueryRunner qRunner = new QueryRunner();
		qRunner.update(conn, sql.toString(), params.toArray());
		
		//保存成功后再设置id值， 否则insert失败后， 再次保存时会保存不到
		info.setId(thisId);
		return info.getId();
	}
	
	//--------------------------------------------以下为删除相关方法-----------------------------------------------------
	/**
	  * @功能描述 批量删除数据
	  * @作者 黎嘉杰 
	  * @日期 2016年8月29日 下午9:41:30 
	  * @参数 
	  * @返回
	  */
	public static void deleteBatch(Context ctx, Connection conn, Class<?> cls, String  filterSql) throws Exception
	{
		Info clsInfo = (Info) cls.newInstance();
		BeanTableInfo bt = clsInfo.getBT();
		
		//有分录的删除方式
		if(bt.isHasEntry())
		{
			//设置默认过滤条件
			LinkedList<Info> list = getInfoList(conn, cls, filterSql, "fseq");
			for(Info info : list)
			{
				BeanUtil.delete(ctx, conn, info);
			}
		}
		//无分录的删除方式
		else
		{
			StringBuffer sql = new StringBuffer();
			sql.append("delete from " + bt.getTableName() + "\n");
			sql.append("where 1 = 1 \n");
			if(filterSql != null && !"".equals(filterSql))
			{
				sql.append("and (" + filterSql + ")");
			}
			QueryRunner qRunner = new QueryRunner();
			qRunner.update(conn, sql.toString());
		}
		
		
	}
	
	/**
	  * @功能描述 批量删除数据
	  * @作者 黎嘉杰 
	  * @日期 2016年8月29日 下午9:41:30 
	  * @参数 
	  * @返回
	  */
	public static void deleteBatch(Context ctx, Class<?> cls, String  filterSql) throws Exception
	{
		//创建数据库连接
		Connection conn = ConnectDb.Connect();
		try {
			//调用方法进行初始化
			BeanUtil.deleteBatch(ctx, conn, cls, filterSql);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			DbUtils.closeQuietly(conn);
		}
	
	}
	
	public static void delete(Context ctx, Info info) throws Exception
	{
		//创建数据库连接
		Connection conn = ConnectDb.Connect();
		try {
			//调用方法进行初始化
			BeanUtil.delete(ctx, conn, info);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}finally{
			//无论是否成功， 都要关闭连接
			DbUtils.closeQuietly(conn);
		}
	
	}
	
	public static void delete(Context ctx, Connection conn, Info info) throws Exception
	{
		//标志性删除， 直接把标示改成1
		BeanTableInfo btInfo = info.getBT();
		StringBuffer sql = new StringBuffer();
		sql.append("delete from " + btInfo.getTableName() + "  where fid = ? ");

		//把查询数据存放到map对象中
		QueryRunner qRunner = new QueryRunner();
		qRunner.update(conn, sql.toString(), new Object[]{info.getId()});
		
		if(btInfo.isHasEntry())
		{
			HashMap<String, BeanTableInfo> em = btInfo.getEntryMap();
			Iterator<Entry<String, BeanTableInfo>> it = em.entrySet().iterator();
			while(it.hasNext())
			{
				Entry<String, BeanTableInfo> entry = it.next();
				BeanTableInfo entryBt = entry.getValue();
				BeanUtil.deleteBatch(ctx, conn, Class.forName(entryBt.getClsName()), "fparentId = '" + info.getId() + "'");
			}
		}
	}
	
	
	
	
	
	
	
	
	/**
	 * @功能描述 根据制定的Bean对象， 获取当前Bean对象的所有字段
	 * @param cls
	 * @return
	 */
	public static LinkedList<Field> getFields(Class<?> cls)
	{
		//新建列表
		LinkedList<Field> list = new LinkedList<Field>();
		//如果当前class为空， 直接返回
		if(cls == null)
			return list;
		
		//获取当前类对象定义的字段， 这个方法返回的是当前bean定义的字段，不包括父类的
		Field[] fs = cls.getDeclaredFields();
		//把所有字段添加到List中
		for(Field f : fs)
		{
			if(!"serialVersionUID".equalsIgnoreCase(f.getName()))
				list.addLast(f);
		}
		
		//获取父类
		cls = cls.getSuperclass();
		//如果存在父类， 则继续获取
		if(cls != null)
			//调用同一个方法获取父类的字段并添加到List中
			list.addAll(BeanUtil.getFields(cls));
		
		//返回list
		return list;
	}
	
	/**
	 * @功能描述 获取当前类的所有方法， 并存到map中
	 * @作者 黎嘉杰
	 * @param cls
	 * @return
	 */
	public static HashMap<String, Method> getMethods(Class<?> cls)
	{
		//创建map对象
		HashMap<String, Method> mMap = new HashMap<String, Method>(); 
		//获取当前bean的所有方法， 这个方法是获取所有的公共方法， 包括父类的方法
		Method[] mds = cls.getMethods();
		//遍历方法数组， 添加到map中
		for(Method m : mds)
		{
			//以方法名的小写为key
			mMap.put(m.getName().toLowerCase(), m);
		}
		
		return mMap;
	}

	/**
	 * @功能描述 生成当前bean对象的查询SQL
	 * @return 查询SQL
	 * @throws Exception
	 */
	public static String getQuerySql(Class<?> cls) throws Exception
	{
		Info info = (Info) cls.newInstance();
		
		//字段SQL
		StringBuffer fildSql = new StringBuffer();
		//链接SQL
		StringBuffer joinSql = new StringBuffer();
		
		//获取当前对象的数据表相关信息
		BeanTableInfo btInfo = info.getBT();
		
		//获取当前bean所有的字段
		LinkedList<Field> fList = BeanUtil.getFields(cls);
		
		//遍历所有字段
		for(Field f : fList)
		{
			String fName = f.getName().toLowerCase(); //字段名， 小写
			Class<?> ftCls = f.getType(); //字段类型的class
			String ftName = ftCls.getName(); //字段类型名称
			
			
			
			//如果字段类型为基本类型或者为字符串和日期
			if(ftCls.isEnum() 
					|| "double".equalsIgnoreCase(ftName) 
					|| "int".equalsIgnoreCase(ftName) 
					|| "java.lang.String".equalsIgnoreCase(ftName) 
					|| "boolean".equalsIgnoreCase(ftName)
					|| "java.util.Date".equalsIgnoreCase(ftName)
					|| "java.math.BigDecimal".equalsIgnoreCase(ftName))
			{
				//如果为日期的， 用DATE_FORMAT来吧日期转换为字符串
				if("java.util.Date".equalsIgnoreCase(ftName))
					fildSql.append("DATE_FORMAT(a.f" + fName + ", '%Y-%m-%d %T')  as " + fName + ",\n");
				//如果不是日期， 则直接获取
				else
					fildSql.append("a.f" + fName + " as " + fName + ",\n");
			}
			//如果字段为bean对象类型， 则需要链接到对应的数据表
			else if(Info.class.isAssignableFrom(ftCls))
			{
				//创建bean对象， 并获取别名
				Info fInfo = (Info) ftCls.newInstance();
				String alias = fName.substring(0, fName.length() - 4);
				
				fildSql.append(alias + ".fid as " + alias + "_id, \n");
				
				//如果是BaseInfo， 则需要获取编码和名称
				if(fInfo instanceof BaseInfo || fInfo instanceof SysBaseInfo)
				{
					fildSql.append(alias + ".fnumber as " + alias + "_number, \n");
					fildSql.append(alias + ".fname as " + alias + "_name, \n");
				}
				//如果是BillInfo， 则需要获取编码
				else if(fInfo instanceof BillInfo)
				{
					fildSql.append(alias + ".fnumber as " + alias + "_number, \n");
				}
				
				//获取bean的数据库相关信息
				BeanTableInfo fbtInfo = fInfo.getBT();
				//追加当前表格的链接
				joinSql.append("left join " + fbtInfo.getTableName() + " " + alias + " on " + alias + ".fid = a.f" + alias + "id \n");
			}
		}

		//生成真正的查询SQL
		StringBuffer sql = new StringBuffer();
		sql.append("select\n"); 
		sql.append(fildSql.toString()); //追加需要查询的字段
		sql.append("1 as f \n");  //由于最后一个查询字段不能有逗号， 所有要添加这一行
		sql.append("from " + btInfo.getTableName() + " a \n"); //添加主表
		sql.append(joinSql.toString()); //追加相关表的链接
		sql.append("where 1 = 1 \n"); //获取查询SQL语句后， 可能会在后面添加某些过滤条件， 添加这一行后， 追加过滤条件时只需要用and
		return sql.toString();
	}

	/**
	 * @功能描述 根据map， 设置当前的bean字段值
	 * @作者 黎嘉杰
	 * @日期 2016-08-26
	 * @param infoMap
	 * @throws Exception
	 */
	public static Info setInfo(Class<?> cls, HashMap<String, Object> infoMap) throws Exception
	{
		Info info = (Info) cls.newInstance();
		
		//获取当前Bean所有公共方法， 以方法小写名称为key存放的Map
		HashMap<String, Method> mMap = BeanUtil.getMethods(cls);
		//获取当前Bean所有的字段
		LinkedList<Field> fList = BeanUtil.getFields(cls);
		
		//遍历所有字段
		for(Field f : fList)
		{
			String fName = f.getName().toLowerCase();  //字段的小写名称
			Class<?> ftCls = f.getType(); //字段类型的CLASS
			String ftName = ftCls.getName(); //字段类型的名称
			
			//如果字段属于基本数据类型或者字符串或者日期
			if(ftCls.isEnum() 
					|| "double".equalsIgnoreCase(ftName) 
					|| "int".equalsIgnoreCase(ftName) 
					|| "java.lang.String".equalsIgnoreCase(ftName) 
					|| "boolean".equalsIgnoreCase(ftName)
					|| "java.util.Date".equalsIgnoreCase(ftName)
					|| "java.math.BigDecimal".equalsIgnoreCase(ftName))
			{
				//从map中获取对应的值
				Object val = infoMap.get(fName);
				if("double".equalsIgnoreCase(ftName))
				{
					//做空处理并转换为对应的数据类型
					val = val != null ? Double.parseDouble(val.toString()) : 0.0;
				}
				else if("java.math.BigDecimal".equalsIgnoreCase(ftName))
				{
					//做空处理并转换为对应的数据类型， 空时范围为当前日期
					val = val != null ? new BigDecimal(val.toString()) : BigDecimal.ZERO;
				}
				else if("int".equalsIgnoreCase(ftName))
				{
					//做空处理并转换为对应的数据类型
					val = val != null ? Integer.parseInt(val.toString()) : 0;
				}
				else if("java.lang.String".equalsIgnoreCase(ftName))
				{
					//做空处理并转换为对应的数据类型
					val = val != null ? val.toString() : "";
				}
				else if("boolean".equalsIgnoreCase(ftName))
				{
					//做空处理
					val = val != null ? val.toString() : "";
					//转换为对应的数据类型
					val = "true".equalsIgnoreCase(val.toString()) || "1".equalsIgnoreCase(val.toString()) ? true : false;
				}
				else if("java.util.Date".equalsIgnoreCase(ftName))
				{
					//做空处理并转换为对应的数据类型， 空时范围为当前日期
					val = DateTimeUtil.parseStr(val);
				}
				else if(ftCls.isEnum())
				{
					//做空处理并转换为对应的数据类型
					val = val != null ? Integer.parseInt(val.toString()) : 0;
					//调用枚举的静态valueOf方法获取相应的枚举
					Method m = ftCls.getMethod("valueOf", int.class);
					val = m.invoke(info, val);
				}
				
				//找到对应的方法体,调用方法设置当前bean的值
				Method m = mMap.get("set" + fName);
				if(m != null)
					m.invoke(info, val);
				else
					throw new BizException(cls.getName() + "没有为字段" + fName + "定义set方法");
			}
			//如果当前字段类型也为bean对象
			else if(Info.class.isAssignableFrom(ftCls))
			{
				//创建一个新的bean对象
				Info fInfo = (Info) ftCls.newInstance();
				//获取别名， 所有bean对象的字段， 均已XXXInfo格式命名， XXX为别名
				String alias = fName.substring(0, fName.length() - 4);
				//获取ID值
				Object idVal = infoMap.get(alias + "id");
				idVal = idVal != null ? idVal.toString() : "";
				
				//设置ID值
				fInfo.setId(idVal.toString());
				
				//如果当前bean对象是BaseInfo类型， 则还需要获取编码和名称
				if(fInfo instanceof BaseInfo || fInfo instanceof SysBaseInfo)
				{
					Object numberVal = infoMap.get(alias + "_number");
					Object nameVal = infoMap.get(alias + "_name");
					
					numberVal = numberVal != null ? numberVal.toString() : "";
					nameVal = nameVal != null ? nameVal.toString() : "";
					
					if(fInfo instanceof BaseInfo)
					{
						((BaseInfo)fInfo).setNumber(numberVal.toString());
						((BaseInfo)fInfo).setName(numberVal.toString());
					}
					else if(fInfo instanceof SysBaseInfo)
					{
						((SysBaseInfo)fInfo).setNumber(numberVal.toString());
						((SysBaseInfo)fInfo).setName(numberVal.toString());
					}
				}
				//如果当前bean对象是BaseInfo类型， 则还需要获取编码
				else if(fInfo instanceof BillInfo)
				{
					Object numberVal = infoMap.get(alias + "_number");
					numberVal = numberVal != null ? numberVal.toString() : "";
					((BillInfo)fInfo).setNumber(numberVal.toString());
				}
				
				//调用方法设置当前bean的字段
				Method m = mMap.get("set" + fName);
				if(m != null)
					m.invoke(info, fInfo);
				else
					throw new BizException(cls.getName() + "没有为字段" + fName + "定义set方法");
			}
		}
		
		return info;
	}

	public static void addUseCount(Connection conn, HeadInfo info) throws Exception
	{
		String sql = "update " + info.getBT().getTableName() + " set fusecount = fusecount + 1 where fid = '" + info.getId() + "'";
		QueryRunner qRunner = new QueryRunner();
		qRunner.update(conn, sql);
	}

}
