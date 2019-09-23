<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
<script>  

$(function(){
	var chatstatus = false;
	var loginId = '${sessionScope.loginId}';
	var hotelId = "${hotelMap.HT_ID}";
	setInterval(getChatList, 3000);
	initialize();
	 $('.carousel').carousel({
			interval: 4000
		});

		$('#bookingbtn').on("click",function(){
			if(${sessionScope.loginId==null}){
				alert("login first!!");
				return;
			}else
				$('#bookingform').submit();
		});

	 
	 
	 var disabledDays = new Array();
	
	$('.indate').on("click",function(){
		$("div").remove("#ui-datepicker-div");
		var indrid=$(this).attr("data-rm_id");
		$.ajax({
			url:"selectDate",
			data:{
				rm_id:$(this).attr("data-rm_id")
			},
			type:"POST",
			success:function(datelist){
				disabledDays=[];
				for(var i=0;i<datelist.length;i++){
					disabledDays.push(datelist[i]);
				}
				alert(disabledDays);
				if(datelist.length==0){
					$("#"+indrid+"in").datepicker({
						constrainInput: true,    
					    minDate: new Date(),       
					    autoSize: true,          
					    altFormat: "yy-MM-dd",   
					    dateFormat: "yy-mm-dd",
						duration: "slow",
						onClose: function() {
							$("#"+indrid+"in").datepicker("destroy");
				            $("#"+indrid+"in").removeClass("hasDatepicker");
				        }
					 });
				}else{
				
				 $("#"+indrid+"in").datepicker({
					constrainInput: true,    
				    minDate: new Date(),       
				    autoSize: true,          
				    altFormat: "yy-MM-dd",   
				    dateFormat: "yy-mm-dd",
					beforeShowDay: disableAllTheseDays,
					duration: "slow",
					onClose: function() {
						$("#"+indrid+"in").datepicker("destroy");
			            $("#"+indrid+"in").removeClass("hasDatepicker");
			        }
				 });
				}
			}
		});
	});
	
	$('.outdate').on("click",function(){
		$("div").remove("#ui-datepicker-div");
		var outdrid=$(this).attr("data-rm_id");
		$.ajax({
			url:"selectDate",
			data:{
				rm_id:$(this).attr("data-rm_id")
			},
			type:"POST",
			success:function(datelist){
				disabledDays=[];
				for(var i=0;i<datelist.length;i++){
					disabledDays.push(datelist[i]);
				}
				alert(disabledDays);
				if(datelist.length==0){
					$("#"+outdrid+"out").datepicker({
						constrainInput: true,    
					    minDate: new Date(),       
					    autoSize: true,          
					    altFormat: "yy-MM-dd",   
					    dateFormat: "yy-mm-dd",
						duration: "slow",
						onClose: function() {
							$("#"+outdrid+"out").datepicker("destroy");
				            $("#"+outdrid+"out").removeClass("hasDatepicker");
				        }
					 });
				}else{
				
				 $("#"+outdrid+"out").datepicker({
					constrainInput: true,    
				    minDate: new Date(),       
				    autoSize: true,          
				    altFormat: "yy-MM-dd",   
				    dateFormat: "yy-mm-dd",
					beforeShowDay: disableAllTheseDays,
					duration: "slow",
					onClose: function() {
						$("#"+outdrid+"out").datepicker("destroy");
			            $("#"+outdrid+"out").removeClass("hasDatepicker");
			        }
				 });
				}
			}
		});
	});
		function disableAllTheseDays(date) {
				var m = date.getMonth();
				var d = date.getDate(); 
				if(d.toString().length==1){
					var t = d;
					var d = '0'+ t;
				}
				var y = date.getFullYear();
					if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
				return [false];
					}
				return [true];
		}
		
		
		
		function getChatList() {
			if (!chatstatus)
				return;
					$.ajax({
						url : "getChatList",
						data : {
							ht_id : hotelId,
							mb_id : loginId
						},
						type : "POST",
						success : function(serverData) {
							var str = "";
							for (var i = 0; i < serverData.length; i++) {
								if (serverData[i].CH_SEND == loginId) {
									str += '<div class="rightms"><img align="right"src="http://gravatar.com/avatar/7124bc62949227ac21a52e9533e6d478?s=80"width="30px">';
								} else {
									str += '<div class="leftms"><img align="left"src="http://gravatar.com/avatar/7124bc62949227ac21a52e9533e6d478?s=80"width="30px">';
								}
								str += serverData[i].CH_MESSAGE
										+ '<div class="sil"></div></div>';
							}
							$("#messagediv").html(str);
						}
					});
		}
		
		function insertChat() {
			$.ajax({
				url : "insertChat",
				data : {
					mb_id : loginId,
					ht_id : hotelId,
					ch_message : $("#txt").val(),
					ch_send : loginId
				},
				type : "post",
				success : function(serverdata) {
					if (serverdata == "ok")
						$("#txt").val("");

					$("#txt").focus();

				}
			});
		}
		
		$(".kapat").click(function(){
			var durum = $(this).text(), chat = $("#chat"), yaz = $(this);
			if (durum == "-") {
				yaz.html("+");
				chat.animate({
					opacity : 0.50,
					bottom : "-322px"
				}, 1000);
				chatstatus = false;
			} else {
				yaz.html("-");
				chat.animate({
					opacity : 1,
					bottom : "0px"
				}, 1000);
				chatstatus = true;
			}
		});

		$('#txt').keydown(function(e) {
			if (e.keyCode == 13) {
				insertChat();
			}
		});
}); 
</script>  

