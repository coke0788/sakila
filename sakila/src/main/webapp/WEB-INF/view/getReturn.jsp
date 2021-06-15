<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>getReturn</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="../static/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="../static/css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    $(document).ready(function() { //레디
    	 var checkNum = RegExp(/^\d*[.]\d{2}$/); 
		$('#logoutBtn').click(function(){
			console.log('logout!');
			$('#logout').submit();
		});
    	$('#addButton').click(function(){
    		if($('#amount').val()==''){
        		alert('반납 금액을 입력해주세요.');
        	} else {
	    		console.log('입력!');
	    		$('#addForm').submit();
        	}
    	});
    });
    
</script>
<title>addPayment</title>
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
                                <h4>Payment</h4>
                                <hr>
						        <form method="post" action="${pageContext.request.contextPath}/admin/getReturn" id="addForm">
						        <input type="text" name="customerId" class="form-control" value="${customerId}" hidden="hidden">
						        <input type="text" name="rentalId" class="form-control" value="${rentalId}" hidden="hidden">
						        	<div class="form-group">
										<label for="title" class="col-lg-8 col-form-label">Title</label>
										<div class="col-lg-8">${duration.title}</div>
						            </div>
						        	<div class="form-group">
						              <label for="title" class="col-lg-8 col-form-label">Normal Price / Late Fee(per day)</label>
						              <div class="col-lg-8"> 
						              	${duration.rentalRate} / 1.00
						              </div>
						        	</div>
						        	<div class="form-group">
						              <label for="title" class="col-lg-8 col-form-label">Duration</label>
						              <div class="col-lg-8"> 
						              	${duration.duration}
						              </div>
						        	</div>
						        	<div class="form-group">
						              <label for="title" class="col-lg-8 col-form-label">Rental Date</label>
						              <div class="col-lg-8"> 
						              	${duration.date}
						              </div>
						        	</div>
						            <div class="form-group">
						              <label for="categoryId" class="col-lg-8 col-form-label">Staff<span class="text-danger">*</span></label>
						            	<div class="col-lg-8"> 
							                  <select name="staffId" id ="staffId" class="form-control">
							                        <c:forEach var="s" items="${staff}">
							                        	<option value="${s.id}">${s.id} : ${s.name}</option>
							                        </c:forEach>
							                  </select>
							              </div>
							        </div>
							        <div class="form-group">
						              <label for="title" class="col-lg-8 col-form-label">Payment <span class="text-danger">*</span></label>
						              <div class="col-lg-8">
						              	<c:if test="${duration.date<=duration.duration}">
						              		<input type="text" class="form-control" name="amount" id="amount" value="${duration.rentalRate}">
						              	</c:if> 
						              	<c:if test="${duration.date>duration.duration}">
						              		<input type="text" class="form-control" name="amount" id="amount" value="${duration.rentalRate+(duration.date-duration.duration)}">
						              	</c:if>
						              </div>
						        	</div>
								<div class="form-group row">
			                        <div class="col-lg-8 ml-auto">
					                	<input class="btn btn-primary" id="addButton" type="button" value="반납"/>
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