<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<c:if test = "${true}">
<div id = "wrap">
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
		            <h3>공지사항</h3>
		        </div>
		    </div>
   
		  	<!-- board list area -->
		    <div id="board-list">
		        <div class="container">
		        	<span style="font-size:12pt; float: right; margin-bottom:10px; "><input type="button" value="부서생성" class="Btn" onclick="location.href='/board'"></span>
		            <table class="board-table">
		                <thead>
		                <tr>
		                    <th scope="col" class="th-num">no</th>
		                    <th scope="col" class="th-category">카테고리</th>
		                    <th scope="col" class="th-title">제목</th>
		                   <!--  <th scope="col" class="th-content">내용</th> -->
		                    <th scope="col" class="th-user">작성자</th>
		                    <th scope="col" class="th-date">등록일</th>
		                    <th scope="col" class="th-count">조회수</th>
		                </tr>
		                </thead>
			            <c:forEach items="${requestScope.boardList}" var="board">
		                <tbody>
						    <tr>
						        <td bgcolor="">
						            <p align="center">
							            <span style="font-size:12pt;">
							            	<b><a href="board/${board.boardId}">${board.boardId}</a></b>
							            </span>
						            </p>
						        </td>
						        <td bgcolor="">
									<p align="center">
										<span style="font-size:12pt;">
											<b>
												<a href="board/${board.boardId}">${board.boardName}</a>
											</b>
										</span>
									</p>
						        </td>
						        <td bgcolor="">
						            <p align="center">
						            	<span style="font-size:12pt;">
						             		<b>${board.boardTitle}</b>
						             	</span>
						             </p>
						        </td>
						         <%-- <td bgcolor="">
						            <p align="center">
						            	<span style="font-size:12pt;">
						             		<b>${board.boardContent}</b>
						             	</span>
						             </p>
						        </td> --%>
						         <td bgcolor="">
						            <p align="center">
						            	<span style="font-size:12pt;">
						             		<b>${board.userId}</b>
						             	</span>
						             </p>
						        </td>
						         <td bgcolor="">
						            <p align="center">
						            	<span style="font-size:12pt;">
						             		<b>${board.createDate}</b>
						             	</span>
						             </p>
						        </td>
						        <td bgcolor="">
						            <p align="center">
						            	<span style="font-size:12pt;">
						             		<b>${board.count}</b>
						             	</span>
						             </p>
						        </td>
						    </tr>
					    </c:forEach>
		                </tbody>
		            </table>
		        </div>
		    </div>
		   
			<!-- board seach area -->
		    <div id="board-search">
		        <div class="container">
		            <div class="search-window">
		                <form action="">
		                    <div class="search-wrap">
		                        <label for="search" class="blind">공지사항 내용 검색</label>
		                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
		                        <button type="submit" class="btn btn-dark">검색</button>
		                    </div>
		                </form>
		            </div>
		        </div>
		    </div>
		</section>
	</main>
	
	<!-- footer -->
	<footer id="footer">
		<div class="footer1">
			copyright 2024
		</div>
	</footer>
</div>	
</c:if>

</body>
</html>