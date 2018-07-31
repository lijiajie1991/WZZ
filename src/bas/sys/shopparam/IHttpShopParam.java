package bas.sys.shopparam;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.base.IHttpBase;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpShopParam")
public class IHttpShopParam extends IHttpBase {
	protected static IHttpShopParam http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpShopParam() {
        super();
    }
    
    public static IHttpShopParam getInstance()
    {
    	if(http == null)
    		http = new IHttpShopParam();
    	return http;
    }
    
	public String getbtStr() {
		return "0039";
	}
	
	
}
























