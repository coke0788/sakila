<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>modifyBoard</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#btn').click(function(){
		if($('#boardPw').val().length<4){
			alert('password는 4자 이상이어야 합니다.');
			console.log('글자 수 누락');
		} else {
			console.log('btn click');
			$('#modifyForm').submit();
		}
	});
});
</script>
</head>
<body>
	<div class="container">
		<h1>modifyBoard</h1>
		<form id="modifyForm"
			action="${pageContext.request.contextPath}/admin/modifyBoard"
			method="post">
			<table class="table">
				<tbody>
					<tr>
						<td>board_id :</td>
						<td><input type="text" name="boardId" id="boardId"
							value="${boardMap.boardId}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>board_title :</td>
						<td><input type="text" name="boardTitle" id="boardTitle"
							value="${boardMap.boardTitle}"></td>
					</tr>
					<tr>
						<td>board_content :</td>
						<td><textarea name="boardContent" id="boardContent" rows="5"
								cols="80">${boardMap.boardContent}</textarea></td>
					</tr>
					<tr>
						<td>user_name :</td>
						<td>${boardMap.username}</td>
					</tr>
					<tr>
						<td>insert_date :</td>
						<td>${boardMap.insertDate}</td>
					</tr>
					<tr>
						<td>board_pw</td>
						<td><input type="password" name="boardPw" id="boardPw"></td>
					</tr>
				</tbody>
			</table>
			<button type="button" class="btn btn-light" id="btn">수정</button>
			<a href="${pageContext.request.contextPath}/admin/getBoardOne?boardId=${boardMap.boardId}"><button type="button" class="btn btn-light">취소</button></a>
		</form>
	</div>
</body>
</html>