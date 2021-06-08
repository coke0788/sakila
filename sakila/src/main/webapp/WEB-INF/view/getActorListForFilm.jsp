<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>getActorListForFilm</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../static/images/favicon.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Custom Stylesheet -->
    <link href="../static/css/style.css" rel="stylesheet">
	<script>
	$(document).ready(function(){
		$('#btn').click(function(){
			console.log('click!');
			if(!$("input:checked[id='ck']").is(":checked")){ //체크박스 아무것도 체크 안 하고 배우 추가 선택 시 경고창 출력.
				alert('추가할 배우를 선택하세요.'); 
			} else { 
				$('#addForm').submit();
			}
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
					    <form action="/admin/getActorListForFilmSearch" method="get">
                        <div class="input-group-prepend">
                        	<span class="input-group-text bg-transparent border-0 pr-2 pr-3" id="basic-addon1">
                        	<input name="filmId" type="search" class="form-control" value="${filmId}"hidden="hidden">
					        <input name="searchWord" type="search" class="form-control" placeholder="Search Actor">
					        <button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i></button></span>
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
            그 때 그 때 필요한 것들 추가하기!
        ***********************************-->
		<jsp:include page="/WEB-INF/view/sideMenu.jsp"></jsp:include>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
		<!-- ***************************************
					게시판 리스트
		***************************************
		 -->
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-9">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>Appeared actor List</h4>
                                    <hr>
                                </div>
                                <div class="table-responsive">
                                <form action="${pageContext.request.contextPath}/admin/getActorListForFilm" method="post" id="addForm">
                                	<div class="float-right"> 
                                		<button type="button" id="btn" class="btn mb-1 btn-sm btn-outline-primary">추가</button>
                                		<input type="text" name="filmId" value="${filmId}" hidden="hidden">
                                	</div>
                                    <table class="table">
                                        <thead>
								            <tr>
								                <th>actor_id</th>
								                <th>actor_name</th>
								                <th>check</th>
								            </tr>
								        </thead>
                                        <tbody>
							            	<c:forEach var="a" items="${actorList}">
							                <tr>
							                	<td>${a.actorId}</td>
							                    <td>${a.name}</td>
							                    <td>
							                    <c:if test="${a.filmId != null}">
							                    	<input type="checkbox" class="form-check-input" name="actorId" value="${a.actorId}" disabled checked>
							                    	이미 출연 중인 배우입니다.
							                    </c:if>
							                    <c:if test="${a.filmId == null}">
							                    	<input type="checkbox" class="form-check-input" name="actorId" value="${a.actorId}" id="ck">
							                    </c:if>
							                    </td>
							                </tr>
							            	</c:forEach>
							        	</tbody>
									</table>
									</form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    </div>
                </div>
            </div>
            <!-- #/ container -->
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