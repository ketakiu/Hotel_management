<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<%
response.sendRedirect("https://www.tripadvisor.com/Hotel_Review-g46186-d620095-Reviews-Hampton_Inn_Suites_North_Conway-North_Conway_Conway_New_Hampshire.html#REVIEWS");
%>
  
	<script>
	fetch("https://apidojo-booking-v1.p.rapidapi.com/properties/get-static-map?currency_code=USD&languagecode=en-us&width=720&longitude=106.663626&zoom=18&latitude=10.807570&height=280", 
			{
		"method": "GET",
		"headers": {
			"x-rapidapi-host": "apidojo-booking-v1.p.rapidapi.com",
			"x-rapidapi-key": "1c48d3457bmshfd32182c6236568p145971jsn4f1fccecac94"
		}
	})
	.then(response =>console.log(response););
	</script>
</body>
</html>