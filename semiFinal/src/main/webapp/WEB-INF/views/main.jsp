<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
						             		<b><fmt:formatDate value="${board.createdDate}" pattern="yyyy-MM-dd HH:mm"/></b>
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
		     <!-- 페이지 버튼 -->
		     <div class="row mt-4 justify-content-center">
		    <div class="col-auto">
		        <nav class="page navigation">
		            <ul class="pagination">
		                <c:if test="${pageInfo.prev}">
		                    <li class="page-item">
		                        <a class="page-link" aria-label="Previous" 
                            href="/main?pageNum=${pageInfo.startPage - 1}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">Previous</a>
                    </li>
                </c:if>
		     
                <c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                    <li class="page-item ${pageInfo.pageRequest.pageNum == num ? 'active' : ''}">
                        <a class="page-link" 
                            href="/main?pageNum=${num}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">${num}</a>
                    </li>
                </c:forEach>
                
                <c:if test="${pageInfo.next}">
                    <li class="page-item">
                        <a class="page-link" aria-label="Next" 
                            href="/main?pageNum=${pageInfo.endPage + 1}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">Next</a>
                    </li>
                </c:if>
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

<%-- <!-- Include Header -->
<div class="container-fluid">
    <div class="row">
        <!-- Navigation Bar (Left Side) -->
        <div class="col-lg-2 p-0">
            <nav class="navbar navbar-expand-lg navbar-light bg-light flex-column">
                <!-- 유저 정보 -->
                <div class="d-flex flex-column align-items-center mb-3">
                    <img src="유저프로필이미지주소" alt="프로필 이미지" class="img-fluid rounded-circle" style="width: 50px; height: 50px;">
                    <span class="mt-2">유저 이름</span>
                    <span class="mt-1">유저 이메일</span>
                </div>
                
                <!-- 네비게이션 바 버튼 등 추가 내용은 여기에 추가 -->
                <a class="nav-link" href="#">메뉴1</a>
                <a class="nav-link" href="#">메뉴2</a>
                <a class="nav-link" href="#">메뉴3</a>
            </nav>
        </div>

        <!-- Main Content (Right Side) -->
        <div class="col-lg-9">
            <!-- 이 부분에 원래 있던 내용이 들어갑니다. -->
<!-- Main Content -->
<div class="container mt-5">
    <table class="table table-bordered table-striped">
        <thead class="table-light text-center">
            <tr>
                <th scope="col" class="col-1">번호</th>
                <th scope="col" class="col-7">제목</th>
                <th scope="col" class="col-1">작성자</th>
                <th scope="col" class="col-2">작성일</th>
                <th scope="col" class="col-1">조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${not empty boardList}">
                <c:forEach var="board" items="${boardList}" varStatus="status">
                    <tr>
                        <th class="text-center" scope="row">${status.index + 1}</th>
                        <td>
                            <a href="/board/${board.boardId}?pageNum=${pageInfo.pageRequest.pageNum}">${board.boardTitle}</a>
                        </td>
                        <td class="text-center">${board.userId}</td>
                        <td class="text-center">
                            <fmt:formatDate value="${board.createdDate}" pattern="yyyy-MM-dd HH:mm"/>
                        </td>
                        <td class="text-center">${board.count}</td>
                    </tr>
                </c:forEach>
            </c:if>
        </tbody>
    </table>
</div>
<div class="row mt-4 justify-content-center">
    <div class="col-auto">
        <nav class="page navigation">
            <ul class="pagination">
                <c:if test="${pageInfo.prev}">
                    <li class="page-item">
                        <a class="page-link" aria-label="Previous" 
                            href="/main?pageNum=${pageInfo.startPage - 1}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">Previous</a>
                    </li>
                </c:if>
                
                <!-- 페이지 버튼 -->
                <c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                    <li class="page-item ${pageInfo.pageRequest.pageNum == num ? 'active' : ''}">
                        <a class="page-link" 
                            href="/main?pageNum=${num}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">${num}</a>
                    </li>
                </c:forEach>
                
                <c:if test="${pageInfo.next}">
                    <li class="page-item">
                        <a class="page-link" aria-label="Next" 
                            href="/main?pageNum=${pageInfo.endPage + 1}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">Next</a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
</div>
<!-- Search Form at the Bottom -->
<div class="container mt-5">
    <form id="mainForm" class="row justify-content-center g-3" action="/main" method="GET" onsubmit="checkKeyword()">
        <div class="col-auto">
            <select name="searchValue" class="form-select">
                <option value="boardTitle">제목</option>
                <option value="userId">작성자</option>
            </select>
        </div>
        <div class="col-auto">
            <input type="text" class="form-control" id="searchKeyword" placeholder="검색어" name="searchKeyword" value="${pageInfo.pageRequest.searchKeyword}">
            <input name="pageNum" type="hidden" value="${pageInfo.pageRequest.pageNum}">
            <input name="amount" type="hidden" value="${pageInfo.pageRequest.amount}">
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary">검색</button>
        </div>
    </form>
</div>
        </div>
    </div>
</div>

 <!-- Paging -->

<!-- 페이징 버튼 클릭시 => pageNum, amount, keyword -->
<script type="text/javascript">
    var startPage = ${pageInfo.startPage};
    var endPage = ${pageInfo.endPage};

    document.querySelectorAll('.page-link').forEach((pagingButton) => {
        pagingButton.addEventListener('click', function (e) {
            e.preventDefault();

            if (e.target.innerHTML.toLowerCase() === 'next') {
                mainForm.pageNum.value = endPage + 1;
            } else if (e.target.innerHTML.toLowerCase() === 'previous') {
                mainForm.pageNum.value = startPage - 1;
            } else {
                mainForm.pageNum.value = e.target.innerHTML;

                if (mainForm.searchKeyword.value === '' || mainForm.searchKeyword.value === null) {
                    mainForm.searchKeyword.remove();
                }
            }

            mainForm.action = '/main';
            mainForm.method = 'GET';
            mainForm.submit();
        });
    });
</script>


</body>
<footer>
</footer> 
</html>--%>