<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Departments List</title>
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
	<!-- <nav class="navbar navbar-default navbar-fixed-top">
 -->	<div class="container">

		<div class="text-center">
		<div class="breadcrumb"><p style="text-align:right">Admin Logged In</p></div>
			<h4><a href="home.html" role="button" style="float:right; color:tan;" >Logout </a><a href="addDepartment.html" role="button" style="float:left; color:tan;" >Add New Department </a></h4><br><br>
			
			<h2 style=" color:tan;">List of Departments </h2>
		</div>
		<br><br>
		


	<table style="width:50%; color:white;" align="center" >
		<tr>
			<!-- <th>Department Id</th> -->
			<th style="text-align:center; color:tan;">Name</th>
			<th style="text-align:center; color:tan;">Number of Programs</th>
			<th></th>
		</tr>
		<c:forEach items="${list}" var="list">
			<tr>
				<%-- <td class="col-sm-1">${list.department_id }</td> --%>
				<td class="col-sm-3">${list.department }</td>
				<td class="col-sm-1">${fn:length(list.programs) }</td>
				<td class="col-sm-1"><a
					href="view.html?id=${list.department_id}" style="color:tan;">View</a> | <a
					href="edit.html?id=${list.department_id}"  style="color:tan;">Edit</a></td>
			</tr>
		</c:forEach>

	</table>
	
</div>
	<!-- </nav>
 -->
</body>
</html>