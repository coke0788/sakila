<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>getFilmList</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="../static/images/favicon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Custom Stylesheet -->
<link href="../static/css/style.css" rel="stylesheet">
<script>
$(document).ready(function(){
	$('#btn').click(function(){
		console.log('btn click!');
		$('#searchWordForm').submit();
	});
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
                <div class="header-left">
                    <div class="input-group icons">
                    	<!-- 검색어 입력창 -->
					    <form action="${pageContext.request.contextPath}/admin/getStaffList" method="get" id="searchWordForm">
                        <div class="input-group-prepend">
                        	<span class="input-group-text bg-transparent border-0 pr-2 pr-3" id="basic-addon1">
					        <input name="searchWord" type="search" class="form-control" placeholder="Search Staff">
					        <button class="btn btn-primary" id="btn"><i class="mdi mdi-magnify"></i></button></span>
					    </div>
					    </form>
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
         리스트 시작!
     ***********************************-->
     <div class="container">
      <div class="row justify-content-center">
          <div class="col p-md-3">
              <div class="col-lg-11">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>Staff List</h4>
                                    <hr>
                                </div>
                            <div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>SID</th>
											<th>Id</th>
											<th>name</th>
											<th>address</th>
											<th>phone</th>
											<th>city</th>
											<th>country</th>
										</tr>	
									</thead>
									<tbody>
										<c:forEach var="s" items="${staffList}">
										<tr>
											<td>${s.sid}</td>
											<td>${s.id}</td>
											<td>${s.name}</td>
											<td>${s.address}</td>
											<td>${s.phone}</td>
											<td>${s.city}</td>
											<td>${s.country}</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
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