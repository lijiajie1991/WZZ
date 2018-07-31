package common.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.json.JSONException;
import org.json.JSONObject;

import bas.sys.param.IHttpParam;
import common.db.Context;


public class SmsUtil {
	
	public static String[] sendSms(Context ctx, Connection conn, String phone, String msg)
	{
		try{
			if(!isPhone(phone))
				return new String[]{"false", "-1", msg};
			
			if(!msg.startsWith("【"))
			{
				if("0004-ac3eb718-259e-491a-b7f8-333c920f2da4".equals(ctx.getAdminShopId()))
					msg = "【杨龙纹身美甲】" + msg;
				else
					msg = "【杨龙纹身美甲】" + msg;
			}
			
			String smsUrl = IHttpParam.getInstance().getStrParam(conn, "smsUrl");
			String smsUser = IHttpParam.getInstance().getStrParam(conn, "smsUser");
			String smsPassWord = IHttpParam.getInstance().getStrParam(conn, "smsPassWord");
			
			StringBuffer params = new StringBuffer();
			params.append("&u=" + smsUser);
			params.append("&p=" + smsPassWord);
			params.append("&m=" + formatPhone(phone));
			params.append("&c=" + java.net.URLEncoder.encode(msg, "UTF-8"));
			
	        String sr = sendGet(smsUrl, "", params.toString());
	        sr = sr != null ? sr.trim() : "";
	        
	        
	        String status = "unknow";
	        String code = "unknow";
	        if(sr.equals("0")){
	        	status = "Success";
	        	code = "0:发送成功";
	        }else if(sr.equals("30")){
	        	status = "PassWordError";
	        	code = "30:短信api密码错误";
	        }else if(sr.equals("40")){
	        	status = "UserNameError";
	        	code = "40:短信api用户名错误";
	        }else if(sr.equals("41")){
	        	status = "LackBalance";
	        	code = "41:短信api余额不足";
	        }else if(sr.equals("43")){
	        	status = "IpAddressLimit";
	        	code = "43:ip地址限制";
	        }else if(sr.equals("50")){
	        	status = "contentError";
	        	code = "50:内容含有敏感词";
	        }else if(sr.equals("51")){
	        	status = "MobileError";
	        	code = "51:手机号码不正确";
	        }
	        
	    	return new String[]{status, code, msg};
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return new String[]{"false", "-1"};
	}

    @SuppressWarnings("rawtypes")
	public static HashMap<String, String> jsonToMap(String jsonString) throws JSONException {
        JSONObject jsonObject = new JSONObject(jsonString);
        HashMap<String, String> result = new HashMap<String, String>();
        Iterator iterator = jsonObject.keys();
        while (iterator.hasNext()) {
            String key = (String) iterator.next();
            String value = jsonObject.getString(key);
            result.put(key, value);
        }
        return result;
    }
	
	private static String sendGet(String httpUrl, String smsKey, String param) {
		BufferedReader reader = null;
	    String result = null;
	    StringBuffer sbf = new StringBuffer();
	    httpUrl = httpUrl + "?" + param;
	    
        try {
        	try {
                URL url = new URL(httpUrl);
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("GET");
                // 填入apikey到HTTP header
                connection.setRequestProperty("apikey",  smsKey);
                connection.connect();
                InputStream is = connection.getInputStream();
                reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                String strRead = null;
                while ((strRead = reader.readLine()) != null) {
                    sbf.append(strRead);
                    sbf.append("\r\n");
                }
                reader.close();
                result = sbf.toString();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return result;
        	
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        return result;
    }
    
	public static boolean isPhone(String phone)
	{
		phone = formatPhone(phone);
		Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
		Matcher m = p.matcher(phone);
		return m.matches();
	}
	
	public static String formatPhone(String phone)
	{
		phone = phone != null ? phone : "";
		phone = phone.trim();
		phone = phone.replace("-", phone);
		if(phone.startsWith("86"))
			phone = phone.substring(2);
		
		return phone;
	}
}
