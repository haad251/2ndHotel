<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/style.css?after">
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<body>
<nav class="navbar navbar-default navbar-expand-lg navbar-light">
	<div class="navbar-header d-flex col">
		<a class="navbar-brand" href="goHome">my<b>Tel</b></a>  		
		<button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle navbar-toggler ml-auto">
			<span class="navbar-toggler-icon"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>

	<div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">
<c:if test="${sessionScope.loginId!=null}">
		<ul class="nav navbar-nav">
			<li class="nav-item dropdown">
				<a data-toggle="dropdown" class="nav-link dropdown-toggle">MyPage<b class="caret"></b></a>
				<ul class="dropdown-menu">					
					<li><a href="goMyProfile" class="dropdown-item">Profile</a></li>
					<li><a href="goMyReservation" class="dropdown-item">Reservation</a></li>
				</ul>
			</li>
			<c:if test="${sessionScope.hotelId==null}">		
			<li class="nav-item"><a href="goNewHost" class="nav-link">HostPage</a></li>
			</c:if>
			<c:if test="${sessionScope.hotelId!=null}">		
			<li class="nav-item"><a href="goAdmin" class="nav-link">HostPage</a></li>
			</c:if>
		</ul>
</c:if>			

		<ul class="nav navbar-nav navbar-right ml-auto">	
<c:if test="${sessionScope.loginId==null}">		
			<li class="nav-item">
				<a data-toggle="dropdown" class="nav-link dropdown-toggle" href="#">Login</a>
				<ul class="dropdown-menu form-wrapper">					
					<li>
						<form action="login" method="post">
							<div class="form-group">
								<input type="text" name="mb_id" class="form-control" placeholder="Username" required="required">
							</div>	
							<div class="form-group">
								<input type="password" name="mb_pwd" class="form-control" placeholder="Password" required="required">
							</div>
							<input type="submit" class="btn btn-primary btn-block" value="Login">
						</form>
					</li>
				</ul>
			</li>
			<li class="nav-item">
				<a href="#" data-toggle="dropdown" class="btn btn-primary dropdown-toggle get-started-btn mt-1 mb-1">Sign up</a>
				<ul class="dropdown-menu form-wrapper">					
					<li>
						<form action="insertMember" method="post">
							<p class="hint-text">create your account!</p>
							<div class="form-group">
								<input type="text" name="mb_id" class="form-control" placeholder="Username" required="required">
							</div>
							<div class="form-group">
								<input type="password" name="mb_pwd" class="form-control" placeholder="Password" required="required">
							</div>
							<div class="form-group">
								<input type="email" name="mb_email" class="form-control" placeholder="E-mail" required="required">
							</div>

							<input type="submit" class="btn btn-primary btn-block" value="Sign up">
						</form>
					</li>
				</ul>
			</li>
</c:if>
<c:if test="${sessionScope.loginId!=null}">
	<li class="nav-item"><a href="logout" class="nav-link">Logout</a></li>
</c:if>
		</ul>
	</div>
</nav>
</body>
</html>
