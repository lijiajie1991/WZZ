package report.crossrpt.info;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import report.base.bean.IHttpRpt;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpCrossRpt")
public class IHttpCrossRpt extends IHttpRpt {
       
    /**
     * @see IHttp#IHttp()
     */
    public IHttpCrossRpt() {
        super();
    }

	public String getbtStr() {
		return "0037";
	}
}
