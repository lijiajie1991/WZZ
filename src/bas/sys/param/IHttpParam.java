package bas.sys.param;

import java.sql.Connection;
import java.util.LinkedList;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.Info;
import bean.base.IHttpBase;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpParam")
public class IHttpParam extends IHttpBase {
	protected static IHttpParam http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpParam() {
        super();
    }
    
    public static IHttpParam getInstance()
    {
    	if(http == null)
    		http = new IHttpParam();
    	return http;
    }
    
	public String getbtStr() {
		return "0030";
	}
	
	public String getStrParam(Connection conn, String number) throws Exception
	{
		LinkedList<Info> infoList = this.getInfoList(conn, "a.fnumber = '" + number + "'", "");
		if(infoList != null && infoList.size() > 0)
		{
			ParamInfo info = (ParamInfo) infoList.get(0);
			if(info != null)
			{
				return info.getVal();
			}
		}
		
		return "";
	}
	
	public String getStrParam(String number) throws Exception
	{
		LinkedList<Info> infoList = this.getInfoList("a.fnumber = '" + number + "'", "");
		if(infoList != null && infoList.size() > 0)
		{
			ParamInfo info = (ParamInfo) infoList.get(0);
			if(info != null)
			{
				return info.getVal();
			}
		}
		
		return "";
	}
}
























