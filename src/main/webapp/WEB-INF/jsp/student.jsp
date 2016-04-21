<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Home Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<style>
table, th, td {
	border: 1px solid white;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
	text-align: left;
}

table#t01 {
	width: 100%;
	background-color: #f1f1c1;
}
</style>
</head>
<body background="img4.jpg">
	<div class="container">
		<div class="breadcrumb"></div>
		<h4>
			<a href="home.html" role="button" style="float: right; color: tan;">Logout
			</a><a href="addApplication.html?sid=${id}" role="button"
				style="float: left; color: tan;">New Application </a>
		</h4>
		
		<h2 class="text-center" style="color: tan;">Welcome</h2>
		<br />


		<p class="text-center" style="color: tan;">Here are your
			applications</p>
		<table style="width: 50%; color: white;" align="center">
			<tr>
				<th style="text-align: center; color: tan;">Date Submitted</th>
				<th style="text-align: center; color: tan;">Department</th>
				<th style="text-align: center; color: tan;">Program</th>
				<th style="text-align: center; color: tan;">Term</th>
				<th style="text-align: center; color: tan;">Status</th>
				<th></th>
			</tr>
			<c:forEach items="${applist}" var="app">
				<c:forEach items="${app.application}" var="i">
					<tr>
						<td><fmt:formatDate pattern="M/d/yyyy" value="${i.date}"/></td>
						<td>${i.department.department}</td>
						<td>${i.program.program}</td>
						<td>${i.term}</td>
						<td>${i.applicationStatus}</td>
						<c:if test="${i.applicationStatus == 'Not Submitted'}">
							<td><a href="viewApplication.html?id=${i.application_id }&sid=${id}"
								style="color: tan;">View</a> | <a href="editApplication.html?id=${i.application_id }&sid=${id}" style="color: tan;">Edit</a></td>
						</c:if>
						<c:if test="${i.applicationStatus != 'Not Submitted'}">
							<td><a
								href="viewApplication.html?id=${i.application_id }&sid=${id}"
								style="color: tan;">View</a></td>
						</c:if>
					</tr>

				</c:forEach>
			</c:forEach>
		</table>
	</div>
</body>
</html>