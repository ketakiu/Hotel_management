<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
try
{
Connection conn = null;
ResultSet resultSet = null;
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://cs5200-fall2019-udipi1.c0gfzy5hp1s0.us-east-2.rds.amazonaws.com/hotel_management";
   conn = DriverManager.getConnection(url,"admin","Ketaki7495#");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM bookings WHERE id="+id);
response.sendRedirect("customerMyBookings.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>