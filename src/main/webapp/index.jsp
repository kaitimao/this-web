<%@page import="com.kai.DBController.Data"%>
<%@page import="com.kai.DBController.DBControllers"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Insert title here</title>
</head>
<body>
	
	<form action="access.jsp" method="Post">
	帳號:  <input type="text" name="account">
	<br />
	密碼: <input type="text" name="password" />
	<input type="submit" value="確定" />
	<!-- EL語句，後面驗證表單時，驗證錯誤反回信息-->
  ${error}
	</form></br>
	
	<input type ="button" onclick="javascript:location.href='http://localhost:8080/ThisWeb/registered.jsp'" value="註冊"/></br>
	預設帳號密碼

	<% 
		DBControllers dbc = new DBControllers();
		ArrayList<Data> temp = dbc.getData();
		for(int i=0; i<temp.size(); i++)
		{
			out.println("<tr>");
			out.println("<td>"+temp.get(i).id+"</td>");
			out.println("<td>"+temp.get(i).account+"</td>");
			out.println("<td>"+temp.get(i).password+"</td>");
			out.println("</tr>");
		}
	%>
	
</body>
</html>