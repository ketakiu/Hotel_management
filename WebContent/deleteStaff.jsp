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
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<body>
<h1>Staff data from database </h1>
<table border="1">
<tr>
<td>id</td>
<td>first name</td>
<td>last name</td>
<td>Email</td>
<td>username</td>
<td>password</td>
<td>Phone Number</td>

<td>Date of Birth</td>
<td>Type of Staff</td>

<td>Action</td>
</tr>
<%

String sql ="select * from staff";
resultSet = stmt.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("firstName") %></td>
<td><%=resultSet.getString("lastName") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("userName") %></td>
<td><%=resultSet.getString("pass_word") %></td>
<td><%=resultSet.getString("phone") %></td>
<td><%=resultSet.getString("dob") %></td>
<td><%=resultSet.getString("dtype") %></td>
<td><a href="deleteStaff1.jsp?id=<%=resultSet.getString("id") %>"><button type="button" class="delete">Delete</button></a></td>
</tr>
<%
}
%>
</table>
</body>
</html>