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
			            <h3>게시판 상세정보</h3>
			        </div>
			    </div>
				<form action="/modify/board/${board.boardId}" method="GET" name="detailForm" id="detailForm">
				    <div id="board-list">
			        	<div class="container">
						    <table class="board-table"> 
					           <%--  <caption>게시판 상세정보</caption> --%>
					            <colgroup>
					                <col width="15%">
						            <col width="35%">
						            <col width="15%">
						            <col width="*">
					            </colgroup>
					            <tbody>
					                <tr>
					                    <th scope="row" bgcolor="#F9F9F9">no</th>
					                    <td>${board.boardId}</td>
					                    <th scope="row" bgcolor="#F9F9F9">조회수</th>
					                    <td>${board.count}</td>
					                </tr>
					                <tr>
					                    <th scope="row" bgcolor="#F9F9F9">작성자</th>
					                    <td>${board.userId}</td>
					                    <th scope="row" bgcolor="#F9F9F9">등록일</th>
					                    <td>${board.createDate}</td>
					                </tr>
					                 <tr>
					                    <th scope="row" bgcolor="#F9F9F9">카테고리</th>
					                    <td><%-- ${board.boardName} --%>
											  <select name="category" disabled>
										    	<option value="${board.boardName}" 
										    		<c:if test="${board.boardName eq 'noticeBoard'}">selected</c:if>>공지게시판</option>
										    	<option value="${board.boardName}" 
										    		<c:if test="${board.boardName eq 'infoBoard'}">selected</c:if>>정보게시판</option>
										    		<option value="${board.boardName}" 
										    		<c:if test="${board.boardName eq 'freeBoard'}">selected</c:if>>자유게시판</option>	
											  </select>

					                    </td>
					                    <th scope="row" bgcolor="#F9F9F9">수정일</th>
					                    <td>${board.modifiedDate}</td>
					                </tr>
					                <tr>
					                    <th scope="row" bgcolor="#F9F9F9">제목</th>
					                    <td colspan="4">
					                       ${board.boardTitle}
					                    </td>
					                </tr>
					                <tr>
					                    <th scope="row" bgcolor="#F9F9F9">내용</th>
					                    <td colspan="4">
					                        ${board.boardContent}
					                    </td>
					                </tr>
					                <tr>
					                    <th scope="row" bgcolor="#F9F9F9">첨부파일</th>
					                    <td colspan="4">
					                        <a href=#>${file.fileOriginalName}</a>
					                    </td>
					                </tr>
					            </tbody>
					        </table>
							<span style="font-size:12pt; float: right;"><input type="submit" value="수정하기" class="Btn"></span>
			        	 </div>
			    	</div>
		   		</form>
				<div class="container">
					<span style="font-size:12pt; float: left; margin-right:7px;"><input type="button" value="목록으로" class="Btn" onclick="location.href='/main'"></span>
					<span style="font-size:12pt; float: left;"><input type="button" value="삭제하기" class="Btn" onclick="deleteBoard()"></span>
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
	
	function deleteBoard(){
	  let detailForm = document.getElementById('detailForm');		  
	  let boardId = "${board.boardId}";   
	  let hiddenInput = document.createElement('input');
	  hiddenInput.type = 'hidden';
	  hiddenInput.name = '_method';
	  hiddenInput.value = 'DELETE';
	  
	  detailForm.append(hiddenInput);
	  
	  detailForm.action = "/board/" + boardId;
	  detailForm.method = "POST";
	  detailForm.submit();
	}
</script>
</body>
</html>