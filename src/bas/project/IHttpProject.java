package bas.project;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.base.IHttpBase;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpProject")
public class IHttpProject extends IHttpBase {
	protected static IHttpProject http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpProject() {
        super();
    }
	
	public String getbtStr() {
		return "0008";
	}
	
	public static IHttpProject getInstance()
    {
    	if(http == null)
    		http = new IHttpProject();
    	return http;
    }
}
