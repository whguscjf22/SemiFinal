<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- action, method -->
<form action="/joinUser" method="POST">
	<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
	    <tr>
	        <td width="1220" height="20" colspan="2" bgcolor="#336699">
	            <p align="center">
	            	<font color="white" size="3">
	            		<b>회원가입</b>
	            	</font>
	            </p>
	        </td>
	    </tr>
	    <tr>
	        <td width="150" height="20"> 
	            <p align="center"><b><span style="font-size:12pt;">회원 ID</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span style="font-size:12pt;">
	        			<input id="userId" type="text" name="userId" size="30">
	        		</span>
	        		<br/>
	        		<span id="userMsg" style="font-size:8pt;"></span>
	        	</b>
	        </td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="center"><b><span style="font-size:12pt;">회  원  명</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span style="font-size:12pt;">
	        			<!-- input 박스 -->
	        			<input id="userName" name="userName" size="30">
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
	        		<span style="font-size:12pt;">
	        			<!-- input 박스 -->
	        			<input id="password" name="password" size="30">
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
						<input type="submit" value="회원가입">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">
					</span>
				</b>
			</td>
	    </tr>
	</table>
</form>

</body>
</html>