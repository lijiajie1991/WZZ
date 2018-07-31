package bas.percent;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.base.IHttpBase;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpPercent")
public class IHttpPercent extends IHttpBase {
	protected static IHttpPercent http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpPercent() {
        super();
    }
	
	public String getbtStr() {
		return "0009";
	}
	
	public static IHttpPercent getInstance()
    {
    	if(http == null)
    		http = new IHttpPercent();
    	return http;
    }
}
