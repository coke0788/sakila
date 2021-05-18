<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>getBoardOne</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#btn').click(function(){
			console.log('btn click');
			$('#deleteCommentForm').submit();
	});
});
</script>
</head>
<body>
<div class="container">
    <h1>getBoardOne</h1>
     <table class="table">
         <tbody>
             <tr>
                <td>board_id :</td>
                <td>${boardMap.boardId}</td>
               </tr>
            <tr>
                   <td>board_title :</td>
                   <td>${boardMap.boardTitle}</td>
            </tr>
            <tr>
                   <td>board_content :</td>
                   <td>${boardMap.boardContent}</td>
            </tr>
            <tr>
                   <td>username :</td>
                   <td>${boardMap.username}</td>
            </tr>
            <tr>
                   <td>insert_date :</td>
                   <td>${boardMap.insertDate}</td>
            </tr>
        </tbody>
    </table>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/modifyBoard?boardId=${boardMap.boardId}">수정</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/removeBoard?boardId=${boardMap.boardId}">삭제</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/getBoardList">글목록</a>
    <hr>
    <h4> Comment </h4>
    ${commentList.size()} 개의 댓글이 있습니다.
    <form id="deleteCommentForm" action="${pageContext.request.contextPath}/removeComment" method="post">
    <table class="table">
        <tr>
    		<td>내용</td>
    		<td>이름</td>
    		<td>등록일</td>
    		<td></td>
    	</tr>
    <c:forEach var="c" items="${commentList}">
    <input type="text" hidden="hidden" name="commentId" value="${c.commentId}">
    <input type="text" hidden="hidden" name="boardId" value="${boardMap.boardId}">
    	<tr>
    		<td>${c.commentContent}</td>
    		<td>${c.username}</td>
    		<td>${c.insertDate}</td>
    		<td><button type="button" id="btn">삭제</button></td>
    	</tr>
    </c:forEach>
    </table>
    </form>
    <div><a class="btn btn-default" href="${pageContext.request.contextPath}/addComment?boardId=${boardMap.boardId}">댓글추가</a></div>
</div>
</body>
</html>