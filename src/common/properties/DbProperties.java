/**
  * @说明 
  * @作者 黎嘉杰 
  * @日期 2016年9月9日 下午1:28:08 
  */
package common.properties;

import java.io.FileInputStream;
import java.util.Properties;

/**
 * @说明
 * @作者 黎嘉杰
 * @日期 2016年9月9日 下午1:28:08
 */
public class DbProperties {
	private static Properties pp = null;

	static {
		pp = new Properties();
		try {
			String path = DbProperties.class.getClassLoader().getResource("").toURI().getPath();
			FileInputStream in = new FileInputStream(path + "/db.properties");
			pp.load(in);
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String getProperties(String key) {
		return pp.getProperty(key);
	}
}
