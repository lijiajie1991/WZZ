package bas.vip;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.base.IHttpBase;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpVip")
public class IHttpVip extends IHttpBase {
	protected static IHttpVip http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpVip() {
        super();
    }
	
	public String getbtStr() {
		return "0010";
	}
	
	public static IHttpVip getInstance()
    {
    	if(http == null)
    		http = new IHttpVip();
    	return http;
    }
}
