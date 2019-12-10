<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String uName = (String)session.getAttribute("SES_UserName");
String passWord  = (String)session.getAttribute("SES_Password");
Connection conn = null;
ResultSet resultSet = null;
Statement stmt = null;
Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://cs5200-fall2019-udipi1.c0gfzy5hp1s0.us-east-2.rds.amazonaws.com/hotel_management";
   conn = DriverManager.getConnection(url,"admin","Ketaki7495#");
   stmt=conn.createStatement();
   String sql ="select * from users where userName='"+uName+"';";
   resultSet = stmt.executeQuery(sql);
   while(resultSet.next()){
%>

<html>
<body>
<h1>Update your data from database </h1>
<form method="post" action="updateCustomer2.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<br>
First name:<br>
<input type="text" name="first_name" value="<%=resultSet.getString("firstName") %>">
<br>
Last name:<br>
<input type="text" name="last_name" value="<%=resultSet.getString("lastName") %>">
<br>
    Email Id:<br>
<input type="email" name="email" value="<%=resultSet.getString("email") %>">
<br><br>
 Username:<br>
<input type="text" name="username" value="<%=resultSet.getString("userName") %>">
<br>
    Password:<br>
<input type="text" name="password" value="<%=resultSet.getString("pass_word") %>">
<br>
   Phone number:<br>
<input type="text" name="phone_number" value="<%=resultSet.getString("phone") %>">
<br>
Date of Birth:<br>
<input type="date" name="dob" value="<%=resultSet.getDate("dob") %>">
<br>

<input type="submit" value="submit">
</form>
<%
}
%>
</body>
</html>