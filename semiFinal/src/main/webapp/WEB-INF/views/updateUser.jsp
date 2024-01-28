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
		            <h3>회원정보 수정</h3>
		        </div>
		  </div>
			<!-- action, method -->
			<form action="/modify/user" method="POST">
				<!-- PUT -->
				<input type="hidden" name="_method">
				<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
				    <tr>
				        <td width="1220" height="20" colspan="2" bgcolor="#333">
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
				        			<input type="text" name="userId" size="30" value="${user.userId}" readonly disabled>
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
				        			<input type=text name="userName" size="30" value="${user.userName}">
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
				        			<input type=password name="password" size="30" value="${user.password}">
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
				        			<input type="text" name="grade" size="30" value="${user.grade}" readonly disabled>
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
   <!-- footer -->
   <%@ include file="footer.jsp" %>
</body>
</html>