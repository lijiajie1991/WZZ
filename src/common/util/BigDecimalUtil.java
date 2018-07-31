/**
  * @说明 
  * @作者 黎嘉杰 
  * @日期 2016年9月27日 上午7:01:09 
  */
package common.util;

import java.math.BigDecimal;

/**
  * @说明 
  * @作者 黎嘉杰 
  * @日期 2016年9月27日 上午7:01:09 
  */
public class BigDecimalUtil {
	public static BigDecimal getBigDecimalVal(Object obj)
	{
		obj = obj != null ? obj.toString() : "0.0";
		BigDecimal val = BigDecimal.ZERO;
		try{
			val = new BigDecimal(obj.toString());
		}catch(Exception e)
		{
			
		}
		
		return val;
	}
	
	public static int getIntegerVal(Object obj)
	{
		obj = obj != null ? obj.toString() : "0.0";
		BigDecimal val = BigDecimal.ZERO;
		try{
			val = new BigDecimal(obj.toString());
		}catch(Exception e)
		{
			
		}
		
		return val.intValue();
	}
}
