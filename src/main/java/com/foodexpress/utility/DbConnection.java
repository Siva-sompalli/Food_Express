package com.foodexpress.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	private static final String URL="jdbc:mysql://localhost:3306/smart_food_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASSWORD = "root";
	public static Connection getConnection(){
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {
			System.err.println("Database Driver Error: " + e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			System.err.println("Database Connection Error [URL=" + URL + ", USER=" + USER + "]: " + e.getMessage());
			e.printStackTrace();
		}
		return connection;
	}
}
