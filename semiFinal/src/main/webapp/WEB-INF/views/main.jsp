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
<div id = "wrap">

	<!-- aside -->
    <%@ include file="aside.jsp" %>
    
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
		        	<span style="font-size:12pt; float: right; margin-bottom:10px; ">
		        		<c:if test="${not empty sessionScope.userId}">
		        			<input type="button" value="게시글 작성" class="Btn" onclick="location.href='/board'">
		        		</c:if>
		        	</span>
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
												<a href="/board?boardName=${board.boardName}">${board.boardName}</a>
											</b>
										</span>
									</p>
						        </td>
						        <td bgcolor="">
						            <p align="center">
						            	<span style="font-size:12pt;">
						             		<b><a href="board/${board.boardId}">${board.boardTitle}</a></b>
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
		     
		     <div id="pageBtn" style="margin:10px;">
			     <div class="row justify-content-center" style="display: flex; justify-content: center;">
					<div class="col-auto">
						<table class="page navigation">
							<tr class="pagination">
								<c:if test="${pageInfo.prev}">
									<th class="page-item">
										<a class="page-link" aria-label="Previous"
											href="/main?pageNum=${pageInfo.startPage - 1}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">Prev</a>
									</th>
								</c:if>
								<c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
									<th class="page-item ${pageInfo.pageRequest.pageNum == num ? "active" : "" } ">
										<a class="page-link" style="padding:10px;"
 											href="/main?pageNum=${num}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">${num}</a>
									</th>
								</c:forEach>
								<c:if test="${pageInfo.next}">
									<th class="page-item next">
										<a class="page-link" aria-label="next"
											href="/main?pageNum=${pageInfo.endPage + 1}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">Next</a>
									</th>
								</c:if>
							</tr>
						</table>
					</div>
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
    <%@ include file="footer.jsp" %>
   
</div>	
</body>
</html>