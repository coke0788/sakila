<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>addComment</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../static/images/favicon.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Custom Stylesheet -->
    <link href="../static/css/style.css" rel="stylesheet">
<script>
    $(document).ready(function() {
        $('#addButton').click(function() {
            if ($('#commentContent').val() == '') {
                alert('commentContent를 입력하세요');
                $('#commentContent').focus();
            } else if ($('#username').val() == '') {
                alert('username을 입력하세요');
                $('#username').focus();
            } else {
                $('#addForm').submit();
            }
        });
    });
</script>
<title>addComment</title>
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
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                <span class="activity active"></span>
                                <img src="images/user/1.png" height="40" width="40" alt="">
                            </div>
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
            그 때 그 때 필요한 것들 추가하기!
        ***********************************-->
        <div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getBoardList" aria-expanded="false">
                            <i class="fa fa-clipboard"></i><span class="nav-text">Board List</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getFilmList" aria-expanded="false">
                            <i class="fa fa-clipboard"></i><span class="nav-text">Film List</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getStaffList" aria-expanded="false">
                            <i class="fa fa-clipboard"></i><span class="nav-text">Staff List</span>
                        </a>
                    </li>
                    <li>
                        <a href="widgets.html" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->
       <!--**********************************
            Content body start
            디자인 이상함.....
        ***********************************-->
	<div class="container-fluid">
		<div class="row">
		<h1>addBoard</h1>
		<div class="col-lg-12">
                  <div class="card">
                      <div class="card-body">
                      	<div class="card-title">
                          <h4>addComment</h4>
                          <hr>
                          <div class="basic-form">
                              <form id="addForm" action="${pageContext.request.contextPath}/admin/addComment" method="post">
                              	<input type="text" hidden="hidden" name="boardId" id="boardId" value="${boardId}">
                                 	 <div class="form-group">
                                      	<label>Comment:</label>
                                      	<textarea class="form-control h-150px" rows="6" name="commentContent" id="commentContent"></textarea>
                                  	</div>
                                  	<div class="form-group">
										<label for="username">username :</label> <input class="form-control" name="username" id="username" type="text" />
									</div>
									<div>
										<input class="btn btn-default" id="addButton" type="button"
											value="글입력" /> <input class="btn btn-default" type="reset"
											value="초기화" /> <a class="btn btn-default"
											href="${pageContext.request.contextPath}/admin/getBoardOne?boardId=${boardId}">뒤로가기</a>
									</div>
                              </form>
                          </div>
                      </div>
                 	 </div>
              	</div>
         </div>
		 </div>
	</div>
		 <!--**********************************
            Content body end
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
	
</body>
</html>