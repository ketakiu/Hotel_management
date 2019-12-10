<%@page import="java.sql.*"%>
<% 
try {
/*here mysqltest is the database name. you have to give the database name you have created and 3306 is the default sql port */
String connectionURL = "jdbc:mysql://cs5200-fall2019-udipi1.c0gfzy5hp1s0.us-east-2.rds.amazonaws.com/cs5200_fall2019_udipi"; 
 
Connection connection = null; 
 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
 
/* "root" and "root" are the mysql username and password . if you have a different user name and password you have to change that in code */
 
connection = DriverManager.getConnection(connectionURL, "admin", "Ketaki7495#");
 
if(!connection.isClosed())
%>
<% 
out.println("Successfully connected to " + "MySQL server using TCP/IP...");
connection.close();
}
catch(Exception ex){
%>
<%
out.println("Unable to connect to database.");
}
%>