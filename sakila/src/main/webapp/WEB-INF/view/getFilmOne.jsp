<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                              <h4>Film One</h4>
                              <hr>
                              </div>
                              <table class="table">
								<tbody>
									<tr>
										<td>film_id </td>
										<td>${filmId}</td>
									</tr>
									<tr>
										<td>title </td>
										<td>${filmMap.title} </td>
									</tr>
									<tr>
										<td>category </td>
										<td>${filmMap.category}</td>
									</tr>
									<tr>
										<td>actors </td>
										<td>
										<a class="btn btn-light" href="${pageContext.request.contextPath}/admin/getActorListForFilm?filmId=${filmId}">배우추가</a>
										<br>
										${filmMap.actors}</td>
									</tr>
									<tr>
										<td>description </td>
										<td>${filmMap.description}</td>
									</tr>
									<tr>
										<td>release_year </td>
										<td>${filmMap.releaseYear}</td>
									</tr>
									<tr>
										<td>language</td>
										<td>${filmMap.language}</td>
									</tr>
									<tr>
										<td>rental_duration</td>
										<td>${filmMap.rentalDuration} 일</td>
									</tr>
									<tr>
										<td>rental_rate</td>
										<td>$ ${filmMap.rentalRate}</td>
									</tr>
									<tr>
										<td>replacement_cost</td>
										<td>$ ${filmMap.replacementCost}</td>
									</tr>
									<tr>
										<td>rating</td>
										<td>${filmMap.rating}</td>
									</tr>
									<tr>
										<td>special_features</td>
										<td>${filmMap.specialFeatures}</td>
									</tr>
									<tr>
										<td>last_update</td>
										<td>${filmMap.lastUpdate}</td>
									</tr>
									<tr>
										<td>film_stock</td>
										<td>${filmCount} 개</td>
									</tr>
									<tr>
										<td></td>
										<td>
										<a class="btn btn-light" href="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${filmId}&storeId=1">1매장 재고 보기</a>
										<a class="btn btn-light" href="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${filmId}&storeId=2">2매장 재고 보기</a>
										</td>
									</tr>
								</tbody>
							</table>
							<a class="btn btn-light" href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage}&searchWord=${searchWord}&rating=${rating}&searchWordForAcotor=${searchWordForAcotor}&orderWord=${orderWord}&categoryName=${categoryName}&price=${price}">목록</a>
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