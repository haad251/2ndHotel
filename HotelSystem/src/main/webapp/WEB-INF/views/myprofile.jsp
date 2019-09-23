<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<html>

<head>
	<title>My profile</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>

<script>
	$(function(){
		$("#editbtn").on("click",function(){
			var str = '<form action="updateMember" method="POST">';
			str += '<table class="hdtable"><tr><td>ID</td><td>${myinfo.mb_id}</td></tr>';
			str += '<tr><td>PassWord</td><td><input type="password" name="mb_pwd"></td></tr>';
			str += '<tr><td>E-mail</td><td><input type="email" name="mb_email" value="${myinfo.mb_email}"></td></tr>';
			str += '<tr><td>Type</td><td>${myinfo.mb_status}</td></tr></table>';
			str += '<input type="hidden" name="mb_id" value="${myinfo.mb_id}">';
			str += '<br><button id="editgo" class="minibtn">수정하기</button></form>';

			$("#profilediv").html(str);
		});
		
		
		
		$("#outbtn").on("click",function(){
			var con = confirm("confirm?");
			if(con){
				$("#outForm").submit();
			}
			if(!con){
				return;
			}
		});
		
		
	});

</script>
</head>

<body>
  <jsp:include page="navibar.jsp" /> 

<div id="profilediv">
<table class="hdtable">
<tr>
	<td>ID</td>
	<td>${myinfo.mb_id}</td>
</tr>
<tr>
	<td>Password</td>
	<td>***</td>
</tr>
<tr>
	<td>E-mail</td>
	<td>${myinfo.mb_email}</td>
</tr>
<tr>
	<td>Type</td>
	<td>${myinfo.mb_status}</td>
</tr>
</table>
<br>
<button id="editbtn" class="minibtn">
Edit</button>

</div>
<br>
<form id="outForm" action="deleteMember" method="post">
<input type="hidden" name="mb_id" value="${myinfo.mb_id}">
<button id="outbtn" class="minibtn">
SignOut</button>
</form>

</body>
</html>