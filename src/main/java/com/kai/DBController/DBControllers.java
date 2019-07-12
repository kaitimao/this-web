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
			// Class ���R�A forName() ��k��{�ʺA�[�����O
			Class.forName("com.mysql.jdbc.Driver");
			// 3306|MySQL�}�񦹺ݤf
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
