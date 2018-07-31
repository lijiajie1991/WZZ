package bean;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import common.db.ConnectDb;
import common.db.Context;
import common.db.FilterInfo;
import common.db.SortInfo;
import common.properties.BeanProperties;
import common.util.BeanUtil;
import exp.BizException;
import exp.HttpException;

/**
 * Servlet implementation class IHttp
 */
@WebServlet("/IHttp")
public abstract class IHttp extends HttpServlet {
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IHttp() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try{
			ServletInputStream in = request.getInputStream();
			ObjectInputStream objIn = new ObjectInputStream(in);
			@SuppressWarnings("unchecked")
			HashMap<String, Object> paramMap = (HashMap<String, Object>) objIn.readObject();
			
			LinkedList<Object> params = new LinkedList<Object>();
			String methodName = (String) paramMap.get("methodName");
			String paramQty = (String) paramMap.get("paramQty");
			int qty = paramQty != null ? Integer.parseInt(paramQty) : 0;
			
			LinkedList<Class<?>> pts = new LinkedList<Class<?>>(); 
			for(int i = 0; i < qty; i++)
			{
				String pt = (String) paramMap.get("paramType_" + i);
				pts.addLast(Class.forName(pt));
				params.addLast(paramMap.get("paramVal_" + i));
			}
			Method m = this.getClass().getMethod(methodName, pts.toArray(new Class<?>[0]));
			Object rs = m.invoke(this, params.toArray(new Object[0]));
			
			ServletOutputStream out = response.getOutputStream();
			ObjectOutputStream objOut = new ObjectOutputStream(out);
			objOut.writeObject(rs);
			
		}catch(Exception e)
		{
			e.printStackTrace();
			ServletOutputStream out = response.getOutputStream();
			ObjectOutputStream objOut = new ObjectOutputStream(out);
			
			System.out.println(e.getCause().getClass().getName());
			if(e.getCause() != null && e.getCause().getClass().equals(BizException.class))
			{
				objOut.writeObject(new BizException(e.getCause().getMessage()));
			}
			else
			{
				String expMsg = e.toString();
				StackTraceElement[] expSts = e.getStackTrace();
				
				Throwable cause = e.getCause();
				String caseMsg = cause != null ? cause.getMessage() : "";
				StackTraceElement[] caseSts = cause != null ? cause.getStackTrace() : null;
				objOut.writeObject(new HttpException(expMsg, expSts, caseMsg, caseSts));
			}
		}
	}
	
	

	// --------------------------------------------数据库查询相关的方法-----------------------------------------------------
	/**
	 * @功能描述 根据id初始化bean对象
	 * @param id
	 */
	public Info getInfo(String id) throws Exception {
		// 创建数据库连接
		Connection conn = ConnectDb.Connect();
		try {
			// 调用方法进行初始化
			return getInfo(conn, id);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			// 无论是否成功， 都要关闭连接
			DbUtils.closeQuietly(conn);
		}
	}

	/**
	 * @功能描述 根据id初始化bean对象
	 * @param conn
	 *            数据库连接
	 * @param id
	 * @throws Exception
	 */
	public Info getInfo(Connection conn, String id) throws Exception {
		String clsName = BeanProperties.getProperties(this.getbtStr());
		Class<?> cls = Class.forName(clsName);
		return BeanUtil.getInfo(conn, cls, id);
	}

	public LinkedList<Info> getInfoList(String filter, String order) throws Exception 
	{
		String clsName = BeanProperties.getProperties(this.getbtStr());
		Class<?> cls = Class.forName(clsName);
		return BeanUtil.getInfoList(cls, filter, order);
	}
	
	public LinkedList<Info> getInfoList(FilterInfo filter, SortInfo order) throws Exception 
	{
		String clsName = BeanProperties.getProperties(this.getbtStr());
		Class<?> cls = Class.forName(clsName);
		return BeanUtil.getInfoList(cls, filter, order);
	}
	
	public LinkedList<Info> getInfoList(Connection conn, String filter, String order) throws Exception 
	{
		String clsName = BeanProperties.getProperties(this.getbtStr());
		Class<?> cls = Class.forName(clsName);
		return BeanUtil.getInfoList(conn, cls, filter, order);
	}
	
	public LinkedList<Info> getInfoList(Connection conn, FilterInfo filter, SortInfo order) throws Exception 
	{
		String clsName = BeanProperties.getProperties(this.getbtStr());
		Class<?> cls = Class.forName(clsName);
		return BeanUtil.getInfoList(conn, cls, filter, order);
	}
	
	public ResultSet getResultSet(Context ctx, FilterInfo filter, SortInfo order) throws Exception
	{
		String clsName = BeanProperties.getProperties(this.getbtStr());
		Class<?> cls = Class.forName(clsName);
		String sql = BeanUtil.getQuerySql(cls);

		String filterSql = filter != null ? filter.toString() : null;
		String orderStr = order != null ? order.toString() : null;
		if(filterSql != null && !"".equals(filterSql))
			sql = sql + " and (" + filterSql + ")\n";
		if(orderStr != null && !"".equals(orderStr))
			sql = sql + "order by " + order;
		
		Connection conn = ConnectDb.Connect();
		Statement st = null;
		try{
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			return rs;
		}catch(Exception e)
		{
			throw e;
		}finally
		{
			if(st != null)
				st.close();
			if(conn != null)
				conn.close();
		}
	}
	
	public List<Map<String, Object>> getMapListData(Context ctx, FilterInfo filter, SortInfo order) throws Exception
	{
		String clsName = BeanProperties.getProperties(this.getbtStr());
		Class<?> cls = Class.forName(clsName);
		String sql = BeanUtil.getQuerySql(cls);
		
		String filterSql = filter != null ? filter.toString() : null;
		String orderStr = order != null ? order.toString() : null;
		if(filterSql != null && !"".equals(filterSql))
			sql = sql + " and (" + filterSql + ")\n";
		if(orderStr != null && !"".equals(orderStr))
			sql = sql + "order by " + order;
		
		Connection conn = null;
		try{
			conn = ConnectDb.Connect();
			QueryRunner qRunner = new QueryRunner();
			List<Map<String, Object>> list = qRunner.query(conn, sql, new MapListHandler());
			return list;
		}catch(Exception e)
		{
			throw e;
		}finally
		{
			if(conn != null)
				conn.close();
		}
	}
	
	public List<Map<String, Object>> getMapListData(Context ctx, String filter, String order) throws Exception
	{
		String clsName = BeanProperties.getProperties(this.getbtStr());
		Class<?> cls = Class.forName(clsName);
		String sql = BeanUtil.getQuerySql(cls);
		
		String filterSql = filter != null ? filter.toString() : null;
		String orderStr = order != null ? order.toString() : null;
		if(filterSql != null && !"".equals(filterSql))
			sql = sql + " and (" + filterSql + ")\n";
		if(orderStr != null && !"".equals(orderStr))
			sql = sql + "order by " + order;
		
		Connection conn = null;
		try{
			conn = ConnectDb.Connect();
			QueryRunner qRunner = new QueryRunner();
			List<Map<String, Object>> list = qRunner.query(conn, sql, new MapListHandler());
			return list;
		}catch(Exception e)
		{
			throw e;
		}finally
		{
			if(conn != null)
				conn.close();
		}
	}
	
	// --------------------------------------------数据库保存删除相关的方法-----------------------------------------------------
	/**
	 * @功能描述 保存方法
	 * @作者 黎嘉杰
	 * @throws Exception
	 */
	public String save(Context ctx, Info info) throws Exception {
		// 创建数据库连接
		Connection conn = ConnectDb.Connect();
		// 设置为不是自动提交
		conn.setAutoCommit(false);
		try {
			// 调用方法保存
			String id = save(ctx, conn, info);
			// 提交
			conn.commit();
			return id;
		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
			throw e;
		} finally {
			// 无论是否成功， 都要关闭连接
			DbUtils.closeQuietly(conn);
		}
	}

	/**
	 * @功能描述 保存方法
	 * @作者 黎嘉杰
	 * @param conn
	 * @throws Exception
	 */
	public String save(Context ctx, Connection conn, Info info) throws Exception {
		this.verifyToSave(ctx, conn, info);
		return BeanUtil.save(ctx, conn, info);
	}

	/**
	 * @功能描述 删除方法
	 * @作者 黎嘉杰
	 * @日期 2016-08-26
	 * @throws Exception
	 */
	public void delete(Context ctx, String id) throws Exception {
		// 创建数据库连接
		Connection conn = ConnectDb.Connect();
		// 设置为不是自动提交
		try {
			conn.setAutoCommit(false);
			// 调用方法删除
			delete(ctx, conn, id);
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
			throw e;
		} finally {
			// 无论是否成功， 都要关闭连接
			DbUtils.closeQuietly(conn);
		}
	}

	/**
	 * @功能描述 删除方法
	 * @作者 黎嘉杰
	 * @日期 2016-08-26
	 * @param conn
	 * @throws Exception
	 */
	public void delete(Context ctx, Connection conn, String id) throws Exception {
		// 先校验
		verifyToDelete(ctx, conn, id);

		String clsName = BeanProperties.getProperties(this.getbtStr());
		Class<?> cls = Class.forName(clsName);
		Info info = (Info) cls.newInstance();
		info.setId(id);
		BeanUtil.delete(ctx, conn, info);
	}

	
	/**
	 * @功能描述 删除方法
	 * @作者 黎嘉杰
	 * @日期 2016-08-26
	 * @throws Exception
	 */
	public void delete(Context ctx, FilterInfo filter) throws Exception {
		// 创建数据库连接
		Connection conn = ConnectDb.Connect();
		// 设置为不是自动提交
		try {
			conn.setAutoCommit(false);
			// 调用方法删除
			delete(ctx, conn, filter);
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
			throw e;
		} finally {
			// 无论是否成功， 都要关闭连接
			DbUtils.closeQuietly(conn);
		}
	}

	/**
	 * @功能描述 删除方法
	 * @作者 黎嘉杰
	 * @日期 2016-08-26
	 * @param conn
	 * @throws Exception
	 */
	public void delete(Context ctx, Connection conn, FilterInfo filter) throws Exception {
		LinkedList<Info> list = this.getInfoList(conn, filter.toString(), "");
		int size = list.size();
		for(int i = 0; i < size; i++)
		{
			this.delete(ctx, conn, list.get(i).getId());
		}
	}
	// --------------------------------------------以下为校验方法-----------------------------------------------------

	/**
	 * @校验是否可以保存， 不可以就抛出异常， 异常信息里包含不能保存的原因
	 * 
	 * @throws Exception
	 */
	protected void verifyToSave(Context ctx, Connection conn, Info info) throws Exception {

	}

	/**
	 * @校验是否可以删除， 不可以就抛出异常， 异常信息里包含不能删除的原因
	 * 
	 * @throws Exception
	 */
	protected void verifyToDelete(Context ctx, Connection conn, String id) throws Exception {

	}

	public abstract String getbtStr();
}
