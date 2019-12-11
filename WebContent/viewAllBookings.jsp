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
Connection conn = null;
ResultSet resultSet = null;
Statement stmt = null;
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://cs5200-fall2019-udipi1.c0gfzy5hp1s0.us-east-2.rds.amazonaws.com/hotel_management";
   conn = DriverManager.getConnection(url,"admin","Ketaki7495#");
   stmt=conn.createStatement();
%>
<html>
<head>

<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #4CAF50;
  color: white;
}

button {
	background-color: #4CAF50;
  color: white;	
}
</style>
</head>
<body>
<h1>List of all Bookings</h1>
<table border="1">
<tr>
<th>id</th>
<th>Username</th>
<th>Number of Rooms</th>
    <th>Number of Guests</th>
    <th>Type of Room</th>
    <th>Check-in Date</th>
    <th>Check-out Date</th>
    <th>Facilities</th>
</tr>
<%
try{
String sql ="select * from bookings";
resultSet = stmt.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("userName") %></td>
<td><%=resultSet.getString("noOfRooms") %></td>
    <td><%=resultSet.getString("noOfGuests")%></td>
    <td><%=resultSet.getString("roomType")%></td>
    <td><%=resultSet.getString("checkIn") %></td>
<td><%=resultSet.getString("checkOut") %></td>
    <td><%=resultSet.getString("facilities") %></td>
    
</tr>
<%
}
conn.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>