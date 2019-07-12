<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%
	String into_account=request.getParameter("into_account");
	String into_password=request.getParameter("into_password");
	//資料庫MySQL的地址
	String DBURL="jdbc:mysql://localhost:3306/forhomework?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	String DBName="root"; //登入使用者名稱
	String DBPwd="kai@gj94ek712114";//登入密碼
	//載入mysql驅動
	Class.forName("com.mysql.jdbc.Driver");
	//連線資料庫
	Connection conn=DriverManager.getConnection(DBURL,DBName,DBPwd);
	//建立Statement物件
	Statement st=conn.createStatement();
	//sql語句，新增帳號及密碼進DB
	String sql="INSERT INTO login_inf (account,password) VALUE('" + into_account + "','" + into_password + "')";
	System.out.print(sql);

	try{
		st.execute(sql);
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}catch(Exception ex){
		System.out.print(ex);

	}
	
	conn.close();
%>