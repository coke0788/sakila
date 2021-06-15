<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>addBoard</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="../static/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="../static/css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    $(document).ready(function() { //레디
        $('#addButton').click(function() { //폼 add 버트 ㄴ눌렀을때
        	
        	let ck = false;
        	let boardfile = $('.boardfile'); //배열
        	
        	for(let item of boardfile){ // 자바 스크립트의 foreach 문
        		if($(item).val() == ''){
        			ck = true;
        			console.log('첨부되지 않은 파일이 존재합니다.');
        			break;
        		}
        	}
        	if(ck){ //ck==true 이면
        		alert('첨부되지 않은 파일이 존재합니다.');
        		console.log('첨부되지 않은 파일이 존재합니다.');
        	} else if ($('#boardPw').val().length < 4) { //유효성 검사 실행
                alert('boardPw는 4자이상 이어야 합니다');
                console.log('패스워드 오류');
                $('#boardPw').focus();
            } else if ($('#boardTitle').val() == '') {
                alert('boardTitle을 입력하세요');
                console.log('타이틀 오류');
                $('#boardTitle').focus();
            } else if ($('#boardContent').val() == '') {
            	console.log('내용 오류');
                alert('boardContent을 입력하세요');
                $('#boardContent').focus();
            } else if ($('#boardUser').val() == '') {
            	console.log('유저 오류');
                alert('boardUser을 입력하세요');
                $('#boardUser').focus();
            } else {
                $('#addForm').submit();
            }
        });
        
        $('#addFileBtn').click(function(){ //파일 추가
        	console.log('addfile click');
        	$('#inputFile').append('<input type="file" name="boardfile" class="boardfile btn btn-sm btn-light">');
        });
        $('#delFileBtn').click(function(){ //파일 삭제 : 마지막 태그르 삭제
        	console.log('delFile click');
        	$('#inputFile').children().last().remove(); //inputfile 태그의 자식 중 가장 마지막 애를 삭제한다.
        });
    });
    
</script>
<title>addBoard</title>
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
	                            <!-- 로그아웃 디자인 해야 함. -->
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
         게시글 입력 폼 시작!
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
						        <form id="addForm" action="${pageContext.request.contextPath}/admin/addBoard" method="post" enctype="multipart/form-data">
						            <div class="form-group">
						                <label for="boardPw" class="col-lg-8 col-form-label">board PW <span class="text-danger">*</span></label>
						              	<div class="col-lg-8"> 
						                	<input class="form-control" name="board.boardPw" id="boardPw" type="password" placeholder="4자 이상의 비밀번호를 입력하세요."/>
						                </div>
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
            입력폼 끝!
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
</body>
</html>