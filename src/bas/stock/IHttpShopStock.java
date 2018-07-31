package bas.stock;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.base.IHttpBase;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpShopStock")
public class IHttpShopStock extends IHttpBase {
       
    /**
     * @see IHttp#IHttp()
     */
    public IHttpShopStock() {
        super();
    }
	
	public String getbtStr() {
		return "0017";
	}
}
