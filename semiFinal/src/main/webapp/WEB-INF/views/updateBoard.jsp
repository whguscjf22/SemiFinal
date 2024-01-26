<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Muti 게시판</title>
<meta charset="UTF-8">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script> -->
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
			            <h3>게시판 정보수정</h3>
			        </div>
			    </div>
				<form action="/board/${boardId}" method="POST" enctype="multipart/form-data">
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
					                    <th scope="row" bgcolor="#F9F9F9">no</th>
					                    <td>${board.boardId}</td>
					                    <th scope="row" bgcolor="#F9F9F9">조회수</th>
					                    <td>${board.count}</td>
					                </tr>
					                <tr>
					                    <th scope="row" bgcolor="#F9F9F9">작성자</th>
					                    <td>${board.userId}</td>
					                    <th scope="row" bgcolor="#F9F9F9">등록일</th>
					                    <td>${board.createdDate}</td>
					                </tr>
					                 <tr>
					                    <th scope="row" bgcolor="#F9F9F9">카테고리</th>
					                    <td><%-- ${board.boardName} --%>
											  <select name="category" disabled>
											    <option value="none">=== 선택 ===</option>
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
					                       <input type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle}"/>
					                    </td>
					                </tr>
					                <tr>
					                    <th scope="row" bgcolor="#F9F9F9">내용</th>
					                    <td colspan="4">
					                        <textarea rows="20" cols="100" title="내용" id="boardContent" name="boardContent">${board.boardContent}</textarea>
					                    </td>
					                </tr>
					                <tr>
					                    <th scope="row" bgcolor="#F9F9F9">첨부파일</th>
					                    <td colspan="4">
					                        <a href=#>${file.fileOriginalName}</a>
					                        <button id="file-delete-btn">X</button>
					                    </td>
					                </tr>
					            </tbody>
					        </table>
							<span style="font-size:12pt; float: right;">
								<input type="submit" value="정보수정" class="Btn">
								<input type="reset" value="다시작성" class="Btn">
							</span>
			        	 </div>
			    	</div>
		   		</form>
				<div class="container">
					<span style="font-size:12pt; float: left; margin-right:7px;"><input type="button" value="목록으로" class="Btn" onclick="location.href='/main'"></span>
					<span style="font-size:12pt; float: left;"><input type="button" value="삭제하기" class="Btn" onclick="deleteDept()"></span>
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

<!-- action, method -->
<%-- <form action="/board/${file.FileId}" method="POST" enctype="multipart/form-data">
	<!--  PUT -->
	<input type="hidden" name="_method" value="PUT">





</form> --%>

<script type="text/javascript">
	let boardFile = document.getElementById('board-file');
	let deleteFileBtn = document.getElementById('file-delete-btn');
	deleteFileBtn.addEventListener('click', (e) => {
		e.preventDefault();
		axios.delete('http://localhost:8080/file' + ${file.fileId})
				.then(response => response.data)
				.then(data => {
					if(data === '성공') {
						
						boardFile.innerHTML = '';
						
						let newInput = document.createElement('input');
						newInput.type = 'file';
						newInput.name = 'file';
						
						boardFile.appendChild(newInput);
					}
				})
	});


</script>

</body>
</html>