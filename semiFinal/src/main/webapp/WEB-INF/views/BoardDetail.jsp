<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		            <h3>게시판 상세정보</h3>
		        </div>
		    </div>
			<form action="/modify/board/${board.boardId}" method="GET" name="detailForm" id="detailForm" >
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
				                    <td>${board.createdDate}</td>
				                </tr>
				                 <tr>
				                    <th scope="row" bgcolor="#F9F9F9">카테고리</th>
				                    <td><%-- ${board.boardName} --%>
										  <select id="boardName" name="boardName" disabled>
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
				                        <a href="http://localhost:8080/download/file/${file.fileId}">${file.fileOriginalName}</a>
				                    </td>
				                </tr>
				            </tbody>
				        </table>
						<span style="font-size:12pt; float: right;"><input type="submit" value="수정하기" class="Btn"></span>
		        	 </div>
		    	</div>
	   		</form>
			<div class="container" style="height:50px;">
				<span style="font-size:12pt; float: left; margin-right:7px;"><input type="button" value="목록으로" class="Btn" onclick="location.href='/main'"></span>
				<span style="font-size:12pt; float: left;"><input type="button" value="삭제하기" class="Btn" onclick="deleteBoard()"></span>
			</div>
			<!-- 댓글 리스트 -->
			<c:if test="${not empty commentList}">
			    <c:forEach var="comment" items="${commentList}" varStatus="status">
			        <div>
			            <p>작성자: ${comment.userId}, 작성일: <fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd HH:mm"/></p>
			            <p>${comment.commentContent}</p>
			            
			            <c:if test="${sessionScope.userId eq comment.userId}">
			            <!-- or userGrade eq 'gold' or comment.status eq 'ACTIVE' -->
			                <!-- 세션의 userId가 현재 댓글의 작성자와 같거나, userGrade가 'gold'인 경우에만 삭제 버튼을 활성화 -->
			                <button onclick="deleteComment(${comment.commentId})">삭제</button>
			            </c:if>
			        </div>
			    </c:forEach>
			</c:if>
			<!-- 댓글 입력창 -->
			<div class="container" style="display: flex; margin-top: 20px; justify-content: center;">
			    <form action="/comment" method="POST" id="commentForm">
			        <input type="hidden" name="boardId" value="${board.boardId}">
			        <input type="hidden" name="userId" value="${sessionScope.userId}">
			        <input type="hidden" name="pageNum" value="${pageInfo.pageNum}">
			        <textarea class="form-control" style="width:500px; height: 100px;" name="commentContent" placeholder="댓글을 입력하세요"></textarea>
			        <button type="submit" class="Btn" style="margin-top: 10px;">댓글 작성</button>
			    </form>
			</div>
			</c:if>
		 </section> 	
   	</main>
   <footer id="footer">
		<div class="footer1">
			copyright 2024
		</div>
	</footer>
</div>	
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
		
		function submitComment() {
		    let commentForm = document.getElementById('commentForm');
		    let formData = new FormData(commentForm);
	
		    fetch('/comment', {
		        method: 'POST',
		        body: formData,
		        headers: {
		            'X-Requested-With': 'XMLHttpRequest'
		        }
		    })
		    .then(response => response.text())
		    .then(data => {
		        // 서버 응답 처리
		        console.log(data);
		        alert("댓글이 작성되었습니다.");
	
		        // 필요한 동작 수행
		        // 예: 댓글 목록 갱신 등
	
		        // 서버 응답에 따라 동적으로 화면 갱신이 필요하면 해당 부분을 추가
		    })
		    .catch(error => {
		        alert("댓글 작성에 실패하였습니다.");
		    });
		}
		
		function deleteComment(commentId) {
		    if (confirm("댓글을 삭제하시겠습니까?")) {
		        var csrfToken = /*[[${_csrf.token}]]*/ 'default-csrf-token'; 
		        var headers = {
		            'Content-Type': 'application/json',
		            'X-CSRF-TOKEN': csrfToken
		        };
	
		        // AJAX를 사용하여 서버로 삭제 요청
		        fetch('/deleteComment', {
		            method: 'POST',
		            headers: headers,
		            body: JSON.stringify({ commentId: commentId })
		        })
		        .then(response => response.json())
		        .then(data => {
		            alert("댓글이 삭제되었습니다.");
		            window.location.reload();
		        })
		        .catch(error => {
		        	/* 삭제되도 값을 받아올때 오류나는데 해결을 못했음 */
		        	alert("댓글이 삭제되었습니다.");
		            window.location.reload();
		        });
		    }
		}
	</script>
</body>
</html>