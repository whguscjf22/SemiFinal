<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dept Update</title>
<link href="/resources/css/layout.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script> 
</head>
<body>

<%@ include file="header.jsp" %>

<!-- action, method -->
<form action="/dept/u/${dept.deptno}" method="POST" enctype="multipart/form-data">
	<!-- PUT -->
	<input type="hidden" name="_method" value="PUT">
	<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
	    <tr>
	        <td width="1220" height="20" colspan="2" bgcolor="#336699">
	            <p align="center">
	            	<font color="white" size="3">
	            		<b>부서 정보 업데이트</b>
	            	</font>
	            </p>
	        </td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="center"><b><span style="font-size:9pt;">부서번호</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span style="font-size:9pt;">
	        			<!-- 부서번호는 수정되지 않도록 지정 -->
	        			<input type="text" name="deptno" size="30" value="${dept.deptno}" readonly disabled>
	        		</span>
	        	</b>
	        </td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="center"><b><span style="font-size:9pt;">부 서 명</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span style="font-size:9pt;">
	        			<!-- 부서명 출력 -->
	        			<input type=text name="dname" size="30" value="${dept.dname}">
	        		</span>
	        	</b>
	        </td>
	    </tr>
	    <tr>
	        <td width="150" height="20">
	            <p align="center"><b><span style="font-size:9pt;">부서위치</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span style="font-size:9pt;">
	        			<!-- 부서위치 출력 -->
	        			<input type=text name="loc" size="30" value="${dept.loc}">
	        		</span>
	        	</b>
	        </td>
	    </tr>
    	<tr>
	        <td width="150" height="20">
	            <p align="center"><b><span style="font-size:9pt;">부서파일</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span id="dept-file" style="font-size:12pt;">
	        			<a href="http://localhost:8080/download/file/${file.attachmentFileNo}">${file.attachmentOriginalFileName}</a>
	        			<button id="delete-file-btn">X</button>
	        		</span>
	        	</b>
	        </td>
	    </tr>
	    
	    <tr>
	        <td width="150" height="20">
	            <p><b><span style="font-size:9pt;">&nbsp;</span></b></p>
	        </td>
	        <td width="450" height="20" align="center">
	        	<b>
	        		<span style="font-size:9pt;">
						<input type="submit" value="부서수정">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">
					</span>
				</b>
			</td>
	    </tr>
	</table>
</form>
<hr>
<div align=center>
	<span style="font-size:12pt;"><input type="button" value="메인으로" onclick="location.href='/main'"></span>
	<span style="font-size:12pt;"><input type="button" value="부서생성" onclick="location.href='/dept'"></span>
</div>

<%@ include file="footer.jsp" %>
<script type="text/javascript">
	let deptFile = document.getElementById('dept-file');
	let deleteFileBtn = document.getElementById("delete-file-btn");
	
	deleteFileBtn.addEventListener('click', (e) => {
		e.preventDefault();
		// url: /file/{fileNo} (delete) + axios
		axios.delete('http://localhost:8080/file/'+${file.attachmentFileNo})
				.then(response => response.data)
				.then(data => {
					if(data ==='성공'){
						//
						deptFile.innerHTML = '';
						
						//
						let newInput = document.createElement('input');
						newInput.type = 'file';
						newInput.name = 'file';
						
						deptFile.appendChild(newInput);
					} 
				})
	});
</script>

</body>
</html>