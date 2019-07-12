package com.kai.DBController;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class DBControllers {
	private Connection con;
	private Statement st;
	private ResultSet rs;

	public DBControllers() {
		try {
			// Class 的靜態 forName() 方法實現動態加載類別
			Class.forName("com.mysql.jdbc.Driver");
			// 3306|MySQL開放此端口
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/forhomework?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "kai@gj94ek712114");
			st = con.createStatement();

		} catch (Exception ex) {
			System.out.println("Error: " + ex);
		}
	}

	public ArrayList<Data> getData() {
		ArrayList<Data> result=new ArrayList<Data>();
		try {
			String query = "select * from login_inf";
			rs = st.executeQuery(query);
			System.out.println("Records for Database");
			while (rs.next()) {
				Data data=new Data();
				data.id = rs.getLong("id");
				data.account = rs.getString("account");
				data.password = rs.getString("password");
				result.add(data);
			}
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return result;
	}

}
