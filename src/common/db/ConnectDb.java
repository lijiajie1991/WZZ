package common.db;

import java.sql.Connection;
import java.sql.DriverManager;

import common.properties.DbProperties;

public class ConnectDb {
	private static String driveClassName = "com.mysql.jdbc.Driver";
	
	public static Connection Connect() throws Exception{
		StringBuffer url = new StringBuffer();
		url.append("jdbc:mysql://");
		url.append(DbProperties.getProperties("IP"));
		url.append(":");
		url.append(DbProperties.getProperties("PORT"));
		url.append("/");
		url.append(DbProperties.getProperties("DB"));
		url.append("?useUnicode=true&characterEncoding=utf8");
		
		String user = DbProperties.getProperties("USER");
		String password = DbProperties.getProperties("PASSWORD");
		
		Connection conn = null;
		
		Class.forName(driveClassName);
		conn = DriverManager.getConnection(url.toString(), user, password);
		return conn;
	}
}
