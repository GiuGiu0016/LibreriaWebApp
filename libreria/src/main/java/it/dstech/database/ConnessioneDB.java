package it.dstech.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.http.HttpServlet;

public class ConnessioneDB extends HttpServlet {

	public Connection con() throws SQLException, ClassNotFoundException, IOException {
		Properties properties = new Properties();
		properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("file.properties"));
		Class.forName("com.mysql.cj.jdbc.Driver");
		String user = properties.getProperty("db.username");
		String pass = properties.getProperty("db.password");
		String url = properties.getProperty("db.url");
		Connection con = DriverManager.getConnection(url, user, pass);
		return con;
	}
	
}
