<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</head>
<body>

<div class="container">
	<!-- https://getbootstrap.com/docs/5.3/forms/form-control/ -->
	<div>
		<form id="mainForm" class="row justify-content-center g-3" action="/mainTest" method="GET" onsubmit="checkKeyword()">
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
								href="/mainTest?pageNum=${pageInfo.startPage - 1}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">Prev</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
						<li class="page-item ${pageInfo.pageRequest.pageNum == num ? "active" : "" } ">
							<a class="page-link" 
								href="/mainTest?pageNum=${num}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">${num}</a>
						</li>
					</c:forEach>
					<c:if test="${pageInfo.next}">
						<li class="page-item next">
							<a class="page-link" aria-label="next" 
								href="/mainTest?pageNum=${pageInfo.endPage + 1}&amount=${pageInfo.pageRequest.amount}&searchKeyword=${pageInfo.pageRequest.searchKeyword}">Next</a>
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
	
	Array.from(document.getElementsByClassName('page-link'))
		.forEach((pagingButton) => {
			pagingButton.addEventListener('click', function(e) {
				e.preventDefault();
				if (e.target.innerHTML.toLowerCase() === 'next') {
	            mainForm.pageNum.value = ${pageInfo.endPage + 1}; 
		        } else if (e.target.innerHTML.toLowerCase() === 'prev') {
		            mainForm.pageNum.value = ${pageInfo.startPage - 1}; 
		        } else {
	            mainForm.pageNum.value = e.target.innerHTML;

	            if (mainForm.searchKeyword.value == '' || mainForm.searchKeyword.value == null) {
	                mainForm.searchKeyword.remove();
	         	   }
	       		 }
				
				mainForm.action = '/mainTest';
				mainForm.method = 'GET';
				mainForm.submit();
			})
	})
	
	    // 페이지 로드 시 저장된 값이 있다면 해당 값으로 선택된 옵션 설정
    document.addEventListener('DOMContentLoaded', function() {
        var selectedOption = localStorage.getItem('selectedOption');
        if (selectedOption) {
            document.querySelector('.selectField').value = selectedOption;
        }
    });

    // 선택된 옵션을 로컬 스토리지에 저장
    function saveSelectedOption() {
        var selectedOption = document.querySelector('.selectField').value;
        localStorage.setItem('selectedOption', selectedOption);
    }

    // 검색 폼 제출 시 로컬 스토리지의 값을 초기화
    function checkKeyword() {
        localStorage.removeItem('selectedOption');
        return true;
    }
</script>
</body>
</html>