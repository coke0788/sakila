<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Staff List</h1>
		<table>
			<thead>
				<tr>
					<th>SID</th>
					<th>Id</th>
					<th>name</th>
					<th>address</th>
					<th>phone</th>
					<th>city</th>
					<th>country</th>
				</tr>	
			</thead>
			<tbody>
				<c:forEach var="s" items="${staffList}">
				<tr>
					<td>${s.sid}</td>
					<td>${s.id}</td>
					<td>${s.name}</td>
					<td>${s.address}</td>
					<td>${s.phone}</td>
					<td>${s.city}</td>
					<td>${s.country}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
</body>
</html>