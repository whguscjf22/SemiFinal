<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<link href="/resources/css/layout1.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/layout2.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<div align="center">
		<h2>죄송합니다. 문제가 발생하였습니다.</h2>
	</div>
	
	<br><hr><br>
	
	<div align="center">
		<h3>${exception.getMessage()}</h3>
	</div>
	 
	<br>
	
	<div align=center>
      <span style="font-size:9pt;">&lt;<a href="main">메인으로</a>&gt;</span>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>