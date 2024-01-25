<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container mt20">
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

</script>
	
