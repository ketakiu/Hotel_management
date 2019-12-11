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
Connection conn = null;
ResultSet resultSet = null;
Statement stmt = null;
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://cs5200-fall2019-udipi1.c0gfzy5hp1s0.us-east-2.rds.amazonaws.com/hotel_management";
   conn = DriverManager.getConnection(url,"admin","Ketaki7495#");
   stmt=conn.createStatement();

%>
<html>
<body>
<h1>My Bookings</h1>
<table border="1">
<tr>
<td>id</td>
<td>No of Rooms</td>
<td>No of guests</td>
    <td>Room Type</td>
    <td>Check-In Date</td>
    <td>Check-Out Date</td>
    <td>Restaurant Facilities</td>
</tr>
<%
try{

String sql ="select * from bookings where userName='"+uName+"';";
resultSet = stmt.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("id") %></td>
    <td><%=resultSet.getString("noOfRooms") %></td>
<td><%=resultSet.getString("noOfGuests") %></td>
    <td><%=resultSet.getString("roomType") %></td>
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