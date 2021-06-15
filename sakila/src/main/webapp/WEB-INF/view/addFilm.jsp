<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>addFilm</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="../static/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="../static/css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    $(document).ready(function() { //레디
    	var checkNum = RegExp(/[^0-9]$/);
		$('#logoutBtn').click(function(){
			console.log('logout!');
			$('#logout').submit();
		});
        $('#addButton').click(function() { //폼 add 버트 ㄴ눌렀을때
        	if($('#title').val()==''){
        		alert('타이틀을 입력해주세요.');
        	} else if($('#description').val()==''){
        		alert('설명을 입력해주세요.');
        	} else if($('#releaseYear').val()==''){
        		alert('발매일을 입력해주세요.');
        	} else if(checkNum.test($('#releaseYear').val())){
        		console.log('숫자 아님 숫자 아님');
        		alert('발매일은 숫자를 입력해주세요.');
        	} else if($('#releaseYear').val().length != 4){
        		console.log('숫자 길이 안맞음');
        		alert('발매일은 4자리 숫자를 입력해주세요.');
        	} else if($('#rentalDuration').val()==''){
        		alert('대여기한을 입력해주세요.');
        	} else if(checkNum.test($('#rentalDuration').val())){
        		console.log('숫자 아님 숫자 아님');
        		alert('대여기한은 숫자를 입력해주세요.');
        	} else if($('#length').val()==''){
        		alert('길이를 입력해주세요.');
        	} else if(checkNum.test($('#length').val())){
        		console.log('숫자 아님 숫자 아님');
        		alert('길이는 숫자를 입력해주세요.');
        	} else if($('#replacementCost').val()==''){
        		alert('대체금액을 입력해주세요.');
        	} else if(checkNum.test($('#replacementCost').val())){
        		console.log('숫자 아님 숫자 아님');
        		alert('대체금액은 숫자를 입력해주세요.');
        	} else {
			 $('#addForm').submit();
        	}
        });
    });
    
</script>
<title>addFilm</title>
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
                                <h4>Add Film</h4>
                                <hr>
                                	<!-- 테이블을 div로 디자인 변경 해야 함. -->
						        <form method="post" action="${pageContext.request.contextPath}/admin/addFilm" id="addForm">
						         <div class="form-group">
						              <label for="title" class="col-lg-8 col-form-label">Title <span class="text-danger">*</span></label>
						              <div class="col-lg-8"> 
						                  <input type="text" name="film.title" id="title" class="form-control">
						              </div>
						        </div>
					            <div class="form-group">
					              <label for="categoryId" class="col-lg-8 col-form-label">Category ID <span class="text-danger">*</span></label>
					            	<div class="col-lg-8"> 
						               	<!-- filmForm 안의 category(vo) 안의 categoryId 값이라서. -->
						                  <select name="category.categoryId" id ="categoryId" class="form-control">
						                     <c:forEach var="c" items="${categoryList}">
						                        <option value="${c.categoryId}">${c.name}</option>
						                     </c:forEach>
						                  </select>
						              </div>
						        </div>
					            <div class="form-group">
					              <label for="description" class="col-lg-8 col-form-label">Description <span class="text-danger">*</span></label>
					            	<div class="col-lg-8"> 
						                  <textarea rows="5" cols="100" name="film.description" id="description" class="form-control"></textarea>
						            </div>
						        </div>
						        <div class="form-group">
					              <label for="releaseYear" class="col-lg-8 col-form-label">Release Year <span class="text-danger">*</span></label>
					            	<div class="col-lg-8"> 
						                  <input type="text" name="film.releaseYear" id="releaseYear" class="form-control">
						            </div>
						        </div>
						        <div class="form-group">
					              <label for="language" class="col-lg-8 col-form-label">language <span class="text-danger">*</span></label>
					            	<div class="col-lg-8"> 
						                  <select name="film.languageId" id ="language" class="form-control">
						                     <c:forEach var="lang" items="${languageList}">
						                        <option value="${lang.languageId}">${lang.name}</option>
						                     </c:forEach>
						                  </select>
						             </div>
						        </div>
						        <div class="form-group">
					              <label for="originalLanguage" class="col-lg-8 col-form-label">Original language </label>
					            	<div class="col-lg-8"> 
						                  <select name="film.originalLanguageId" id ="originalLanguage" class="form-control">
						                     <option value="0">========</option>
						                     <c:forEach var="lang" items="${languageList}">
						                        <option value="${lang.languageId}">${lang.name}</option>
						                     </c:forEach>
						                  </select>
						             </div>
						        </div>
						        <div class="form-group">
					              <label for="rentalDuration" class="col-lg-8 col-form-label">Rental Duration <span class="text-danger">*</span></label>
					            	<div class="col-lg-8"> 
						                  <input type="text" name="film.rentalDuration" id="rentalDuration" class="form-control">               
						            </div>
						        </div>
						        <div class="form-group">
					              <label for="rentalRate" class="col-lg-8 col-form-label">Rental Rate <span class="text-danger">*</span></label>
					            	<div class="col-lg-8"> 
					            		<select name="film.rentalRate" id ="rentalRate" class="form-control">
					            			<option value="0.99">0.99</option>
					            			<option value="2.99">2.99</option>
					            			<option value="4.99">4.99</option>
					            		</select>
						            </div>
						        </div>
						        <div class="form-group">
					              <label for="length" class="col-lg-8 col-form-label">Length <span class="text-danger">*</span></label>
					            	<div class="col-lg-8"> 
						                  <input type="text" name="film.length" id="length" class="form-control">
						             </div>
						        </div>
						        <div class="form-group">
					              <label for="replacementCost" class="col-lg-8 col-form-label">Replacement Cost <span class="text-danger">*</span></label>
					            	<div class="col-lg-8"> 
						                  <input type="text" name="film.replacementCost" id="replacementCost" class="form-control">
						            </div>
						        </div>
						        <div class="form-group">
					              <label for="rating" class="col-lg-8 col-form-label">Rating <span class="text-danger">*</span></label>
					            	<div class="col-lg-8"> 
						                  <select name="film.rating" id ="rating" class="form-control">
						                     <option value="G">G</option>
						                     <option value="PG">PG</option>
						                     <option value="PG-13">PG-13</option>
						                     <option value="R">R</option>
						                     <option value="NC-17">NC-17</option>
						                  </select>
						              </div>
						        </div>
						        <div class="form-group">
					              <label for="specialFeatures" class="col-lg-8 col-form-label">Special Features <span class="text-danger">*</span></label>
					            	<div class="col-lg-8"> 
						                  <input type="checkbox" name="specialFeatures" value="Trailers"> Trailers&nbsp;
						                  <input type="checkbox" name="specialFeatures" value="Commentaries"> Commentaries&nbsp;
						                  <input type="checkbox" name="specialFeatures" value="Deleted Scenes"> Deleted Scenes&nbsp;
						                  <input type="checkbox" name="specialFeatures" value="Behind the Scenes"> Behind the Scenes
						             </div>
						        </div> 
								<div class="form-group row">
                                        <div class="col-lg-8 ml-auto">
						                	<input class="btn btn-primary" id="addButton" type="button" value="등록"/> 
						                    <a href="${pageContext.request.contextPath}/admin/getFilmList"><input class="btn btn-default" type="button" value="목록"></a>
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