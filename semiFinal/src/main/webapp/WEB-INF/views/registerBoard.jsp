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
<div id = "wrap">
	<!-- aside -->
    <%@ include file="aside.jsp" %>
    
    <!-- main  -->
	<main id="main">
		<section class="notice">
		  	<div class="page-title">
		        <div class="container">
		            <h3>게시판 글 작성</h3>
		        </div>
		    </div>
		    
		    <c:if test="${not empty sessionScope.userId}">
			<form action="/board" method="POST" enctype="multipart/form-data">
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
				                    <td>
								        <input type="text" id="userId" name="userId" size="30" value="${sessionScope.userId}" readonly>
								    </td>
				                    <th scope="row" bgcolor="#F9F9F9">카테고리</th>
				                    <td><%-- ${board.boardName} --%>
										  <select id="boardName" name="boardName">
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
				                    <th scope="row" bgcolor="#F9F9F9">첨부파일</th>
				                    <td colspan="4">
			                        	<input type="file" name="file" size="30">
				                    </td>
				                </tr>
				                <tr>
				                    <th scope="row" bgcolor="#F9F9F9">내용</th>
				                    <td colspan="4">
				                        <textarea rows="20" cols="100" title="내용" id="boardContent" name="boardContent" placeholder="내용을 입력하세요. "></textarea>
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

			</c:if>
			<c:if test="${empty sessionScope.userId}">
				<script>
					alert("로그인을 하세요!");
					history.back();
				</script>
			</c:if>
			
	 	</section>
   </main>
   
   <!-- footer -->
   <%@ include file="footer.jsp" %>
   
</div>	

<script type="text/javascript">
	const inputBoardId = document.getElementById('boardId');
	const boardIdMsg = document.getElementById('boardIdMsg');
</script>
</body>
</html>

<%-- <div class="container mt20">
	<div style="margin-bottom: 35px;">
		<span style="width: 10%;">  </span>
		<h2 style="display: inline; margin-right: 20px">메인게시판</h2><h4 style="display: inline;">글수정</h4><hr/>
	</div>
	<form action="updateboard.do" method="POST" id="updateForm" onsubmit="checkData()">
		<input type="hidden" name="userid" value="${requestScope.userId}">
		<input type="hidden" name="noticeid" value="${requestScope.noticeid}">
		<!-- 제목 -->
		<div style="display : flex; margin-top: 20px;">
			<!-- <p style="width: 10%;">제목<b><span style="color: red;">*</span></b></p> -->
			<input type="text" class="form-control" name="boardtitle" placeholder="제목을 입력하세요." value="${requestScope.boardtitle}">
		</div>
		<!-- 내용 -->
		<div style="display : flex; margin-top: 20px;">
			<!-- <p style="width: 10%;">내용<b><span style="color: red;">*</span></b></p> -->
			<textarea class="form-control" style="height: 390px;" name="boardcontent" placeholder="내용을 입력하세요.">${requestScope.boardcontent}</textarea>
		</div>
		<!-- 버튼 -->
		<div style="width: 100%; text-align: right; margin-top: 20px;">
			<button type="submit" class="btn btn-primary">글수정</button>
			<button type="button" class="btn btn-light" style="border: 1px solid black;" onclick="location.href = 'getboardlist.do';">목록</button>
		</div>
	</form>
</div>
<script type="text/javascript">
function checkData() {
    let updateForm = document.getElementById('updateForm');
    
    if (updateForm.boardtitle.value === "" || updateForm.boardcontent.value === "") {
        return false;
    }
    return true;
}	

</script> --%>
