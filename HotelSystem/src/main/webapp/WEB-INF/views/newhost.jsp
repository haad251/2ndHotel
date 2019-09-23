<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<html>

<head>
	<title>New Host!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>

<script>
$(document).on("click","#newhostbtn",function(){
	if($("#ht_id").val().length<5 || ht_id>12){
		alert("Please enter at 5~12 characters")
		return;
	}			
	 $("#newhostForm").submit();
});

</script>
</head>

<body>
  <jsp:include page="navibar.jsp" /> 

<h4 align="center">Become a New Host!!</h4>
<form action="insertHotel" id="newhostForm" method="POST" enctype="multipart/form-data">
<table class="hdtable">
<tr><td>ID</td><td><input type="text" id="ht_id" name="ht_id"></td></tr>
<tr><td>Name</td><td><input type="text" name="ht_name"></td></tr>
<tr><td>Information</td><td><textarea style="width:300px;" rows="6" name="ht_info"></textarea></td></tr>
<tr><td>Address</td><td><input type="text" name="ht_addr"></td></tr>
<tr><td>Location1</td><td><input type="text" name="ht_loc_1"></td></tr>
<tr><td>Location2</td><td><input type="text" name="ht_loc_2"></td></tr>
<tr><td>LocationX</td><td><input type="text" name="ht_loc_x"></td></tr>
<tr><td>LocationY</td><td><input type="text" name="ht_loc_y"></td></tr>
<tr><td>Meal</td><td><input type="checkbox" name="ht_meal"></td></tr>
<tr><td>Park</td><td><input type="checkbox" name="ht_park"></td></tr>
<tr><td>Main Photo</td><td><input type="file" name="uploadFile"></td></tr>
</table>
<input type="button" id="newhostbtn" value="Submit">
</form>


</body>
</html>
