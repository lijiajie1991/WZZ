package bill.paylog;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.bill.IHttpBill;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpPayLog")
public class IHttpPayLog extends IHttpBill {
	private static final long serialVersionUID = 1L;
	protected static IHttpPayLog http = null;
       
    /**
     * @see IHttp#IHttp()
     */
    public IHttpPayLog() {
        super();
    }
	
	public String getbtStr() {
		return "0043";
	}

	public static IHttpPayLog getInstance()
    {
    	if(http == null)
    		http = new IHttpPayLog();
    	return http;
    }
}
