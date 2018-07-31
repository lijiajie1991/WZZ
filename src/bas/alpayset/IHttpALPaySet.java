package bas.alpayset;

import java.sql.Connection;
import java.util.LinkedList;

import javax.servlet.annotation.WebServlet;

import bean.IHttp;
import bean.Info;
import bean.base.IHttpBase;
import common.db.Context;
import exp.BizException;

/**
 * Servlet implementation class IHttpUser
 */
@WebServlet("/IHttpALPaySet")
public class IHttpALPaySet extends IHttpBase {
	private static final long serialVersionUID = 1L;
	
	protected static IHttpALPaySet http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpALPaySet() {
        super();
    }
	
	public String getbtStr() {
		return "0045";
	}
	
	public static IHttpALPaySet getInstance()
    {
    	if(http == null)
    		http = new IHttpALPaySet();
    	return http;
    }

	protected void verifyToSave(Context ctx, Connection conn, Info info) throws Exception {
		super.verifyToSave(ctx, conn, info);
		
		LinkedList<Info> list = this.getInfoList(conn, "a.fshopId = '" + ctx.getShopId() + "'", "");
		if(list != null)
		{
			String curId = info.getId() != null ? info.getId() : "";
			for(Info temp : list)
			{
				if(!temp.getId().equals(curId))
					throw new BizException("当前店铺已设置支付宝支付， 不能重复设置！");
			}
		}
	}
	
	
	
	
	
}
