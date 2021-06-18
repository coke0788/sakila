<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Home</title>
<!-- Custom Stylesheet -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	$('#logoutBtn').click(function(){
		console.log('logout!');
		$('#logout').submit();
	});
});
    
</script>
<title>Home</title>
</head>
<body>
     <!--**********************************
        Main wrapper start
    ***********************************-->
    <div class="jumbotron">
     <!--**********************************
         로그인
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
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation">
                                <h4>HOME</h4>
                                <hr>
						        <c:if test="${loginStaff == null}">
                                <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post" class="mt-5 mb-5 login-input">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="email" name="email" value="Mike.Hillyer@sakilastaff.com">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="password" name="password" value="1234">
                                    </div>
                                    <button class="btn btn-outline-primary w-100" id="btn">Sign In</button>
                                </form>
                            </c:if>
                            <c:if test="${loginStaff != null}">
                            <a href="${pageContext.request.contextPath}/admin/getBoardList"><button class="btn btn-outline-primary w-100">리스트로 이동</button></a>
                            	<form action="${pageContext.request.contextPath}/admin/logout" id="logout">
	                            		<div><button type="button" id="logoutBtn" class="btn btn-outline-secondary w-100">LOGOUT</button></div>
	                            </form>
                            </c:if>
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
</body>
</html>