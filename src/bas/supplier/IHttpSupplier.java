package bas.supplier;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.base.IHttpBase;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpSupplier")
public class IHttpSupplier extends IHttpBase {
	protected static IHttpSupplier http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpSupplier() {
        super();
    }
	
	public String getbtStr() {
		return "0014";
	}
	
	public static IHttpSupplier getInstance()
    {
    	if(http == null)
    		http = new IHttpSupplier();
    	return http;
    }
	
}
