<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");
String uName = (String)session.getAttribute("SES_UserName");
String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
String email=request.getParameter("email");
String username=request.getParameter("username");
String password=request.getParameter("password");
String phone_number=request.getParameter("phone_number");
String dob=request.getParameter("dob");
if(id != null)
{
	Connection conn = null;
	ResultSet resultSet = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
	Class.forName("com.mysql.jdbc.Driver");
	   String url = "jdbc:mysql://cs5200-fall2019-udipi1.c0gfzy5hp1s0.us-east-2.rds.amazonaws.com/hotel_management";
	   conn = DriverManager.getConnection(url,"admin","Ketaki7495#");
String sql="Update staff set firstName='"+first_name+"',lastName='"+last_name+"',email='"+email+"',userName = '"+username+"', pass_word ='"+password+"', phone='"+phone_number+"', dob='"+dob+"' where userName='"+uName+"';";
ps = conn.prepareStatement(sql);


int i = ps.executeUpdate();
if(i > 0)
{
	response.sendRedirect("staffLogin.html");
}
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