package task.backup;

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
@WebServlet("/backup")
public class IHttpBackUp extends IHttpBill {
	protected static IHttpBackUp http = null;
       
    /**
     * @see IHttp#IHttp()
     */
    public IHttpBackUp() {
        super();
    }
	
	public String getbtStr() {
		return "";
	}

	public static IHttpBackUp getInstance()
    {
    	if(http == null)
    		http = new IHttpBackUp();
    	return http;
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
