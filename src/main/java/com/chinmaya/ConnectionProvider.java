package com.chinmaya;
import java.sql.*;

public class ConnectionProvider {
    
	public static Connection getCon()
	  {
		
		String JDBC_URL = "jdbc:mysql://localhost:3306/gymmanagementjsp";
	    String USERNAME = "root";
	    String PASSWORD = "221203Cp@#$";
	    
		  try
		  {
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 Connection con = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
			 return con;		
		  } 
		  catch (Exception e) 
		  {
			 System.out.println(e);
			 return null;
		  }
	  }
}

