<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>getCustomerList</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../static/images/favicon.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Custom Stylesheet -->
    <link href="../static/css/style.css" rel="stylesheet">
	<script>
	$(document).ready(function(){
		$('#logoutBtn').click(function(){
			console.log('logout!');
			$('#logout').submit();
		});
		$('#btnSearch').click(function(){
			console.log('btn click');
			$('#search').submit();
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
					    <form id="search" action="/admin/getCustomerList" method="get">
                        <div class="input-group-prepend">
                        	<span class="input-group-text bg-transparent border-0 pr-2 pr-3" id="basic-addon1">
                        	<select class="btn btn-light dropdown-toggle" data-toggle="dropdown" name="storeId">                        		
                        		<option value="0">지점선택</option>
                        		<c:if test="${storeId==1}">
                        			<option value="1" selected>store 1</option>
                        		</c:if>
                        		<c:if test="${storeId!=1}">
                        			<option value="1">store 1</option>
                        		</c:if>
                        		<c:if test="${storeId==2}">
                        			<option value="2" selected>store 2</option>
                        		</c:if>
                        		<c:if test="${storeId!=2}">
                        			<option value="2">store 2</option>
                        		</c:if>
                        	</select>
                        	<select class="btn btn-light dropdown-toggle" data-toggle="dropdown" name="active">
                        		<option value="2">고객활성상태</option>
                        		<c:if test="${active==0}">
                        			<option value="0" selected>INACTIVE</option>
                        		</c:if>
                        		<c:if test="${active!=0}">
                        			<option value="0">INACTIVE</option>
                        		</c:if>
                        		<c:if test="${active==1}">
                        			<option value="1" selected>ACTIVE</option>
                        		</c:if>
                        		<c:if test="${active!=1}">
                        			<option value="1">ACTIVE</option>
                        		</c:if>
                        	</select>
					        <input name="searchWord" type="text" class="form-control" placeholder="Search Customer">
					        <button class="btn btn-primary" id="btnSearch"><i class="mdi mdi-magnify"></i></button></span>
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
                    <div class="col-lg-11">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>Customer List</h4>
                                    <hr>
                                    <div class="text-right">
								        <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addCustomer"><i class="fa fa-pencil"> 고객 추가</i></a>
								    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
								            <tr>
								            	<th>Store ID</th>
								                <th>Customer ID</th>
								                <th>Name</th>
								                <th>Email</th>
								                <th>Status</th>
								                <th>Black List</th>
								            </tr>
								        </thead>
                                        <tbody>
						            	<c:forEach var="i" begin="${beginRow}" end="${rowPerPage-1}">
							                <tr>
							                	<td>${list[i].storeId}</td>
							                    <td>${list[i].customerId}</td>
							                    <td><a href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${list[i].customerId}&currentPage=${currentPage}&searchWord=${searchWord}&storeId=${storeId}&active=${active}">${list[i].firstName} ${list[i].lastName}</a></td>
							                    <td>${list[i].email}</td>
							                    <c:if test="${list[i].active==1}">
							                    	<td>ACTIVE</td>
							                    </c:if>
							                    <c:if test="${list[i].active==0}">
							                    	<td style="color:red">INACTIVE</td>
							                    </c:if>
							                    <c:if test="${blackList[i]<=10}">
							                    	<td>NORMAL</td>
							                    </c:if>
							                    <c:if test="${blackList[i]>10}">
							                    	<td style="color:red">BLACK CONSUMER</td>
							                    </c:if>
							                </tr>
						            	</c:forEach>
							        	</tbody>
									</table>
	<div class="col-7">
	    <div class="text-left">pages : ${currentPage} of ${lastPage}</div>
	</div>
    <div class="btn-group float-right">
        <c:if test="${currentPage > 1}">
            <a href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage-1}&searchWord=${searchWord}&storeId=${storeId}&active=${active}"><button class="btn btn-gradient" type="button"><i class="fa fa-angle-left"></i></button></a>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <a href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage+1}&searchWord=${searchWord}&storeId=${storeId}&active=${active}"><button class="btn btn-gradient" type="button"><i class="fa fa-angle-right"></i></button></a>
        </c:if>
    </div>
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