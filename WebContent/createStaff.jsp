<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import=" java.sql.Date" %>

<html>
<head>
<link rel="stylesheet" type="text/css" href="lib/sweet-alert.css">
<link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
<style>
div.name
		{
			margin : 0 auto;
			position:absolute;
			top:10%;
			width:40%;
			left:30%;
			overflow:auto;
			border-style:solid;
			border-color:orange;
			padding-left:2%;
		}
	</style>
	<title>Create Hotel Staff</title>
</head>
<body>
<% String firstName = request.getParameter("firstname");
String lastName = request.getParameter("lastname");
String email = request.getParameter("email");
String userName = request.getParameter("username");
String password = request.getParameter("password");
String phone = request.getParameter("phone");
String dob = request.getParameter("dob");
   String type = request.getParameter("type");
java.sql.Date date=java.sql.Date.valueOf(dob);
Connection conn = null;
ResultSet rs = null;
Statement stmt = null;
PreparedStatement statement = null;
ResultSetMetaData rsmd ;

   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://cs5200-fall2019-udipi1.c0gfzy5hp1s0.us-east-2.rds.amazonaws.com/hotel_management";
   conn = DriverManager.getConnection(url,"admin","Ketaki7495#");
   stmt=conn.createStatement();
	String q="";
	q="insert into staff (firstName,lastName,email,userName,pass_word,phone,dob, dtype) values ('"+firstName+"','"+lastName+"','"+email+"','"+userName+"','"+password+"','"+phone+"','"+date+"', '"+type+"');";
	stmt.executeUpdate(q);
	response.sendRedirect("signup_success.html");
	
%>

<br><br>

</body>
</html>