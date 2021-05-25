<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
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

<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="../static/assets/images/favicon.png">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link href="../static/css/style.css" rel="stylesheet">

</head>
<body class="h-100">
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->
    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                
                                    <a class="text-center" href="index.html"> <h4>addBoardFile</h4></a>
        
                                <form action="${pageContext.request.contextPath}/admin/addBoardfile" method="post" id="addForm" enctype="multipart/form-data" class="mt-5 mb-5 login-input">
                                    <div class="form-group">
                                        <input type="text" class="form-control"  placeholder="boardId" id="boardId" name="boardId" value="${boardId}" readonly="readonly">
                                    </div>
                                    <div class="form-group">
                                        <input type="file" class="form-control" id="multipartFile" placeholder="파일 선택" name="multipartFile">
                                    </div>
                                    <button class="btn login-form__btn submit w-100" id="btn">파일추가</button>
                                </form>
                                <p class="mt-5 login-form__footer"><a href="${pageContext.request.contextPath}/admin/getBoardList" class="text-primary">목록으로 </a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--**********************************
        Scripts
    ***********************************-->
    <script src="../static/plugins/common/common.min.js"></script>
    <script src="../static/js/custom.min.js"></script>
    <script src="../static/js/settings.js"></script>
    <script src="../static/js/gleek.js"></script>
    <script src="../static/js/styleSwitcher.js"></script>
</body>
</html>