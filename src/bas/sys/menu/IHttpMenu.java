package bas.sys.menu;

import java.sql.Connection;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.IHttpSys;
import bean.Info;
import common.db.Context;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpMenu")
public class IHttpMenu extends IHttpSys {
	protected static IHttpMenu http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpMenu() {
        super();
    }

	
	public String getbtStr() {
		return "0005";
	}
	
	public static IHttpMenu getInstance() {
		if (http == null)
			http = new IHttpMenu();
		return http;
	}


	public String save(Context ctx, Connection conn, Info info) throws Exception {
		MenuInfo mInfo = (MenuInfo) info;
		MenuInfo parentInfo = mInfo.getParentInfo();
		if(parentInfo != null && parentInfo.getId() != null)
		{
			parentInfo = (MenuInfo) this.getInfo(conn, parentInfo.getId());
			String longNumber = parentInfo.getLongnumber() + "!" + mInfo.getNumber();
			mInfo.setLongnumber(longNumber);
			
			String longName = parentInfo.getLongname() + "!" + mInfo.getName();
			mInfo.setLongname(longName);
		}
		else
		{
			mInfo.setLongnumber(mInfo.getNumber());
			mInfo.setLongname(mInfo.getName());
		}
		
		
		return super.save(ctx, conn, mInfo);
	}
	
	
	
	
	
	
	
	
	
	
}
