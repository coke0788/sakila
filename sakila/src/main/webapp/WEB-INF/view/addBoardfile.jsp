<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#btn').click(function(){
			console.log('btn click!');
			$('#addForm').submit();
		});
	});
</script>
<title>addBoardfile</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/admin/addBoardfile" method="post" id="addForm" enctype="multipart/form-data">
		<div>
			boardId : <input type="text" id="boardId" name="boardId" value="${boardId}" readonly="readonly">
		</div>
		<div>
			file : <input type="file" id="multipartFile" name="multipartFile">
		</div>
		<div>
			<button type="button" id="btn">파일추가</button>
		</div>
	</form>
</body>
</html>