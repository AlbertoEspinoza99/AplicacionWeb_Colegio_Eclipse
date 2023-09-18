package com.cibertec.project.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySqlConexion {
	
	public static Connection getConexion() {
		Connection cn=null;
		try {
			//carga del DRIVER
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url,user,pass;
			url="jdbc:mysql://localhost/instituto_2022_4fn?serverTimezone=UTC";
			user="root";
			pass="mysql";
			//
			cn=DriverManager.getConnection(url,user,pass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cn;
	}
	
	
	
}
