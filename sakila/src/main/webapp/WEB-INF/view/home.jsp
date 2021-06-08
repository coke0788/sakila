<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="../static/images/favicon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Custom Stylesheet -->
<link href="../static/css/style.css" rel="stylesheet">
<script>
$(document).ready(function(){
	console.log('ready');
	$('#btn').click(function(){
		console.log('click');
		$('#loginForm').submit();
	});
});
</script>
<title>home</title>
</head>
<body class="h-100">
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
	    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-5">
                            <div class="card-body pt-5">
                            <!-- 로그인 안 되어 있을 때 -->
							<c:if test="${loginStaff == null}">
                                <a class="text-center" href="${pageContext.request.contextPath}/"> <h4>LogIn</h4></a>
                                <form id="loginForm" action="${pageContext.request.contextPath}/login" method="post" class="mt-5 mb-5 login-input">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="email" name="email" value="Mike.Hillyer@sakilastaff.com">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="password" name="password" value="1234">
                                    </div>
                                    <button class="btn login-form__btn w-100" id="btn">Sign In</button>
                                </form>
                            </c:if>
                            <c:if test="${loginStaff != null}">
                            		<a href="${pageContext.request.contextPath}/admin/getBoardList"><button class="btn login-form__btn w-100" id="btn">리스트로 이동</button></a>
                            </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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