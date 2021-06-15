<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>getFilmOne</title>
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
                              <h4>Customer One</h4>
                              <hr>
                              </div>
                              <table class="table">
								<tbody>
									<tr>
										<td>Features</td>
										<td>
										<c:if test="${blackList[0]>15}">
											BlackList
										</c:if>
										<c:if test="${blackList[0]<=15}">
											-
										</c:if>
										/
										<c:if test="${VIPList[0]>=130 && blackList[0]<=15}">
											VIP
										</c:if>
										<c:if test="${VIPList[0]<130}">
											-
										</c:if>
										</td>
									</tr>
									<tr>
										<td>Store ID </td>
										<td>${map.storeId}</td>
									</tr>
									<tr>
										<td>Customer ID. Name</td>
										<td>${map.customerId}. ${map.name}</td>
									</tr>
									<tr>
										<td>E-mail </td>
										<td>${map.email}</td>
									</tr>
									<tr>
										<td>Address </td>
										<td>${map.address}</td>
									</tr>
									<tr>
										<td>ZIP CODE </td>
										<td>${map.zipCode}</td>
									</tr>
									<tr>
										<td>Phone </td>
										<td>${map.phone}</td>
									</tr>
									<tr>
										<td>City(Country) </td>
										<td>${map.city} (${map.country})</td>
									</tr>
									<tr>
										<td>Payment</td>
										<td>$ ${VIPList[0]}</td>
									</tr>
									<tr>
										<td>Now Rental</td>
										<td>
										<a class="btn btn-sm btn-light" href="${pageContext.request.contextPath}/admin/addRental?customerId=${map.customerId}">대여</a><br>
										<c:forEach var="r" items="${rentalList}">
											${r.inventoryId} / ${r.filmId} / ${r.title}
											<c:if test="${r!=null}">
												<a class="btn btn-sm btn-light" href="${pageContext.request.contextPath}/admin/getReturn?rentalId=${r.rentalId}&inventoryId=${r.inventoryId}&customerId=${map.customerId}&filmId=${r.filmId}">반납</a>
											</c:if>
											<br>
										</c:forEach>
										</td>
									</tr>
									<tr>
										<td>Status </td>
										<c:if test="${map.notes=='active'}">
											<td>ACTIVE</td>
										</c:if>
										<c:if test="${map.notes==''}">
											<td style="color:red">INACTIVE</td>
										</c:if>
									</tr>
									<tr>
										<td>Create Date </td>
										<td>${map.createDate}</td>
									</tr>
									<tr>
										<td>Last Update Date </td>
										<td>${map.lastUpdate}</td>
									</tr>
								</tbody>
							</table>
							<a class="btn btn-light" href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage}&searchWord=${searchWord}&storeId=${storeId}&active=${active}">목록</a>
							<hr>
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