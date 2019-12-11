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
	<title>Book a Room</title>
</head>
<body>
    
<% String userName = request.getParameter("userName");
String noOfRooms = request.getParameter("noOfRooms");
String noOfGuests = request.getParameter("noOfGuests");
String roomType = request.getParameter("roomType");
String In = request.getParameter("check-in-date");
String Out = request.getParameter("check-out-date");
java.sql.Date checkIn=java.sql.Date.valueOf(In);
java.sql.Date checkOut=java.sql.Date.valueOf(Out);
String facility = request.getParameter("facilities");
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
	q="insert into bookings (userName, noOfRooms, noOfGuests, roomType, checkIn, checkOut, facilities) values ('"+userName+"','"+noOfRooms+"','"+noOfGuests+"','"+roomType+"','"+checkIn+"','"+checkOut+"','"+facility+"');";
	stmt.executeUpdate(q);
    response.sendRedirect("bookingSuccessAdmin.html");
	
%>

<br><br>

</body>
</html>