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
	
	<!-- aside -->
    <%@ include file="aside.jsp" %>
    
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
				<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
				    <tr>
				        <td width="1220" height="20" colspan="2" bgcolor="#333">
				            <p align="center">
				            	<font color="white" size="3">
				            		<b>로그인</b>
				            	</font>
				            </p>
				        </td>
				    </tr>
				    <tr>
				        <td width="150" height="20">
				            <p align="center"><b><span style="font-size:12pt;">회원 아이디</span></b></p>
				        </td>
				        <td width="450" height="20" align="center">
				        	<b>
				        		<span style="font-size:12pt;">
				        			<input id="userId" type="text" name="userId" size="30">
				        		</span>
				        		<br/>
				        		<span id="empnoMsg" style="font-size:8pt;"></span>
				        	</b>
				        </td>
				    </tr>
				    <tr>
				        <td width="150" height="20">
				            <p align="center"><b><span style="font-size:12pt;">비밀번호</span></b></p>
				        </td>
				        <td width="450" height="20" align="center">
				        	<b>
				        		<span style="font-size:12pt;">
				        			<!-- input 박스 -->
				        			<input type="password" name="password" size="30">
				        		</span>
				        	</b>
				        </td>
				    </tr>
				    <tr>
				        <td width="150" height="20">
				            <p><b><span style="font-size:12pt;">&nbsp;</span></b></p>
				        </td>
				        <td width="450" height="20" align="center">
				        	<b>
				        		<span style="font-size:12pt;">
									<input type="submit" value="로그인">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" value="다시작성">
								</span>
							</b>
						</td>
				    </tr>
				    <tr>
				        <td width="150" height="20">
				            <p align="center"><b><span style="font-size:12pt;">회원가입</span></b></p>
				        </td>
				        <td width="450" height="20" align="center">
				        	<b>
				        		<span style="font-size:12pt;">
				        			<!-- 회원가입 -->
				          			<button type="button" class="joinUser" onClick="location.href='http://localhost:8080/joinUser'">회원가입</button> <br/>
				        		</span>
				        	</b>
				        </td>
				    </tr>
				</table>
			</section>
	</main>
	
	<!-- footer -->
    <%@ include file="footer.jsp" %>
    
</div>	
</body>
</html>
</body>
</html>