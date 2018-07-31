package bas.attendance;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.base.IHttpBase;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpAttendance")
public class IHttpAttendance extends IHttpBase {
	protected static IHttpAttendance http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpAttendance() {
        super();
    }
	
	public String getbtStr() {
		return "0015";
	}
	
	public static IHttpAttendance getInstance()
    {
    	if(http == null)
    		http = new IHttpAttendance();
    	return http;
    }
}
