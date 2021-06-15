<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>addInventory</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="../static/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="../static/css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    $(document).ready(function() { //레디
		$('#logoutBtn').click(function(){
			console.log('logout!');
			$('#logout').submit();
		});
    	$('#addButton').click(function(){
    		console.log('입력!');
    		$('#addForm').submit();
    	});
    });
    
</script>
<title>addFilm</title>
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
                    <div class="col-lg-10">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation">
                                <h4>Add Inventory</h4>
                                <hr>
						        <form method="post" action="${pageContext.request.contextPath}/admin/addInventory" id="addForm">
						        <input type="text" name="currentPage" value="${currentPage}" hidden="hidden">
						        <input type="text" name="searchWord" value="${searchWord}" hidden="hidden">
						         <div class="form-group">
						              <label for="title" class="col-lg-8 col-form-label">Title</label>
						              <div class="col-lg-8"> 
						                  <input type="text" name="filmId" class="form-control" value="${filmId}" hidden="hidden"> 
						                  <input type="text" name="title" class="form-control" value="${title}" readonly>
						              </div>
						        </div>
					            <div class="form-group">
					              <label for="categoryId" class="col-lg-8 col-form-label">Store ID <span class="text-danger">*</span></label>
					            	<div class="col-lg-8"> 
						                  <select name="storeId" id ="storeId" class="form-control">
						                        <option value="1">store 1</option>
						                        <option value="2">store 2</option>
						                  </select>
						              </div>
						        </div>
								<div class="form-group row">
                                        <div class="col-lg-8 ml-auto">
						                	<input class="btn btn-primary" id="addButton" type="button" value="등록"/> 
						                    <a href="${pageContext.request.contextPath}/admin/getInventoryOne?currentPage=${currentPage}&searchWord=${searchWord}&filmId=${filmId}&title=${title}"><input class="btn btn-default" type="button" value="뒤로가기"></a>
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