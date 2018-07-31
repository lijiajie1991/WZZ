package bas.material.group;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.base.IHttpBase;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpMaterialGroup")
public class IHttpMaterialGroup extends IHttpBase {
	protected static IHttpMaterialGroup http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpMaterialGroup() {
        super();
    }
	
	public String getbtStr() {
		return "001201";
	}
	
	public static IHttpMaterialGroup getInstance()
    {
    	if(http == null)
    		http = new IHttpMaterialGroup();
    	return http;
    }
}
