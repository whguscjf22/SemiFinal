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
		            <h3>회원가입</h3>
		        </div>
		  </div>
			<!-- action, method -->
			<form action="/modify/user/${user.userId}" method="GET" name="detailForm" id="detailForm" >
				<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
				    <tr>
				        <td width="1220" height="20" colspan="2" bgcolor="#333">
				            <p align="center">
				            	<font color="white" size="3">
				            		<b>회원 상세 정보</b>
				            	</font>
				            </p>
				        </td>
				    </tr>
				    <tr>
				        <td width="150" height="20">
				            <p align="center"><b><span style="font-size:12pt;">회원아이디</span></b></p>
				        </td>
				        <td width="450" height="20" align="center">
				        	<b>
				        		<span id="UserId" style="font-size:12pt;">
				        			${uesr.userId}
				        		</span>
				        	</b>
				        </td>
				    </tr>
				    <tr>
				        <td width="150" height="20">
				            <p align="center"><b><span style="font-size:12pt;">회원명</span></b></p>
				        </td>
				        <td width="450" height="20" align="center">
				        	<b>
				        		<span style="font-size:12pt;">
				        			${user.userName}
				        		</span>
				        	</b>
				        </td>
				    </tr>
				    <tr>
				        <td width="150" height="20">
				            <p align="center"><b><span style="font-size:12pt;">비밀번호</span></b></p>
				        </td>
				        <td width="450" height="20" align="center">
				        	<b>
				        		<span style="font-size:12pt;" type="password">
				        			${user.password}
				        		</span>
				        	</b>
				        </td>
				    </tr>
				    <tr>
				        <td width="150" height="20">
				            <p align="center"><b><span style="font-size:12pt;">회원 등급</span></b></p>
				        </td>
				        <td width="450" height="20" align="center">
				        	<b>
				        		<span style="font-size:12pt;">
				        			${user.grade} 
				        		</span>
				        	</b>
				        </td>
				    </tr>
				    <tr>
				        <td width="150" height="20">
				            <p align="center"><b><span style="font-size:12pt;">&nbsp;</span></b></p>
				        </td>
				        <td width="450" height="20" align="center">
				        	<b>
				        		<span style="font-size:12pt;">
				        		<button type="button" class="joinuser" onClick="location.href='http://localhost:8080/modify/user/${userId}'">회원정보 수정</button>
								</span>
							</b>
						</td>
				    </tr>
				</table>
			</form>
	
			<hr>
			<div align=center>
				<span style="font-size:12pt;"><input type="button" value="메인으로" onclick="location.href='/main'"></span>
				<span style="font-size:12pt;"><input type="button" value="회원 삭제" onclick="deleteUser()"></span>
			</div>
			
			<%@ include file="footer.jsp" %>
			
			<script type="text/javascript">
			
				
				function deleteUser(){	  
				  let detailForm = document.getElementById('detailForm');		  
				  let userId = document.getElementById('userId').innerHTML;
			
				  let hiddenInput = document.createElement('input');
				  hiddenInput.type = 'hidden';
				  hiddenInput.name = '_method';
				  hiddenInput.value = 'DELETE';
				  
				  detailForm.append(hiddenInput);
				  
				  detailForm.action = "/user/" + userId;
				  detailForm.method = "POST";
				  detailForm.submit();
				}
			
			</script>
			</section>
			</main>
			<!-- footer -->
    		<%@ include file="footer.jsp" %>
		</div>	
	</body>
</html>
