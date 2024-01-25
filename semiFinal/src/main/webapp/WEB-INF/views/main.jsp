<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
    
=======
>>>>>>> origin/feat/mh
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>Main</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
=======
<title>Muti 게시판 Detail</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link href="/resources/css/layout1.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/layout2.css" rel="stylesheet" type="text/css" />
>>>>>>> origin/feat/mh
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

<div class="container">
    <!-- https://getbootstrap.com/docs/5.3/forms/form-control/ -->
    <div>
        <form id="mainForm" class="row justify-content-center g-3" action="/main" method="GET" onsubmit="checkKeyword()">
            <div class="col-auto">
            <!-- 제목/작성자 선택버튼 -->
            <select name="searchValue" class="selectFiled">
                <option value="boardTitle">제목</option>
                <option value="userId">작성자</option>
            </select>
                <label for="keyword" class="visually-hidden">Search</label> 
                    <input    
                        type="text" 
                        class="form-control" 
                        id="searchKeyword"
                        placeholder="searchKeyword" 
                        name="searchKeyword"
                        value="${pageInfo.pageRequest.searchKeyword}">
                        <!-- hidden -->
                        <input name="pageNum" type="hidden" value="${pageInfo.pageRequest.pageNum}">
                        <input name="amount" type="hidden" value="${pageInfo.pageRequest.amount}">
            </div>
            <div class="col-auto">
                <input type="submit" class="btn btn-primary mb-3" value="Search" />
            </div>
        </form>
    </div>
    <!-- https://getbootstrap.com/docs/5.3/components/list-group/ -->
    <div class="row justify-content-center">
        <div class="col-6">
            <ul class="list-group">
                <c:if test="${not empty boardList}">
                    <c:forEach var="board" items="${boardList}">
                        <li class="list-group-item d-flex justify-content-between align-items-start">
                            <div class="ms-2 me-auto">
                                <div class="fw-bold">${board.boardTitle}</div>
                                ${board.boardContent}
                            </div> <span class="badge bg-primary rounded-pill">${board.boardName}</span>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>
        </div>
    </div>
    <!-- Paging -->
    <!-- https://getbootstrap.com/docs/5.3/layout/columns/#alignment -->
    <!-- https://getbootstrap.com/docs/5.3/components/pagination/#disabled-and-active-states -->
    <div class="row justify-content-center">
        <div class="col-auto">
            <nav class="page navigation">
                <ul class="pagination">
                    <c:if test="${pageInfo.prev}">
                        <li class="page-item">
                            <a class="page-link" aria-label="Previous" 
                                href="/main?pageNum=${pageInfo.startPage - 1}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">Prev</a>
                        </li>
                    </c:if>
                    <c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                        <li class="page-item ${pageInfo.pageRequest.pageNum == num ? "active" : "" } ">
                            <a class="page-link" 
                                href="/main?pageNum=${num}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">${num}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${pageInfo.next}">
                        <li class="page-item next">
                            <a class="page-link" aria-label="next" 
                                href="/main?pageNum=${pageInfo.endPage + 1}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>
<!-- 페이징 버튼 클릭시 => pageNum, amount, keyword -->
<script type="text/javascript">
    function checkKeyword(){
        let mainForm = document.getElementById('mainForm');
        // 검색 시 항상 pageNum을 1로 설정
        mainForm.pageNum.value = 1;
        if(mainForm.searchKeyword.value === null || mainForm.searchKeyword.value === ''){
            mainForm.searchKeyword.remove();
        }
    }
	
    Array.from(document.getElementsByClassName('page-link')).forEach((pagingButton) => {
        pagingButton.addEventListener('click', function (e) {
            e.preventDefault();

            // 등록 후, action : '/main' 으로 요청 시, keyword 값 유무에 따라 queryString 변경
            if (e.target.innerHTML.toLowerCase() === 'next') {
                mainForm.pageNum.value = ${pageInfo.endPage + 1}; // 'Next' 클릭 시
            } else if (e.target.innerHTML.toLowerCase() === 'prev') {
                mainForm.pageNum.value = ${pageInfo.startPage - 1}; // 'Prev' 클릭 시
            } else {
            // 다른 페이지 번호를 클릭한 경우 pageNum을 변경하고 검색 키워드가 있을 때만 해당 값을 추가
            mainForm.pageNum.value = e.target.innerHTML;

            if (mainForm.searchKeyword.value == '' || mainForm.searchKeyword.value == null) {
                mainForm.searchKeyword.remove();
            }
        }
				
				mainForm.action = '/main';
				mainForm.method = 'GET';
				mainForm.submit();
			})
	})
	
</script>
</body>
</html>