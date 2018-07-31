package report.listrpt.info;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import report.base.bean.IHttpRpt;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpListRpt")
public class IHttpListRpt extends IHttpRpt {
       
    /**
     * @see IHttp#IHttp()
     */
    public IHttpListRpt() {
        super();
    }

	public String getbtStr() {
		return "0036";
	}
	
	
}
