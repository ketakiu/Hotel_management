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
<%
String sql ="select * from staff where id="+id;
resultSet = stmt.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update Staff Info</h1>
<form method="post" action="updateStaff2.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<br>
First name:<br>
<input type="text" name="first_name" value="<%=resultSet.getString("firstName") %>">
<br>
Last name:<br>
<input type="text" name="last_name" value="<%=resultSet.getString("lastName") %>">
<br>
Email Id:<br>
<input type="email" name="email" value="<%=resultSet.getString("email") %>">
<br>
Username:<br>
<input type="text" name="username" value="<%=resultSet.getString("userName") %>">
<br>
    Password:<br>
<input type="text" name="password" value="<%=resultSet.getString("pass_word") %>">
<br>
   Phone number:<br>
<input type="text" name="phone_number" value="<%=resultSet.getString("phone") %>">
<br>
Date of Birth:<br>
<input type="date" name="dob" value="<%=resultSet.getDate("dob") %>">
<br>
<br>
    
    Type of Staff:<br>
<input type="text" name="type" value="<%=resultSet.getString("dtype") %>">
<br><br>
<input type="submit" value="submit">
</form>
<%
}
%>
</body>
</html>