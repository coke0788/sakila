<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getBoardList" aria-expanded="false">
                            <i class="fa fa-clipboard"></i><span class="nav-text">Board List</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getFilmList" aria-expanded="false">
                            <i class="fa fa-clipboard"></i><span class="nav-text">Film List</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getStaffList" aria-expanded="false">
                            <i class="fa fa-clipboard"></i><span class="nav-text">Staff List</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getActorList" aria-expanded="false">
                            <i class="fa fa-clipboard"></i><span class="nav-text">Actor List</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getInventoryInfoList" aria-expanded="false">
                            <i class="fa fa-clipboard"></i><span class="nav-text">Inventory List</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/getCustomerList" aria-expanded="false">
                            <i class="fa fa-clipboard"></i><span class="nav-text">Customer List</span>
                        </a>
                    </li>
                    <li>
                        <a href="widgets.html" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
</body>
</html>