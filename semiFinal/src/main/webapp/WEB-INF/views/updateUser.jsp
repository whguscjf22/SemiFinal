<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Muti 게시판 Detail</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link href="/resources/css/layout1.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/layout2.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id = "wrap">
	<!-- aside  -->
	<aside id="aside">
      <h1 class="logo"><a href="/main">Multi 게시판</a></h1>
       <div class="login">
	   	<c:if test="${empty sessionScope.userId}">
	        <form action="login">
	            <input type="submit" id="login" value="로그인"><br>
	        </form>
        	<a href="/joinUser">회원가입을 하시겠습니까?</a>
		</c:if> 
		<c:if test="${not empty sessionScope.userId}">
        	<strong>${userId} 님</strong><br>
        	<strong> 회원 등급 :${userGrade}</strong><br>
	        <form action="logout">
	        	<input type="submit" id="logout" value="로그아웃">
	        </form>
	        <form action="modify/user/${userId}">
	           	<input type="submit" id="updateUserDetail" value="회원정보 수정"><br>
	        </form>
	    </c:if>     
       </div>
	   <nav class="side-bar">
	   	<ul>
	     	<li><a href="/main">홈</a></li>
			<li><a href="#">공지게시판</a></li>
			<li><a href="#">정보게시판</a></li>
			<li><a href="#">자유게시판</a></li>
	 	</ul>
	   </nav>
    </aside>
	<!-- main  -->
	<main id="main">
		<section class="notice">
		  <div class="page-title">
		        <div class="container">
		            <h3>회원가입</h3>
		        </div>
		  </div>
			<!-- action, method -->
			<form action="/user/${user.userId}" method="POST">
				<!-- PUT -->
				<input type="hidden" name="_method" value="PUT">
				<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
				    <tr>
				        <td width="1220" height="20" colspan="2" bgcolor="#336699">
				            <p align="center">
				            	<font color="white" size="3">
				            		<b>회원 정보 업데이트</b>
				            	</font>
				            </p>
				        </td>
				    </tr>
				    <tr>
				        <td width="150" height="20">
				            <p align="center"><b><span style="font-size:9pt;">회원 아이디</span></b></p>
				        </td>
				        <td width="450" height="20" align="center">
				        	<b>
				        		<span style="font-size:9pt;">
				        			<input type="text" name="userId" size="30" value="${userId}" readonly disabled>
				        		</span>
				        	</b>
				        </td>
				    </tr>
				    <tr>
				        <td width="150" height="20">
				            <p align="center"><b><span style="font-size:9pt;">회원명</span></b></p>
				        </td>
				        <td width="450" height="20" align="center">
				        	<b>
				        		<span style="font-size:9pt;">
				        			<input type=text name="dname" size="30" value="${userName}">
				        		</span>
				        	</b>
				        </td>
				    </tr>
				    <tr>
				        <td width="150" height="20">
				            <p align="center"><b><span style="font-size:9pt;">비밀번호</span></b></p>
				        </td>
				        <td width="450" height="20" align="center">
				        	<b>
				        		<span style="font-size:9pt;">
				        			<input type=password name="password" size="30" value="${password}">
				        		</span>
				        	</b>
				        </td>
				    </tr>
				    <tr>
				        <td width="150" height="20">
				            <p align="center"><b><span style="font-size:9pt;">회원등급</span></b></p>
				        </td>
				        <td width="450" height="20" align="center">
				        	<b>
				        		<span style="font-size:9pt;">
				        			<input type="text" name="Grade" size="30" value="${Grade}" readonly disabled>
				        		</span>
				        	</b>
				        </td>
				    </tr>
				    
				    <tr>
				        <td width="150" height="20">
				            <p><b><span style="font-size:9pt;">&nbsp;</span></b></p>
				        </td>
				        <td width="450" height="20" align="center">
				        	<b>
				        		<span style="font-size:9pt;">
									<input type="submit" value="회원수정">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" value="다시작성">
								</span>
							</b>
						</td>
				    </tr>
				</table>
			</form>
<hr>
<div align=center>
	<span style="font-size:12pt;"><input type="button" value="메인으로" onclick="location.href='/main'"></span>
</div>
</body>
</html>