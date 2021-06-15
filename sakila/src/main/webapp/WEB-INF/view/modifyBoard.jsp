<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>modifyBoard</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="../static/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="../static/css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
     <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <div class="brand-logo">
                <a href="${pageContext.request.contextPath}/">
                    <b class="logo-abbr"><img src="images/logo.png" alt=""> </b>
                    <span class="logo-compact"><img src="./images/logo-compact.png" alt=""></span>
                    <span class="brand-title">
                        <p class="font-weight-bold text-white">Sakila</p>
                    </span>
                </a>
            </div>
        </div>
    <!--**********************************
        Nav header end
    ***********************************-->
        <!--**********************************
            머리 부분 시작
        ***********************************-->
        <div class="header">    
            <div class="header-content clearfix">
                
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="toggle-icon"><i class="icon-menu"></i></span>
                    </div>
                </div>
                <div class="header-right">
                    <ul class="clearfix">
                        <li class="icons dropdown">
                            <c:if test="${loginStaff!=null}">
	                            <form action="${pageContext.request.contextPath}/admin/logout" id="logout">
	                            	<div><button type="button" id="logoutBtn" class="btn mb-1 btn-sm btn-outline-secondary">Logout</button></div>
	                            </form>
                            </c:if>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--**********************************
            머리 끝!
        ***********************************-->
        <!--**********************************
            Sidebar start
        ***********************************-->
		<jsp:include page="/WEB-INF/view/sideMenu.jsp"></jsp:include>
        <!--**********************************
            Sidebar end
        ***********************************-->
     <!--**********************************
         게시글 수정 폼 시작!
     ***********************************-->
    <div class="content-body">    
      <div class="row page-titles mx-0">
          <div class="col p-md-0">
              <ol class="breadcrumb">
                  <li></li>
              </ol>
          </div>
      </div>
        <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation">
                                <h4>Edit Board</h4>
                                <hr>
						       	<form id="modifyForm" action="${pageContext.request.contextPath}/admin/modifyBoard" method="post">
									<div class="form-group">
										<label for="boardId" class="col-lg-8 col-form-label">board Id <span class="text-danger"></span></label>
									</div>
									<div>
										<span>${boardMap.boardId}</span>
									</div>						       							
						            <div class="form-group">
						                <label for="boardTitle" class="col-lg-6 col-form-label">Title <span class="text-danger">*</span></label>
						                <div class="col-lg-8"> 
						                	<input class="form-control" name="board.boardTitle" id="boardTitle" type="text" placeholder="제목을 입력하세요."/>
						                </div>
						            </div>
						            <div class="form-group">
						                <label for="boardContent" class="col-lg-6 col-form-label">Content <span class="text-danger">*</span></label>
						                <div class="col-lg-8">
						                	<textarea class="form-control" name="board.boardContent" id="boardContent" rows="5" cols="50"></textarea>
						                </div>
							        </div>
							        <div class="form-group">
							            <label for="boardfile" class="col-lg-6 col-form-label">File <span class="text-danger"> </span></label>
							            <div class="col-lg-8">
							                <button id="addFileBtn" type="button" class="btn btn-sm btn-light">파일추가</button>
							                <button id="delFileBtn" type="button" class="btn btn-sm btn-light">파일삭제</button>
							            </div>
							            <div id="inputFile">
							            </div>
							        </div>
						            <div class="form-group">
						                <label for="staffId" class="col-lg-2 col-form-label">staff ID <span class="text-danger">*</span></label>
						                <div class="col-lg-3">
						                	<select class="form-control" id="staffId" name="board.staffId">
						                		<option value="1">1: Mike</option>
						                		<option value="2">2: Jon</option>
						                	</select>
						                </div>
						            </div>
									<div class="form-group">
						                <label for="boardPw" class="col-lg-8 col-form-label">board PW <span class="text-danger">*</span></label>
						              	<div class="col-lg-8"> 
						                	<input class="form-control" name="board.boardPw" id="boardPw" type="password" placeholder="4자 이상의 비밀번호를 입력하세요."/>
						                </div>
						            </div>
						            <div class="form-group row">
                                        <div class="col-lg-8 ml-auto">
						                	<input class="btn btn-primary" id="addButton" type="button" value="등록"/> 
						                    <input class="btn btn-default" type="reset" value="초기화" />
						                    <a href="${pageContext.request.contextPath}/admin/getBoardList"><input class="btn btn-default" type="button" value="목록"></a>
						            	</div>
						            </div>
						        </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        </div>
    </div>
        <!--**********************************
            수정폼 끝!
        ***********************************-->
       <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright &copy; Designed <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
                <p> Developed by Hyeyoung : coke0788, 2021 </p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
   <!--**********************************
        Scripts
    ***********************************-->
    <script src="../static/plugins/common/common.min.js"></script>
    <script src="../static/js/custom.min.js"></script>
    <script src="../static/js/settings.js"></script>
    <script src="../static/js/gleek.js"></script>
    <script src="../static/js/styleSwitcher.js"></script>

    <script src="../static/plugins/validation/jquery.validate.min.js"></script>
    <script src="../static/plugins/validation/jquery.validate-init.js"></script>
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