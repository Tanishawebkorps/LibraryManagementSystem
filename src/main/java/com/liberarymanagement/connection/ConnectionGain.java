package com.liberarymanagement.connection;

import java.sql.*;

public class ConnectionGain implements DbDetails {
public static Connection getDbConnection() {
	try {
		Class.forName(DbDetails.driver);
		Connection con=DriverManager.getConnection(DbDetails.db,DbDetails.name,DbDetails.password);
		return con;
	}
	catch(SQLException | ClassNotFoundException exc) {
		exc.printStackTrace();
		return null;
	}
}
}
