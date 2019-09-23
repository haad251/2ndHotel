<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/style.css?after">

<script>
$(function(){
	$("#reviewsubmitbtn").on("click",function(){
		$.ajax({
			url:"insertReview",
			data:{
				bk_id:'${bk_id}',
				mb_id:'${mb_id}',
				ht_id:'${ht_id}',
				rv_content:$("#rv_content").val(),
				rv_rate:$("#rv_rate").val()
			},
			type:"POST",
			success:function(serverData){
				window.close();
			}
		});
	});
	
});


</script>
 
 </head>

Content<textarea rows="20" id="rv_content" name="rv_content"></textarea>
Rate<input type="number" id="rv_rate" name="rv_rate" min="1" max="5">
<input id="reviewsubmitbtn" type="button" value="subtmi">


</body>
</html>