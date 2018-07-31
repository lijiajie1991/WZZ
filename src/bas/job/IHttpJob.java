package bas.job;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.base.IHttpBase;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpJob")
public class IHttpJob extends IHttpBase {
	protected static IHttpJob http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpJob() {
        super();
    }
	
	public String getbtStr() {
		return "0006";
	}
	
	public static IHttpJob getInstance()
    {
    	if(http == null)
    		http = new IHttpJob();
    	return http;
    }
}
