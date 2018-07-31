package bas.wxpayset;

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
@WebServlet("/IHttpWxPaySet")
public class IHttpWxPaySet extends IHttpBase {
	private static final long serialVersionUID = 1L;
	
	protected static IHttpWxPaySet http = null;
	
    /**
     * @see IHttp#IHttp()
     */
    public IHttpWxPaySet() {
        super();
    }
	
	public String getbtStr() {
		return "0044";
	}
	
	public static IHttpWxPaySet getInstance()
    {
    	if(http == null)
    		http = new IHttpWxPaySet();
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
					throw new BizException("当前店铺已设置微信支付， 不能重复设置！");
			}
		}
	}
	
	
	
	
	
}
