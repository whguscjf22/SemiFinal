<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
        	<br/><hr><br/>
        	<button type="button" class="logout" onClick="location.href='http://localhost:8080/logout'">로그아웃</button> <br/>
	        <button type="button" class="userDetail" onClick="location.href='http://localhost:8080/user/${userId}'">회원정보</button>
	    </c:if>     
       </div>
       <nav class="side-bar">
     	<ul>
	       	<li><a href="/main">홈</a></li>
			<li><a href="/board?boardName=noticeBoard">공지게시판</a></li>
			<li><a href="/board?boardName=infoBoard">정보게시판</a></li>
			<li><a href="/board?boardName=freeBoard">자유게시판</a></li>
   		</ul>
     </nav>
</aside>

