package dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {

	private static final String base = "biblioteca";
	private static final String user = "root";
	private static final String password = "";
	private static final String url = "jdbc:mysql://localhost:3306/" + base;

	private static Connection con = null;

	public static Connection getConexion() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = (Connection) DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			System.err.println(e);
		} catch (ClassNotFoundException ex) {
			Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
		}

		return con;
	}

}
