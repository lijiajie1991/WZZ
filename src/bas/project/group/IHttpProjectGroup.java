package bas.project.group;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.base.IHttpBase;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpProjectGroup")
public class IHttpProjectGroup extends IHttpBase {
	protected static IHttpProjectGroup http = null;
    /**
     * @see IHttp#IHttp()
     */
    public IHttpProjectGroup() {
        super();
    }
	
	public String getbtStr() {
		return "000801";
	}
	
	public static IHttpProjectGroup getInstance()
    {
    	if(http == null)
    		http = new IHttpProjectGroup();
    	return http;
    }
}
