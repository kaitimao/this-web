<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<%
//請求獲取login.jsp的使用者名稱username的值
String account=request.getParameter("account");
System.out.print(account);

//請求獲取login.jsp的密碼password的值
String password=request.getParameter("password");
System.out.print(account);

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
//sql語句，搜尋這個username和password在資料庫是否存在
String sql="select * from Login_Inf where account='"+account+"'and password='"+password+"'";
System.out.print(sql);
//執行sql語句，並把得到的結果放入結果集ResultSet中
ResultSet rs=st.executeQuery(sql);
//判斷這個結果集是否存在，一般username只有一個
if(rs.next()){
  //設定一個username，將後面username其內容賦值給前面一個username，可以以便下一個頁面使用
  request.setAttribute("account", account);
  //跳轉頁面到userpage.jsp
  request.getRequestDispatcher("userpage.jsp").forward(request, response);
}else{
  //設定一個error,將後面的字賦給這個error，以便先一個跳轉頁面的使用，request的作用域有限
  request.setAttribute("error", "使用者名稱或密碼錯誤!!!");
  request.getRequestDispatcher("index.jsp").forward(request, response);
}
 
 
conn.close();
rs.close();
%>