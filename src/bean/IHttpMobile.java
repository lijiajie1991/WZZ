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
import org.json.JSONArray;

import common.db.ConnectDb;
import common.db.Context;
import common.db.FilterInfo;
import common.db.SortInfo;
import common.properties.BeanProperties;
import common.util.BeanUtil;
import common.util.BigDecimalUtil;
import em.PayType;
import exp.BizException;
import exp.HttpException;

/**
 * Servlet implementation class IHttp
 */
@WebServlet("/IHttpMobile")
public class IHttpMobile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public IHttpMobile() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String personId = request.getParameter("personId");
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
		int pageCount = Integer.parseInt(request.getParameter("pageCount"));
		int startIndex = pageIndex * pageCount;
		
		StringBuffer sql = new StringBuffer();
		sql.append("select\n");
		sql.append("s.fnumber as num,\n");
		sql.append("date_format(s.fbizdate, '%Y-%m-%d') as bizDate,\n");
		sql.append("cus.fname as cusName,\n");
		sql.append("s.ffactamt as amt,\n");
		sql.append("pro.fname as proName, \n");
		sql.append("per.fname as perName, \n");
		sql.append("s.fpt as pt\n");
		sql.append("from bill_service s\n");
		sql.append("left join base_person per on per.fid = s.fpersonId\n");
		sql.append("left join base_project pro on pro.fid = s.fprojectId\n");
		sql.append("left join base_customer cus on cus.fid = s.fcustomerId\n");
		//sql.append("where s.fpersonId = '" + personId + "'");
		sql.append("order by s.fbizdate desc\n");
		sql.append("limit " + startIndex + ", " + pageCount + " \n");
		
		JSONArray js = new JSONArray();
		
		//创建数据库连接
		Connection conn = null;
		//创建返回列表
		try {
			conn = ConnectDb.Connect();
			QueryRunner qRunner = new QueryRunner();
			List<Map<String, Object>> list = qRunner.query(conn, sql.toString(), new MapListHandler());
			for(Map<String, Object> map : list)
			{
				int pt = BigDecimalUtil.getIntegerVal(map.get("pt"));
				map.put("pt", PayType.valueOf(pt).getName());
				js.put(map);
				System.out.println(js.toString());
			}
		} catch (Exception e) {
			//抛出所有异常
			e.printStackTrace();;
		}finally{
			//无论执行是否成功都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
		
		response.setCharacterEncoding("utf-8");
		//ServletOutputStream out = response.getOutputStream();
		PrintWriter pw = response.getWriter();
		pw.println(js.toString());
		//out.println(js.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
}
