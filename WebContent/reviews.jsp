<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<style>
.first {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

.second {
  float: right;
}

.second a {
  display: block;
  color: white;
  text-align: center;
  padding: 20px 25px;
  text-decoration: none;
}

.second a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: skyblue;
}
</style>

<body>
<ul class="first">
    <li class="second"><a  href="reviews.jsp">REVIEWS</a></li>
        <li class="second"><a href="login.html">LOG IN</a></li>
        <li class="second"><a href="about.html">ABOUT US</a></li>
          <li class="second"><a href="booking.html">BOOKINGS</a></li>

          <li class="second"><a href="gallery.html">GALLERY</a></li>

      <li class="second"><a  href="index.html">HOME</a></li>

</ul>
<!--  <%
//response.sendRedirect("https://www.tripadvisor.com/Hotel_Review-g46186-d620095-Reviews-Hampton_Inn_Suites_North_Conway-North_Conway_Conway_New_Hampshire.html#REVIEWS");
%> -->
	<div class="container">
	<ul class="reviews"></ul>
	</div>
  <script>
//alert("this is working");
  let data=null;
  let xhr = new XMLHttpRequest();
  //xhr.withCredentials = true;
 let output='';
 xhr.open("GET", "https://tripadvisor1.p.rapidapi.com/reviews/list?limit=20&currency=USD&lang=en_US&location_id=8014024",true);
 xhr.setRequestHeader("x-rapidapi-host", "tripadvisor1.p.rapidapi.com");
 xhr.setRequestHeader("x-rapidapi-key", "f06408769bmshae47fc616d01930p11dafejsnf8e2b4cb3e6d");
 
  //xhr.addEventListener("readystatechange", function () {
	 xhr.onload = function(){
		 if (this.status === 200) {
		  		//console.log(this.responseText);
		  		const response=JSON.parse(this.responseText);
			  console.log(response);
			  response.data.forEach(function(review){
				  //output+=review;
				  output+='<li>id:' +review.id+ '</li><ul><li>rating: '+  review.rating + '</li><li>Text: '+review.text+'</li><li>url'+review.url+'</li></ul>';
			  })
			  document.querySelector('.reviews').innerHTML=output;
		  	}
	 }
	  
  //});
  //const proxyurl = "https://cors-anywhere.herokuapp.com/";
  //const url=
  
  //if(xhr.status===200){
	  
  //}
  console.log("output=",output)
  
  xhr.send(data);
  </script>
	<!--  <script>
	fetch("https://apidojo-booking-v1.p.rapidapi.com/properties/get-static-map?currency_code=USD&languagecode=en-us&width=720&longitude=106.663626&zoom=18&latitude=10.807570&height=280", 
			{
		"method": "GET",
		"headers": {
			"x-rapidapi-host": "apidojo-booking-v1.p.rapidapi.com",
			"x-rapidapi-key": "1c48d3457bmshfd32182c6236568p145971jsn4f1fccecac94"
		}
	})
	.then(response =>console.log(response););
	</script> -->
</body>
</html>