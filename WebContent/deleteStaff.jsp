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
<h1>Staff data from database </h1>
<table border="1">
<tr>
<th>id</th>
<th>first name</th>
<th>last name</th>
<th>Email</th>
<th>Username</th>
<th>password</th>
<th>Phone Number</th>

<th>Date of Birth</th>
<th>Type of Staff</th>

<th>Action</th>
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
<td><button onclick="window.location.href = 'deleteStaff1.jsp?id=<%=resultSet.getString("id") %>'" value="Add" id="addToTable;">Delete</button></td>
</tr>
<%
}
%>
</table>
</body>
</html>