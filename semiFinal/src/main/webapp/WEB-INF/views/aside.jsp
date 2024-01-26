<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- aside  -->
<aside id="aside">
     <h1 class="logo"><a href="/main">Muti 게시판</a></h1>
      <div class="login">
       <form action="">
           <input type="text" placeholder="아이디" class="in">
           <input type="password" placeholder="비밀번호" class="in">
           <input type="submit" id="btn" value="로그인"><br>
       </form>
       <a href="#">회원가입을 하시겠습니까?</a>
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
