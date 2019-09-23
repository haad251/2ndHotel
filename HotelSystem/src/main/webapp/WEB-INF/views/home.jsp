<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
	<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>

<body>
<jsp:include page="navibar.jsp" /> 
 
<div class="searchdiv">
<form action="searchHotel" method="POST">
Keyword<input type="text" name="keyword"><br>
<br>Count<input type="number" name="bk_cnt">
<br>Meal<input type="checkbox" name="ht_meal" value="1">
Park<input type="checkbox" name="ht_park" value="1">
<input type="submit" value="Search">
</form>
</div>

<br>



<!-- <br> -->

 
<!-- Caption 2 -->
<h3>Hotel List</h3>
<ul class="gallery caption-2">
  
<c:forEach var="Hotel" items="${hotelList}">
  
  <li>
    <figure>
    <a href="goHoteldetail?ht_id=${Hotel.HT_ID}">
      <img class="homeimage" src="<c:url value='/img/${Hotel.FILE_SAV}'/>" alt="">
      <figcaption>
        <h3>${Hotel.HT_NAME}</h3>
      </figcaption>
    </a>
    </figure>
  </li>    
</c:forEach>

</ul>

</body>
</html>
