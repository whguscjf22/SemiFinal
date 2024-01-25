<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Muti 게시판</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link href="/resources/css/layout1.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/layout2.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script> 
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
		            <h3>게시판 글 작성</h3>
		        </div>
		    </div>
			<form action="/board" method="POST">
			    <div id="board-list">
		        	<div class="container">
					    <table class="board-table"> 
				            <colgroup>
				                <col width="15%">
					            <col width="35%">
					            <col width="15%">
					            <col width="*">
				            </colgroup>
				            <tbody> 
				                <tr>
				                    <th scope="row" bgcolor="#F9F9F9">작성자</th>
				                    <td>${board.userId}</td>
				                    <th scope="row" bgcolor="#F9F9F9">카테고리</th>
				                    <td><%-- ${board.boardName} --%>
										  <select name="category">
									    	<option value="noticeBoard">공지게시판</option>
									    	<option value="infoBoard">정보게시판</option>
									    	<option value="freeBoard">자유게시판</option>
										  </select>
				                    </td>
				                </tr>
				                <tr>
				                    <th scope="row" bgcolor="#F9F9F9">제목</th>
				                    <td colspan="4">
				                       <input type="text" id="boardTitle" name="boardTitle"  placeholder="제목을 입력하세요. "/>
				                    </td>
				                </tr>
				                <tr>
				                    <th scope="row" bgcolor="#F9F9F9">내용</th>
				                    <td colspan="4">
				                        <textarea rows="20" cols="100" title="내용" id="boardContent" name="boardContent" placeholder="내용을 입력하세요. "></textarea>
				                    </td>
				                </tr>
				                <tr>
				                    <th scope="row" bgcolor="#F9F9F9">첨부파일</th>
				                    <td colspan="4">
				                        <input type="file" name="file" size="30">
				                    </td>
				                </tr>
				            </tbody>
				        </table>
						<span style="font-size:12pt; float: right;">
							<input type="reset" value="다시작성" class="Btn">
							<input type="submit" value="게시판 등록" class="Btn">
						</span>
		        	 </div>
		    	</div>
	   		</form>
			<div class="container">
				<span style="font-size:12pt; float: left; margin-right:7px;"><input type="button" value="목록으로" class="Btn" onclick="location.href='/main'"></span>
			</div>
	 	</section>
   </main>
   <footer id="footer">
		<div class="footer1">
			copyright 2024
		</div>
	</footer>
</div>	
</c:if>
<script type="text/javascript">
	const inputBoardId = document.getElementById('boardId');
	const boardIdMsg = document.getElementById('boardIdMsg');
</script>
</body>
</html>