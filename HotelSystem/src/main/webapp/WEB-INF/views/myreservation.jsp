<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<html>

<head>
	<title>My Reservation</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>

<script>
$(function(){
	$("#newreviewbtn").on("click",function(){
		var bk_id = $(this).attr("data-bk_id");
		var ht_id = $(this).attr("data-ht_id");
		var mb_id = "${sessionScope.loginId}";
		window.open('goNewReview?bk_id='+bk_id+'&ht_id='+ht_id+'&mb_id='+mb_id , 'new Review', 'width=500, height=400, menubar=no, status=no, toolbar=no');
	});
});

</script>
</head>

<body>
  <jsp:include page="navibar.jsp" /> 

<h5 align="center">My Reservation</h5>
<table class="hdtable res">
<colgroup>
			<col width="10%;">
			<col width="20%;">
			<col width="17%;">
			<col width="10%;">
			<col width="10%;">
			<col width="10%;">
			<col width="10%;">
			<col width="13%;">
			
		</colgroup>
<tr>
<td>No.</td><td>Hotel</td><td>Room Name</td><td>Price</td><td>Check-in</td><td>Check-out</td><td>Status</td><td></td>

</tr>
<c:forEach items="${bList}" var="booking">
<tr>
	<td>${booking.BK_ID}</td>
	<td><a href="goHoteldetail?ht_id=${booking.HT_ID}">${booking.HT_NAME}</a></td>
	<td>${booking.RM_NAME}</td>
	<td>${booking.BK_PRICE}</td>
	<td>${booking.BK_CHECKIN}</td>
	<td>${booking.BK_CHECKOUT}</td>
	<td>${booking.BK_STATUS}</td>
	<c:if test="${booking.BK_STATUS=='BOOKED'}">
	<td>
		<form action="deleteBooking" method="POST">
		<input type="hidden" name="bk_id" value="${booking.BK_ID}">
		<button id="cancelbookingbtn">cancel</button>
		</form>
	</td>
	</c:if>
	<c:if test="${booking.BK_STATUS=='USED'}">
	<td>
	<button id="newreviewbtn" data-ht_id="${booking.HT_ID}" data-bk_id="${booking.BK_ID}">Review</button> 
	</td>
	</c:if>
</tr>
</c:forEach>
</table>

</body>
</html>