<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Application</title>
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
	text-align: left; //
	color: white;
}

th {
	color: black;
	width: 50%;
}

table#t {
	width: 100%;
	background-color: white;
}
</style>
</head>
<body background="img4.jpg">
	<div class="container">

		<div class="text-center">
			<div class="breadcrumb"></div>


			<h4><a href="home.html" role="button" style="float: right; color: tan;">Logout
			</a>
				<h5>
					<a href="student.html?id=${param.sid}" role="button"
						style="float: left; color: tan;">Back</a>
				</h5>
				
			</h4>
			<h2 style="text-align: center; color: tan;">Application</h2>
		</div>


		<table style="width: 50%; color: white;" align="center">
			<tr>
				<th style="color: tan;">Application ID</th>
				<td>${param.id}</td>
			</tr>
			<tr>

				<th style="color: tan;">First Name</th>
				<td>${aid.firstname}</td>

			</tr>
			<tr>

				<th style="color: tan;">Last Name</th>
				<td>${ aid.lastname}</td>


			</tr>
			<tr>
				<th style="color: tan;">Gender</th>
				<td>${sid.gender}</td>
			</tr>

			<tr>
				<th style="color: tan;">Date of Birth</th>
				<td>${sid.dob}</td>
			</tr>

			<tr>
				<th style="color: tan;">Citizenship</th>
				<td>${sid.citizenship}</td>
			</tr>

			<tr>
				<th style="color: tan;">Phone Number</th>
				<td>${sid.phoneNumber}</td>
			</tr>

			<tr>
				<th style="color: tan;">Email</th>
				<td>${aid.email}</td>
			</tr>

			<tr>
				<th style="color: tan;">Department</th>
				<td>${aid.department.department}</td>
			</tr>

			<tr>
				<th style="color: tan;">Program</th>
				<td>${aid.program.program}</td>
			</tr>

			<tr>
				<th style="color: tan;">Term</th>
				<td>${aid.term}</td>
			</tr>

		</table>
		<div class="text-center">
			<h2 style="text-align: center; color: tan;">Educational
				Background</h2>
		</div>
		<table style="width: 50%; color: white;" align="center">
			<tr>
				<th style="color: tan;">College/University</th>
				<th style="color: tan;">Time Period Attended</th>
				<th style="color: tan;">Degree Earned</th>
				<th style="color: tan;">Major</th>
			</tr>

			<c:forEach items="${aid.degree}" var="degree">
				<tr>
					<td>${degree.university}</td>
					<td>${degree.time_period}</td>
					<td>${degree.degree}</td>
					<td>${degree.major}</td>
				</tr>
			</c:forEach>



		</table>
		<div class="text-center">
			<h2 style="text-align: center; color: tan;">Academic Records</h2>
		</div>
		<table style="width: 50%; color: white;" align="center">
			<tr>
				<th style="color: tan;">TOEFL</th>
				<td>${aid.toefl}</td>
			</tr>

			<tr>
				<th style="color: tan;">GRE</th>
				<td>${aid.gre}</td>
			</tr>

			<tr>
				<th style="color: tan;">GPA</th>
				<td>${aid.gpa}</td>
			</tr>
			<tr>
				<th style="color: tan;">Transcript</th>
				<td><a href="/gapp/download.html?sid=${param.sid}&aid=${param.id}" style="color:tan;">Download</a></td>
			</tr>

		</table>

		<div class="text-center">
			<h2 style="text-align: center; color: tan;">Additional
				Information</h2>
		</div>
		<table style="width: 50%; color: white;" align="center">
			<tr>
				<th style="color: tan;">Name</th>
				<th style="color: tan;">Value</th>
				<!-- <th style="color: tan;">LOR</th> -->
			</tr>


			<c:forEach items="${aid.additionalfields}" var="field">				
					<tr>
						<td>${field.field_name}</td>
						<c:if test="${not empty field.field_type}">
						<td>${field.field_type}</td>
						</c:if>
						<c:if test="${empty field.field_type}">
						<td><a href="/gapp/download1.html?sid=${param.sid}&aid=${param.id}" style="color:tan;">Download</a></td>
						</c:if>
					</tr>
			</c:forEach>


		</table>
	</div>

</body>
</html>