<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
 <script>
  function initialize() {
	var forlocation = $("#ht_loc_x").val();
	var forlocation2 = $("#ht_loc_y").val();
   var myLatlng = new google.maps.LatLng(forlocation,forlocation2);
   var mapOptions = {
        zoom: 17,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
   }
   var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
   
   var marker = new google.maps.Marker({
       position: myLatlng,
       map: map,
       title: ""
	});
   
  }
 </script>

<title>Insert title here</title>
</head>


<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
  <jsp:include page="navibar.jsp" /> 
  
 <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
  	<c:forEach items="${fileList}" var="images" varStatus="status">
       <c:if test="${status.first}">
		   <li data-target="#myCarousel" data-slide-to="${status.count}" class="active"></li>
        </c:if>
       <c:if test="${!status.first}">
      	   <li data-target="#myCarousel" data-slide-to="${status.count}"></li>
       </c:if>
	</c:forEach>
  </ol>
  
  <div class="carousel-inner" role="listbox">
   <c:forEach items="${fileList}" var="images" varStatus="status">
       <c:if test="${status.first}">
			 <div class="item active">
    			<img src="<c:url value='/img/${images.FILE_SAV}'/>">
   			</div>
        </c:if>
       <c:if test="${!status.first}">
     	   <div class="item">
    			<img src="<c:url value='/img/${images.FILE_SAV}'/>">
   			</div>
       </c:if>
	</c:forEach>
  </div>

  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
   <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
   <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
   <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
   <span class="sr-only">Next</span>
  </a>
 </div>
 

 <div class="hoteltitle"><h3>${hotelMap.HT_NAME}</h3>
  <span class="star star-${hotelRate}">★★★★★</span>
 </div>
	
	<div class="tabs">
    <input type="radio" name="tab" id="tab1" checked="checked">
    <label for="tab1">Information</label>
    <input type="radio" name="tab" id="tab2">
    <label for="tab2">Reservation</label>
    <input type="radio" name="tab" id="tab3">
    <label for="tab3">Location</label>
    <input type="radio" name="tab" id="tab4">
    <label for="tab4">Review</label>
  
    <div class="tab-content-wrapper">
    
    
<!--   tab1   -->
      <div id="tab-content-1" class="tab-content">
        <p>${hotelMap.HT_INFO}</p>
      </div>
      
<!-- tab2 -->
      <div id="tab-content-2" class="tab-content">
      <table class="hdtable">
		<colgroup>
			<col width="20%;">
			<col width="10%;">
			<col width="10%;">
			<col width="15%;">
			<col width="20%;">
			<col width="10%;">
			<col width="15%;">
		</colgroup>
		<thead>
			<tr>
			<td>Type</td>
			<td>bed</td>
			<td>Max</td>
			<td>Price</td>
			<td>Date</td>
			<td>Count</td>
			<td>Reservation</td>
			
			</tr>
		</thead>
			<c:forEach items="${roomList}" var="room">
				<form id="bookingform" action="insertBooking" method="POST">
				<tr class="rvtr">
				<td>${room.RM_NAME}</td>
				<td>${room.RM_BED}</td>
				<td>${room.RM_CNT}</td>
				<td>${room.RM_PRICE}</td>
				<td>
					<input type="hidden" name="rm_id" value="${room.RM_ID}"/>
					<input type="hidden" name="bk_price" value="${room.RM_PRICE}" />
					<input type="hidden" name="mb_id" value="${sessionScope.loginId}" />
					<input type="hidden" name="ht_id" value="${hotelMap.HT_ID}" />
					<input type="text" id="${room.RM_ID}in"  data-rm_id="${room.RM_ID}" name="bk_checkin" class="indate" placeholder="Check-in" autocomplete="off" style="width:100px;" required=""><br>
					<input type="text" id="${room.RM_ID}out" data-rm_id="${room.RM_ID}" name="bk_checkout" class="outdate" placeholder="Check-out" autocomplete="off" style="width:100px;" required=""> 
				</td>
				<td>
					<input type="number" name="bk_cnt" min='1' max="${room.RM_CNT}" style="width:30px;" required="">
				</td>
				<td>
					<input type="button" id="bookingbtn" value="book">
				</td>
				</tr>
				</form>		
				</c:forEach>
			</table>
      </div>
      
<!--      tab3  -->
      <input type="hidden" id="ht_loc_x" value="${hotelMap.HT_LOC_X}">
      <input type="hidden" id="ht_loc_y" value="${hotelMap.HT_LOC_Y}"> 
      <div id="tab-content-3" class="tab-content">
	      <div id="map_canvas"style="width:500px; height:300px; margin: auto;"></div>
          </div>
<!--       tab4 -->
      
      <div id="tab-content-4" class="tab-content">
			<table class="hdtable">
			<col width="10%;">
			<col width="20%;">
			<col width="60%;">
			<col width="10%;">
				<tr><td>no.</td><td>id</td><td>content</td><td>rate</td></tr>
			<c:forEach items="${reviewList}" var="review">
			<tr class="rvtr">
				<td>${review.RV_ID}</td><td>${review.MB_ID}</td>
				<td>${review.RV_CONTENT}</td><td>${review.RV_RATE}</td>
			</tr>
			</c:forEach>
			</table>
      </div>
    </div>
  </div>
  
  <div id="chat">
		<header class="baslik">
		<div class="kapat">+</div>
		<h4>1:1 Chat</h4>
		<span class="sayac">3</span> </header>

		<div class="chat">
			<div id="messagediv"></div>
			<form action="javascript:void(0)" method="post" id="form">
				<fieldset class="filedchat">
					<input class="inputchat" type="text" id="txt" placeholder="message" autofocus>
				</fieldset>
			</form>

		</div>
	</div>

	
</body>
</html>