<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Board</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</head>
<body>

<%@ include file="header.jsp" %>

<!-- action, method -->
<form action="/board/${file.FileId}" method="POST" enctype="multipart/form-data">
	<!--  PUT -->
	<input type="hidden" name="_method" value="PUT">





</form>

<%@ include file="footer.jsp" %>

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
	})


</script>

</body>
</html>