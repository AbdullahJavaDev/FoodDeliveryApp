package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	static Connection con;
	
	//DataBase Connectivity
	public static Connection requestConnection() {
		String url="jdbc:mysql://localhost:3306/FoodDelivery";
		String username="root";
		String passWord="SHAIKSQL123";
		
		try {
			//loading the Driver
			Class.forName("com.mysql.cj.jdbc.Driver");	
			System.out.println("Driver is successfully loaded");
			
			//establish the connection
			con=DriverManager.getConnection(url,username,passWord);
			System.out.println("Connection is successfully established");
		}
		catch(ClassNotFoundException ae) {
			System.err.println("Loading is failed!....");
			ae.printStackTrace();
		}
		catch(SQLException ae) {
			System.out.println("Connection is failed!....");
			ae.printStackTrace();
		}
	
		return con;	
	}

}
