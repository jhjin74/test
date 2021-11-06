package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {

	public static Connection getConnection() {
		try {
			String url = "jdbc:oracle:thin://192.168.0.172:1521:xe";
			String id = "ch_k2";
			String pwd = "1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");	
			return DriverManager.getConnection(url, id, pwd);
		} catch ( Exception e ) {
			e.printStackTrace();
		}
		
		return null;
	}
}
