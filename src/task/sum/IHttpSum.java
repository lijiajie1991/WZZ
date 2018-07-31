package task.sum;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.json.JSONArray;
import org.json.JSONWriter;

import bas.sys.shop.IHttpShop;
import bas.sys.shop.ShopInfo;
import bean.IHttp;
import bean.Info;
import bean.bill.BillInfo;
import bean.bill.IHttpBill;
import common.db.ConnectDb;
import common.db.Context;
import common.util.BigDecimalUtil;
import common.util.SmsUtil;
import em.PayType;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/sum")
public class IHttpSum extends IHttpBill {
	protected static IHttpSum http = null;
       
    /**
     * @see IHttp#IHttp()
     */
    public IHttpSum() {
        super();
    }
	
	public String getbtStr() {
		return "";
	}

	public static IHttpSum getInstance()
    {
    	if(http == null)
    		http = new IHttpSum();
    	return http;
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//HttpSession ses = request.getSession();
		Object obj = request.getParameter("code");;
		if(obj == null || "".equals(obj.toString()))
			return;
		Connection conn = null; 
		try{
			String code = obj.toString();
			int seq = Integer.valueOf(code, 16);
			
			BigDecimal cashAmt = BigDecimal.ZERO;
			BigDecimal shopAmt = BigDecimal.ZERO;
			
			conn = ConnectDb.Connect();
			QueryRunner qRunner = new QueryRunner();
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html");
			PrintWriter pw = response.getWriter();
			
			
			
			String srSql = "select fshopId as shopId, fdateStr as dateStr from sys_sumrecord where fseq = " + seq;
			List<Map<String, Object>> srList = qRunner.query(conn, srSql, new MapListHandler());
			if(srList != null && !srList.isEmpty())
			{
				Map<String, Object> map = srList.get(0);
				String shopId = (String) map.get("shopId");
				String dateStr = (String) map.get("dateStr");
				ShopInfo shopInfo = (ShopInfo) IHttpShop.getInstance().getInfo(conn, shopId);
				
				pw.println("<html>");
				pw.println("<head>");
				pw.println("<title>" + shopInfo.getName() + ":" + dateStr + "营业情况</title>");
				pw.println("</head>");
				pw.println("<body style='font-size:66px'>");
				
				pw.println("<p>" + shopInfo.getName() + ":" + dateStr + "营业情况</p>");
				
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
				shopSql.append("and s.fshopId = '" + shopId + "'");
				shopSql.append("and DATE_FORMAT(s.fbizdate,'%Y-%m-%d') >= '" + dateStr + "'\n");
				shopSql.append("and DATE_FORMAT(s.fbizdate,'%Y-%m-%d') <= '" + dateStr + "'\n");
				shopSql.append("group by s.fpt \n");
				shopSql.append(") s \n");
				shopSql.append("group by s.pt \n");
				shopSql.append("order by s.pt \n");
				
				
				List<Map<String, Object>> shopDataList = qRunner.query(conn, shopSql.toString(), new MapListHandler());
				if(!shopDataList.isEmpty())
				{
					pw.println("<p>按支付方式统计：</p>");
					pw.println("<ul>");
					for(Map<String, Object> sd : shopDataList)
					{
						BigDecimal amt = BigDecimalUtil.getBigDecimalVal(sd.get("amt"));
						PayType pt = PayType.valueOf(Integer.parseInt(sd.get("pt").toString()));
						
						shopAmt = shopAmt.add(amt);
						if(pt == PayType.Cash)
							cashAmt = cashAmt.add(amt);
						
						pw.println("<li>");
						pw.println(pt.getName() + ":" + amt);
						pw.println("</li>");
					}
					pw.println("</ul>");
				}
				
				
				StringBuffer chargeSql = new StringBuffer();
				chargeSql.append("select \n");
				chargeSql.append("c.fname as cName, \n");
				chargeSql.append("sum(r.famt) as amt \n");
				chargeSql.append("from bill_rechargerecord r\n");
				chargeSql.append("left join base_customer c on c.fid = r.fcustomerId \n");
				chargeSql.append("where r.fisAuditTrue = 1\n");
				chargeSql.append("and r.fshopId = '" + shopId + "'");
				chargeSql.append("and DATE_FORMAT(r.fbizdate,'%Y-%m-%d') >= '" + dateStr + "'\n");
				chargeSql.append("and DATE_FORMAT(r.fbizdate,'%Y-%m-%d') <= '" + dateStr + "'\n");
				chargeSql.append("group by c.fname\n");
				List<Map<String, Object>> chargeList = qRunner.query(conn, chargeSql.toString(), new MapListHandler());
				if(!chargeList.isEmpty())
				{
					BigDecimal chargeAmt = BigDecimal.ZERO;
					pw.println("<br>");
					pw.println("<p>充值情况统计：</p>");
					pw.println("<ul>");
					for(Map<String, Object> chargeMap : chargeList)
					{
						String cName = (String) chargeMap.get("cName");
						BigDecimal amt = BigDecimalUtil.getBigDecimalVal(chargeMap.get("amt"));
						chargeAmt = chargeAmt.add(amt);
						
						shopAmt = shopAmt.add(amt);
						cashAmt = cashAmt.add(amt);
						
						pw.println("<li>");
						pw.println(cName + ":" + amt);
						pw.println("</li>");
					}
					pw.println("</ul>");
					pw.println("<p>充值总额：" + chargeAmt + "</p>");
				}
				
				pw.println("<br>");
				pw.println("<p>营业额：" + shopAmt + "</p>");
				pw.println("<p>总现金：" + cashAmt + "</p>");
				
				pw.println("</body>");
				pw.println("</html>");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally{
			//无论是否成功， 都要关闭连接
			if(conn != null)
				DbUtils.closeQuietly(conn);
		}
		
		
	}
}
