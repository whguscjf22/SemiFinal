<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>

<style>
	.mt20 {margin-top:20px;}
	#footer {
			width: 100%;
			height: 150px;
			bottom: 0px;
			position: absolute;
			background-color: #273c75;
			padding: 20px;
	}
	#footer a {
			display: inline-block;
			margin: 0 20px 1px 20px;
			color: #fff; font-size: 15px;
			text-decoration: none;
	}
	#footer span {
			margin: 0 20px;
			color: #fff;
	}
	#header_nav a {
		color : #fff;
	}
	 	textarea {
		    border: none;
		    resize: none;
  	}
	
	
</style>

</head>
<body>

	<%
		String userId = null;
		if(session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
	%>
	
	<nav id="header_nav" class="navbar navbar-expand-lg navbar-light" style="background-color: #273c75;">
		<a class="navbar-brand" href="getboardlist.do" style="margin-left:15px;">JSP 게시판</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="getboardlist.do">게시판</a>
				</li>
			</ul>
			<%
				if(userId != null) {
					
			%>
			<ul class="navbar-nav">
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown"
					aria-expanded="false"> ${ userId } 님 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="logout.do" style="color: #000">로그아웃	</a> 
					</div>
				</li>
			</ul>
			<%
				} else {
			%>
			<ul class="navbar-nav">
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown"
					aria-expanded="false"> 회원관리 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="logoutAction.jsp">로그인	</a> 
					</div>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>