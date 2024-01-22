<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- https://www.w3schools.com/howto/tryit.asp?filename=tryhow_css_style_header -->
<header>
  <h1>Servlet / JSP</h1>
  <p>Dept Practice Header</p>
  <div align="right">
	  	<c:if test="${empty sessionScope.userId}">
		  	<span style="font-size:12pt;"><input type="button" value="로그인" onclick="location.href='login'"></span>
	  	</c:if>
  		<c:if test="${not empty sessionScope.userId}">
  			<span>${sessionScope.userName} 님 </span>
	  		<span style="font-size:12pt;"><input type="button" value="로그아웃" onclick="location.href='logout'"></span>
		</c:if>
	</div>
</header>
