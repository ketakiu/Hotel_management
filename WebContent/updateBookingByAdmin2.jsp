<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("id");
String userName=request.getParameter("userName");
String noOfRooms=request.getParameter("noOfRooms");
String noOfGuests=request.getParameter("noOfGuests");
String roomType=request.getParameter("roomType");
String In=request.getParameter("checkIn");
java.sql.Date checkIn=java.sql.Date.valueOf(In);
String Out=request.getParameter("checkOut");
   java.sql.Date checkOut=java.sql.Date.valueOf(Out);

String facilities=request.getParameter("facilities");
if(id != null)
{
Connection conn = null;
ResultSet resultSet = null;
Statement stmt = null;	 
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://cs5200-fall2019-udipi1.c0gfzy5hp1s0.us-east-2.rds.amazonaws.com/hotel_management";
conn = DriverManager.getConnection(url,"admin","Ketaki7495#");
   
String sql="Update bookings set userName='"+userName+"',noOfRooms='"+noOfRooms+"',noOfGuests='"+noOfGuests
   +"',roomType = '"+roomType+"', checkIn ='"+checkIn+"', checkOut='"+checkOut+"', facilities='"+facilities+"' where id="+id;
ps = conn.prepareStatement(sql);
int i = ps.executeUpdate();
if(i > 0)
{
	response.sendRedirect("updateBookingByAdmin.jsp");}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>