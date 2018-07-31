package common.util;

public class BooleanUtil {
	public static boolean getBooleanVal(Object obj)
	{
		if(obj == null || "".equals(obj.toString()))
			return false;
		
		if(obj instanceof Boolean)
			return (boolean)obj;
			
		if("1".equals(obj.toString()) || "true".equalsIgnoreCase(obj.toString()))
			return true;
		
		return false;
	}
}
