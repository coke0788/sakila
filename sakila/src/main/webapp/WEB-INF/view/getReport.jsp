<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Report</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="../static/images/favicon.png">
<!-- Custom Stylesheet -->
<link rel="stylesheet" href="../static/plugins/chartist/css/chartist.min.css">
<link rel="stylesheet" href="../static/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
<link href="../static/css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
$(document).ready(function(){
	$('#logoutBtn').click(function(){
		console.log('logout!');
		$('#logout').submit();
	});
	let a = []
	let b = []
	let c = []
	let d = []
	let e = []
	let f = []
	let x = []
	let y = []
	$.ajax({
		type: 'get',
		url: '/admin/getCategorySales',
		success: function(category){
			$(category).each(function(index, item){ 
				x.push(item.category);
				y.push(item.totalSales);
			});
			var categoryReport = new Chart(document.getElementById('categoryReport'), config);
		}
	});
	let data = {
			  labels: x,
			  datasets: [{
			    label: 'Sales by Category',
			    data: y,
			    backgroundColor: [
			      'rgba(255, 99, 132, 0.2)',
			      'rgba(255, 159, 64, 0.2)',
			      'rgba(255, 205, 86, 0.2)',
			      'rgba(75, 192, 192, 0.2)',
			      'rgba(54, 162, 235, 0.2)'
			    ],
			    borderColor: [
			      'rgb(255, 99, 132)',
			      'rgb(255, 159, 64)',
			      'rgb(255, 205, 86)',
			      'rgb(75, 192, 192)',
			      'rgb(54, 162, 235)'
			    ],
			    borderWidth: 1
			  }]
			};
	const config = {
			  type: 'bar',
			  data: data,
			  options: {
			    scales: {
			      y: {
			        beginAtZero: true
			      }
			    }
			  },
			};
	$.ajax({
		type: 'get',
		url: '/admin/getStoreSales',
		success: function(store){
			$(store).each(function(index, item){ 
				a.push(item.store);
				b.push(item.totalSales);
			});
			var storeReport = new Chart(document.getElementById('storeReport'), config2);
		}
	});
	let data2 = {
			labels: a,
			  datasets: [{
			    label: 'Sales by Store',
			    data: b,
			    backgroundColor: [
			      'rgb(255, 99, 132)',
			      'rgb(54, 162, 235)'
			    ],
			    hoverOffset: 4
			  }]
			};
	const config2 = {
			  type: 'doughnut',
			  data: data2,
			  options: {
			    scales: {
			      b: {
			        beginAtZero: true
			      }
			    }
			  },
			};
	$.ajax({
		type: 'get',
		url: '/admin/getBestSeller',
		success: function(bestSeller){
			$(bestSeller).each(function(index, item){ 
				c.push(item.title);
				d.push(item.totalSales);
			});
			var bestSeller = new Chart(document.getElementById('bestSeller'), config3);
		}
	});
	let data3 = {
			  labels: c,
			  datasets: [{
			    data: d,
			    label: 'Best Seller Film',
			    backgroundColor: [
			      'rgba(255, 99, 132, 0.2)',
			      'rgba(255, 159, 64, 0.2)',
			      'rgba(255, 205, 86, 0.2)',
			      'rgba(75, 192, 192, 0.2)',
			      'rgba(54, 162, 235, 0.2)'
			    ],
			    borderColor: [
			      'rgb(255, 99, 132)',
			      'rgb(255, 159, 64)',
			      'rgb(255, 205, 86)',
			      'rgb(75, 192, 192)',
			      'rgb(54, 162, 235)'
			    ],
			    borderWidth: 1
			  }]
			};
	const config3 = {
			  type: 'bar',
			  data: data3,
			  options: {
			    scales: {
			      y: {
			        beginAtZero: true
			      }
			    }
			  },
			};
	$.ajax({
		type: 'get',
		url: '/admin/getMonthlySales',
		success: function(monthlySales){
			$(monthlySales).each(function(index, item){ 
				e.push(item.month);
				f.push(item.totalSales);
			});
			var monthlySales = new Chart(document.getElementById('monthlySales'), config4);
		}
	});
	let data4 = {
	  labels: e,
	  datasets: [{
	    label: 'Monthly Sales',
	    data: f,
	    fill: false,
	    borderColor: 'red',
	    tension: 0.1
	  }]
	};
	const config4 = {
			  type: 'line',
			  data: data4,
			};
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
            Header start
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
            Header end ti-comment-alt
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
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Sales by Store</h4>
                                <canvas id="storeReport" class="ct-chart ct-golden-section"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Sales by Category</h4>
                                <canvas id="categoryReport" class="ct-chart ct-golden-section"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Best Seller</h4>
                                <canvas id="bestSeller" class="ct-chart ct-golden-section"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Monthly Sales</h4>
                                <canvas id="monthlySales" class="ct-chart ct-golden-section"></canvas>
                            </div>
                        </div>
                    </div>
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
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="../static/plugins/common/common.min.js"></script>
    <script src="../static/js/custom.min.js"></script>
    <script src="../static/js/settings.js"></script>
    <script src="../static/js/gleek.js"></script>
    <script src="../static/js/styleSwitcher.js"></script>

    <script src="../static/plugins/chartist/js/chartist.min.js"></script>
    <script src="../static/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
    <script src="../static/js/plugins-init/chartist.init.js"></script>

</body>

</html>