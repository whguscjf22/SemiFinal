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
	            <h3>로그인</h3>
	        </div>
		  </div>
		  
			<!-- action, method -->
			<form action="/login" method="POST">
			<div id="board-list">
		        <div class="container" style="width:600px;">
		        	<table class="board-table">
		        		 <colgroup>
			                <col width="25%">
				            <col width="*">
			            </colgroup>
	        			<tr>
		                    <td colspan="2" bgcolor="#555" style="color:white; font-size:20px;">로그인</td>
		                </tr>
	        			<tr>
		                    <th scope="row" bgcolor="#F9F9F9">회원아이디</th>
		                    <td colspan="2">
		                       <span style="font-size:12pt;">
				        			<input id="userId" type="text" name="userId" size="30">
				        		</span>
		                    </td>
		                </tr>
		                <tr>
		                    <th scope="row" bgcolor="#F9F9F9">비밀번호</th>
		                    <td colspan="2">
		                       <span style="font-size:12pt;">
				        			<!-- input 박스 -->
				        			<input type="password" name="password" size="30">
				        		</span>
		                    </td>
		                </tr>
	        			<tr>
					        <td width="150" height="20">
					            <p><b><span style="font-size:12pt;">&nbsp;</span></b></p>
					        </td>
					        <td width="450" height="20" align="center">
					        	<b>
					        		<span style="font-size:12pt;">
										<input type="submit" class="Ctn" value="로그인">
										&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="reset" class="Ctn" value="다시작성">
									</span>
								</b>
							</td>
					    </tr>
					</table>
				</div>
			</div>
			</form>

			<div align=center>
				<span style="font-size:12pt;"><input type="button" class="Ctn" value="회원가입" onclick="location.href='/joinUser'"></span>
			</div>
			
		</section>
	</main> 
	
	<!-- footer -->
	<%@ include file="footer.jsp" %>
	 
</div>	
</body>
</html>