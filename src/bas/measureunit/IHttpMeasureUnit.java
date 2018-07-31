package bas.measureunit;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.base.IHttpBase;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpMeasureUnit")
public class IHttpMeasureUnit extends IHttpBase {
	protected static IHttpMeasureUnit http = null;
       
    /**
     * @see IHttp#IHttp()
     */
    public IHttpMeasureUnit() {
        super();
    }
    
    public static IHttpMeasureUnit getInstance() {
		if (http == null)
			http = new IHttpMeasureUnit();
		return http;
	}
	
	public String getbtStr() {
		return "0013";
	}
	
}
