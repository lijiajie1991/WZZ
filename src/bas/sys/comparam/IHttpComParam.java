package bas.sys.comparam;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.base.IHttpBase;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpComParam")
public class IHttpComParam extends IHttpBase {
	private static final long serialVersionUID = 1L;
	
	protected static IHttpComParam http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpComParam() {
        super();
    }
    
    public static IHttpComParam getInstance()
    {
    	if(http == null)
    		http = new IHttpComParam();
    	return http;
    }
    
	public String getbtStr() {
		return "0040";
	}
	
	
}
























