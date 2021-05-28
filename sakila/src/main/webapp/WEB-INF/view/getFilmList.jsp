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
		$('#btnOrderWord').click(function(){
			console.log('btn click');
			$('#order').submit();
		});
		$('#btnSearch').click(function(){
			console.log('btn click');
			$('#search').submit();
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
            Content body start
        ***********************************-->
        <div class="content-body">
		<!-- ***************************************
					영화 리스트
		***************************************
		 -->
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-11">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>Film List</h4>
                                <div class="text-right">
								     <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addFilm"><i class="fa fa-pencil"> 영화 추가</i></a>
								</div>
                                    <hr>
                                    <!-- 정렬 선택 창 -->
                                    <form action="${pageContext.request.contextPath}/admin/getFilmList" id="order" method="get">
                                    	<div class="btn-group m-b-20">
                                            <select class="btn btn-light dropdown-toggle" data-toggle="dropdown" name="orderWord">
                                            	<option class="dropdown-item" value="FID">정렬기준</option>
                                            	<option class="dropdown-item" value="title">Title</option>
                                            	<option class="dropdown-item" value="price">Price</option>
                                            	<option class="dropdown-item" value="rating">rating</option>
                                            	<option class="dropdown-item" value="category">category</option>
                                            </select>
                                            <select class="btn btn-light dropdown-toggle" data-toggle="dropdown" name="categoryName">
                                            	<option value="">카테고리선택</option>
                                            	<c:forEach var="c" items="${categoryNameList}">
                                            		<c:if test="${c.name == categoryName}">
											 			<option value="${c.name}" selected="selected">${c.name}</option>
											 		</c:if>
											 		<c:if test="${c.name != categoryName}">
											 			<option value="${c.name}">${c.name}</option>
											 		</c:if>
                                            	</c:forEach>
                                            </select>
                                            <!-- /정렬 선택 창 -->
                                           
                                            <!-- 검색 옵션 선택 창 -->
                                            <select class="btn btn-light dropdown-toggle" data-toggle="dropdown" name="price">
                                            	<option value="">가격선택</option>
                                            		<c:if test="${price == 0.99}">
                                            			<option value="0.99" selected="selected">0.99</option>
                                            		</c:if>
                                            		<c:if test="${price != 0.99}">
                                            			<option value="0.99">0.99</option>
                                            		</c:if>
                                            		<c:if test="${price == 2.99}">
                                            			<option value="2.99" selected="selected">2.99</option>
                                            		</c:if>
                                            		<c:if test="${price != 2.99}">
                                            			<option value="2.99">2.99</option>
                                            		</c:if>
                                            		<c:if test="${price == 4.99}">
                                            			<option value="4.99" selected="selected">4.99</option>
                                            		</c:if>
                                            		<c:if test="${price != 4.99}">
                                            			<option value="4.99">4.99</option>
                                            		</c:if>
                                            </select>
                                            <select class="btn btn-light dropdown-toggle" data-toggle="dropdown" name="rating">
                                            	<option value="">등급선택</option>
                                            	<c:forEach var="r" items="${ratingList}">
                                            		<c:if test="${r == rating}">
											 			<option value="${r}" selected="selected">${r}</option>
											 		</c:if>
											 		<c:if test="${r != rating}">
											 			<option value="${r}">${r}</option>
											 		</c:if>
                                            	</c:forEach>
                                            </select>
                                            <!-- /검색 옵션 선택 창 -->
                                          
                                            <!-- 검색 창 -->
                                            <input name="searchWord" type="search" class="form-control" placeholder="Search Title">
                                            <input name="searchWordForActor" type="search" class="form-control" placeholder="Search Actor">
                                            <button class="btn btn-light" id="btnOrderWord" type="button"><i class="fa fa-check-circle"></i></button>
                                            <!-- /검색 창 -->
                                        </div>
                                    </form>
                                    <a href="${pageContext.request.contextPath}/admin/getFilmList"><button class="btn btn-dark" type="button">검색초기화</button></a>
                                    <hr>
                                </div>
                                
                                <!-- 목록 출력 창 -->
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
								            <tr>
								                <th>FID</th>
								                <th>Title</th>
								                <th>Category</th>
								                <th>Price</th>
								                <th>Length</th>
								                <th>Rating</th>
								            </tr>
								        </thead>
                                        <tbody>
							            	<c:forEach var="f" items="${filmList}">
							                <tr>
							                	<td>${f.FID}</td>
							                    <td><a href="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${f.FID}">${f.title}</a></td>
							                    <td>${f.category}</td>
							                    <td>$ ${f.price}</td>
							                    <td>${f.length} min</td>
							                    <td>${f.rating}</td>
							                </tr>
							            	</c:forEach>
							        	</tbody>
									</table>
								<!-- /목록 출력 창 -->
								
								<!-- 페이징 -->
								<div class="col-7">
								    <div class="text-left">pages : ${currentPage} of ${lastPage}</div>
								</div>
							    <div class="btn-group float-right">
							        <c:if test="${currentPage > 1}">
							            <a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage-1}&searchWord=${searchWord}&searchWordForAcotor=${searchWordForAcotor}&orderWord=${orderWord}&categoryName=${categoryName}&price=${price}"><button class="btn btn-gradient" type="button"><i class="fa fa-angle-left"></i></button></a>
							        </c:if>
							        <c:if test="${currentPage < lastPage}">
							            <a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage+1}&searchWord=${searchWord}&searchWordForAcotor=${searchWordForAcotor}&orderWord=${orderWord}&categoryName=${categoryName}&price=${price}"><button class="btn btn-gradient" type="button"><i class="fa fa-angle-right"></i></button></a>
							        </c:if>
							    </div>
							    <!-- /페이징 -->
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