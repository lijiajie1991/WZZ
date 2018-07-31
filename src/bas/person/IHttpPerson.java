package bas.person;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.base.IHttpBase;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpPerson")
public class IHttpPerson extends IHttpBase {
	protected static IHttpPerson http = null;
    /**
     * @see IHttp#IHttp()
     */
    public IHttpPerson() {
        super();
    }
    
    public static IHttpPerson getInstance()
    {
    	if(http == null)
    		http = new IHttpPerson();
    	return http;
    }

	/**
	  * @功能描述
	  * @作者 黎嘉杰 
	  * @日期 2016年9月24日 下午3:17:07 
	  * @参数 
	  * @返回
	  */
	public String getbtStr() {
		return "0007";
	}
}
