<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>getInventoryOne</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="../static/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="../static/css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#logoutBtn').click(function(){
		console.log('logout!');
		$('#logout').submit();
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
        ***********************************-->
		<jsp:include page="/WEB-INF/view/sideMenu.jsp"></jsp:include>
        <!--**********************************
            Sidebar end
        ***********************************-->
      <!--**********************************
         상세 내용 출력 시작!
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
                              <h4>${filmId}. ${title}</h4>
                              <hr>
                              </div>
                              <div class="text-right">
                              		<a class="btn btn-default" href="${pageContext.request.contextPath}/addInvetory"><i class="fa fa-pencil"> 재고 추가</i></a>
                              </div>
                              <div>
                              	<h4 class="font-weight-bold"> store 1 </h4>
                              </div>
                              <table class="table">
                              	<thead>
                              		<tr>
                              			<th></th>
                              			<th>대여 중</th>
                              			<th>대여 가능</th>
                              			<th>delete</th>
                              		</tr>
                              	</thead>
								<tbody>
									<c:forEach var="s1" items="${stockList1}">
									<tr>
										<td>Inventory Id</td>
										<td></td>
										<td>${s1}</td>
										<td><a href="${pageContext.request.contextPath}/removeIventory?inventoryId=${s1}"><i class="fa fa-trash"></i></a></td>
									</tr>
									</c:forEach>
									<c:forEach var="ns1" items="${notStockList1}">
									<tr>
										<td>Inventory Id</td>
										<td style="color:red">${ns1}</td>
										<td></td>
										<td><i class="fa fa-minus"></i></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<hr>
							<div>
								<h4 class="font-weight-bold"> store 2 </h4>
							</div>
							<table class="table">
                            <thead>
                           		<tr>
                           			<th></th>
                           			<th>대여 중</th>
                           			<th>대여 가능</th>
                           			<th>delete</th>
                           		</tr>
                           	</thead>
							<tbody>
								<c:forEach var="s2" items="${stockList2}">
									<tr>
										<td>Inventory Id</td>
										<td></td>
										<td>${s2}</td>
										<td><a href="${pageContext.request.contextPath}/removeIventory?inventoryId=${s2}"><i class="fa fa-trash"></i></a></td>
									</tr>
									</c:forEach>
								<c:forEach var="ns2" items="${notStockList2}">
									<tr>
										<td>Inventory Id</td>
										<td style="color:red">${ns2}</td>
										<td></td>
										<td><i class="fa fa-minus"></i></td>
									</tr>
									</c:forEach>
							</tbody>
							</table>
							<hr>
							<a class="btn btn-light" href="javascript:history.back()">목록</a>
                           </div>
                      </div>
                  </div>
              </div>
        </div>
    </div>
     <!--**********************************
         상세 내용 출력 끝!
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