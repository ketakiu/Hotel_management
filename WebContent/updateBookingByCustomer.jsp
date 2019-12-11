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
String sql ="select * from bookings where id="+id;
resultSet = stmt.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update Staff Info</h1>
<form method="post" action="updateBookingByCustomer1.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<br>
No. Of Rooms:<br>
                 <select class="form-control" name = "noOfRooms" id="room_number">
                     <option value="<%=resultSet.getString("noOfRooms") %>"><%=resultSet.getString("noOfRooms") %></option>
                     <option value="0"> 0 </option>
                     <option value="1"> 1 </option>
                     <option value="2"> 2 </option>
                     <option value="3"> 3 </option>
                     <option value="4"> 4 </option>
                     <option value="5"> 5 </option>
                     <option value="6"> 6 </option>
                     <option value="7"> 7 </option>
                 </select>
            
<br>
No. of Guests:<br>
<select name = "noOfGuests" id="person_number">
                     <option value="<%=resultSet.getString("noOfGuests") %>"><%=resultSet.getString("noOfGuests") %></option> 
                     <option value="0"> 0 </option>
                     <option value="1"> 1 </option>
                     <option value="2"> 2 </option>
                     <option value="3"> 3 </option>
                     <option value="4"> 4 </option>
                     <option value="5"> 5 </option>
                     <option value="6"> 6 </option>
                     <option value="7"> 7 </option>
                 </select>
<br>
Room type:<br>
                     <select id="roomType" name="roomType"> 
                     <option value="<%=resultSet.getString("roomType") %>"><%=resultSet.getString("roomType") %></option>
                     <option value="Standard"> Standard </option>
                     <option value="Deluxe"> Deluxe </option>
                     <option value="Superior Deluxe"> Superior Deluxe </option>
                     </select>
<br>
Check-in Date:<br>
<input type="date" name="checkIn" value="<%=resultSet.getString("checkIn") %>">
<br>
Check-out Date:<br>
<input type="date" name="checkOut" value="<%=resultSet.getString("checkOut") %>">
<br>
Facilities:<br>
                  <select class="form-control" name = "facilities" id="res_facilities">
                     <option value="<%=resultSet.getString("facilities") %>"> <%=resultSet.getString("facilities") %> </option>
                     <option value="Yes"> Yes </option>
                     <option value="No"> No </option>
                 </select>
<br><br>
<input type="submit" value="submit">
</form>
<%
}
%>
</body>
</html>