<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

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
	<title>JDBC</title>
</head>
<body>
<% String userid = request.getParameter("uname");
String password = request.getParameter("psw");
Connection conn = null;
ResultSet rs = null;
Statement stmt = null;
ResultSetMetaData rsmd ;
ResultSet resultSet = null;

   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://cs5200-fall2019-udipi1.c0gfzy5hp1s0.us-east-2.rds.amazonaws.com/hotel_management";
   conn = DriverManager.getConnection(url,"admin","Ketaki7495#");
   stmt=conn.createStatement();
	String q="";
	String passWord="";
	String choice = request.getParameter("user");
    System.out.println("userid"+userid);
	if(choice.equals("Admin")){
		q="select pass_word from admin where username='"+userid+"';";
		resultSet=stmt.executeQuery(q);
		while (resultSet.next()){
		passWord=resultSet.getString("pass_word");
		}
		System.out.println("password="+passWord);
		if(password.equals(passWord)){
		%>
		<div>
		<a href="admin.html">Continue</a>
	    </div>
<% }
  }
	else if(choice.equals("Customer")){
		%>
		<div>
		<a href="customer.html">Continue</a>
	    </div>
<% 
	}
	else if(choice.equals("Hotel Staff")){
		%>
		<div>
		<a href="hotelStaff.html">Continue</a>
	    </div>
<%
	}
	else{
	q=request.getParameter("custom");
	}
%>





<br><br>

</body>
</html>