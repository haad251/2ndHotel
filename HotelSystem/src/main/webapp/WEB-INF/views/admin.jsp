<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<html>

<head>
	<title>Admin</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$(function(){
	$(".chatbtn").on("click",function(){
		var mbid = $(this).attr("data-mb_id");
		alert(mbid);
		var htid = "${sessionScope.hotelId}";
		alert(htid);
		window.open('goChatroom?mb_id='+mbid+'&ht_id='+htid, 'chat', 'width=500, height=400, menubar=no, status=no, toolbar=no');
	});
}); 

</script>


</head>

<body>
<jsp:include page="navibar.jsp" /> 


<form action="updateHotel" method="POST">
<h5 align="center">Hotel Information</h5>
<table class="hdtable">
<tr><td>ID</td><td>${hotelMap.HT_ID}<input type="hidden" name="ht_id" value="${hotelMap.HT_ID}">
</td></tr>
<tr><td>Name</td><td><input type="text" name="ht_name" value="${hotelMap.HT_NAME}"></td></tr>
<tr><td>Information</td><td><input type="text" name="ht_info" value="${hotelMap.HT_INFO}"></td></tr>
<tr><td>Address</td><td><input type="text" name="ht_addr" value="${hotelMap.HT_ADDR}"></td></tr>
<tr><td>Location1</td><td><input type="text" name="ht_loc_1" value="${hotelMap.HT_LOC_1}"></td></tr>
<tr><td>Location2</td><td><input type="text" name="ht_loc_2" value="${hotelMap.HT_LOC_2}"></td></tr>
<tr><td>LocationX</td><td><input type="text" name="ht_loc_x" value="${hotelMap.HT_LOC_X}"></td></tr>
<tr><td>LocationY</td><td><input type="text" name="ht_loc_y" value="${hotelMap.HT_LOC_Y}"></td></tr>
<tr><td>Meal</td><td><input type="checkbox" name="ht_loc_y" ></td></tr>
<tr><td>Park</td><td><input type="checkbox" name="ht_loc_y"></td></tr>
<tr><td></td><td><input type="submit" value="수정하기"></td></tr>
</table>
</form>

<h5 align="center">Hotel Photo</h5>
<form action="insertFile" method="post" enctype="multipart/form-data">
<table class="hdtable">
<tr><td><c:forEach items="${fileList}" var="images">
  <img width="100px" src="<c:url value='/img/${images.FILE_SAV}'/>">
</c:forEach></td>
<tr>
<td><input type="file" name="uploadFile">
<input type="submit" value="Submit"></td>
</tr>
</table>
</form>
<br>
<br>

<h5 align="center">Room List</h5>
<table class="hdtable res">
		<colgroup>
			<col width="20%;">
			<col width="20%;">
			<col width="20%;">
			<col width="20%;">
			<col width="20%;">
		</colgroup>
		<thead>
			<tr>
			<td>Type</td>
			<td>bed</td>
			<td>Max</td>
			<td>Price</td>
			<td></td>
			
			</tr>
		</thead>
			<c:forEach items="${roomList}" var="room">
				<form action="updateRoom" method="POST"> 
				<tr>
				<td>
				<input type="hidden" name="rm_id" value="${room.RM_ID}">
				<input type="text" name="rm_name" value="${room.RM_NAME}"/></td>
				<td><input type="text" name="rm_bed" value="${room.RM_BED}" /></td>
				<td><input type="text" name="rm_cnt" value="${room.RM_CNT}" /></td>
				<td><input type="text" name="rm_price" value="${room.RM_PRICE}" /></td>
				<td><input type="submit" value="Edit"></td>
				</tr>
				</form>	
				</c:forEach>
				<form action="insertRoom" method="POST">
				<tr>
				<td><input type="text" name="rm_name"></td>
				<td><input type="text" name="rm_bed"></td>
				<td><input type="text" name="rm_cnt"></td>
				<td><input type="text" name="rm_price"></td>
				<td><input type="submit" value="Submit"></td>				
				</tr>	
				</form>
			</table>
<br>
<h5 align="center">Booking List</h5>

<table class="hdtable res">
<colgroup>
			<col width="10%;">
			<col width="10%;">
			<col width="10%;">
			<col width="10%;">
			<col width="10%;">
			<col width="10%;">
			<col width="20%;">
			<col width="20%;">
			
		</colgroup>
<tr>
<td>No.</td><td>ID</td><td>Room Name</td><td>Price</td><td>Check-in</td><td>Check-out</td><td>Status</td><td></td>
</tr>
<c:forEach items="${bList}" var="booking">
<tr>
	<td>${booking.BK_ID}</td>
	<td>${booking.MB_ID}</td>
	<td>${booking.RM_NAME}</td>
	<td>${booking.BK_PRICE}</td>
	<td>${booking.BK_CHECKIN}</td>
	<td>${booking.BK_CHECKOUT}</td>
	<td>${booking.BK_STATUS}</td>
	<c:if test="${booking.BK_STATUS=='BOOKED'}">
	<td>
		<form action="deleteBooking" method="POST">
		<input type="hidden" name="bk_id" value="${booking.BK_ID}">
		<input type="hidden" name="forhotel" value="true">
		<button id="cancelbookingbtn">cancel</button>
		</form>
		<form action="switchBooking" method="POST">
		<input type="hidden" name="bk_id" value="${booking.BK_ID}">
		<button>done</button>
		</form>
	</td>
	</c:if>
	<c:if test="${booking.BK_STATUS=='USED'}">
	<td>
	</td>
	</c:if>
</tr>
</c:forEach>
</table>
<br>
<h5 align="center">Chat List</h5>

<table class="hdtable res">
<tr><td>ID</td></tr>
<c:forEach items="${cmList}" var="member" >
<tr>
<td><button class="chatbtn" data-mb_id="${member.MB_ID}">${member.MB_ID}</button></td>
</tr>
</c:forEach>
</table>


</body>
</html>