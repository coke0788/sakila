<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>getBoardOne</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="../static/images/favicon.png">
<!-- Custom Stylesheet -->
<link href="../static/css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#btn').click(function(){
		console.log('btn click');
		$('#deleteCommentForm').submit();
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
                              <h4>Board One</h4>
                              <hr>
                              </div>
                              <table class="table">
								<tbody>
									<tr>
										<td>board_id </td>
										<td>${boardMap.boardId}</td>
									</tr>
									<tr>
										<td>board_title </td>
										<td>${boardMap.boardTitle}</td>
									</tr>
									<tr>
										<td>board_content </td>
										<td>${boardMap.boardContent}</td>
									</tr>
									<tr>
										<td>username </td>
										<td>${boardMap.username}</td>
									</tr>
									<tr>
										<td>insert_date </td>
										<td>${boardMap.insertDate}</td>
									</tr>
									<tr>
										<td>boardfile </td>
										<td>
											<div>
												<a class="btn btn-sm btn-light" href="${pageContext.request.contextPath}/admin/addBoardfile?boardId=${boardMap.boardId}">파일추가</a>
											</div>
											<!-- 보드파일 출력하는 코드 구현(반복문) -->
											<c:forEach var="f" items="${boardfileList}">
												<div>
													<a href="${pageContext.request.contextPath}/resource/${f.boardfileName}">${f.boardfileName}</a>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/removeBoardfile?boardfileId=${f.boardfileId}&boardId=${f.boardId}&boardfileName=${f.boardfileName}"><i class="fa fa-trash"></i></a>
												</div>
											</c:forEach>
										</td>
									</tr>
								</tbody>
		</table>
		<a class="btn btn-light" href="${pageContext.request.contextPath}/admin/modifyBoard?boardId=${boardMap.boardId}">수정</a>
		<a class="btn btn-light" href="${pageContext.request.contextPath}/admin/removeBoard?boardId=${boardMap.boardId}">삭제</a>
		<a class="btn btn-light" href="${pageContext.request.contextPath}/admin/getBoardList">목록</a>
		<hr>
		<h4>Comment</h4>
		${commentList.size()} 개의 댓글이 있습니다.
		<form id="deleteCommentForm" action="${pageContext.request.contextPath}/admin/removeComment" method="post">
			<table class="table">
				<tr>
					<td style="width:50%; vertical-align:middle">내용</td>
					<td style="width:20%; vertical-align:middle">이름</td>
					<td style="width:20%; vertical-align:middle">등록일</td>
					<td style="width:10%; vertical-align:middle"></td>
				</tr>
				<c:forEach var="c" items="${commentList}">
					<input type="text" hidden="hidden" name="commentId"
						value="${c.commentId}">
					<input type="text" hidden="hidden" name="boardId"
						value="${boardMap.boardId}">
					<tr>
						<td style="width:50%; vertical-align:middle">${c.commentContent}</td>
						<td style="width:20%; vertical-align:middle">${c.username}</td>
						<td style="width:20%; vertical-align:middle">${c.insertDate}</td>
						<td style="width:10%; vertical-align:middle"><button type="button" id="btn" class="btn mb-1 btn-sm btn-outline-danger"><i class="fa fa-trash"></i></button></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<div>
			<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/addComment?boardId=${boardMap.boardId}">댓글등록</a>
		</div>
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

    <script src="../static/plugins/validation/jquery.validate.min.js"></script>
    <script src="../static/plugins/validation/jquery.validate-init.js"></script>
</body>
</html>