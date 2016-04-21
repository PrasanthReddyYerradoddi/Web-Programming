<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

</head>
<body background="img4.jpg">
	<a href="home.html" class="btn btn-primary pull-right active"
		role="button">Home Page </a>
	<c:if test="${login == 0 || login == 2 }">
		<a class="btn btn-primary btn-md active pull-right active"
			href="userRegistration.html" role="button">Register</a></c:if>
	<br/>
	<c:if test="${login == 1 }">
			<h4 class="text-center" style="color: tan;">Registration Success</h4>
		</c:if>
	<h2 class="text-center" style="color: tan;">Login</h2>
	<br />

	<form action="login.html" method="POST" class="form-horizontal">
	<c:if test="${login == 2 }">
			<h4 class="text-center" style="color: tan;">Email or Password Invalid!!!</h4>
		</c:if>
		<div class="form-group">
			<label class="col-lg-4 control-label" style="color: tan;">Email</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" name="email"
					placeholder="Email" value="${login == '2' ? email: ''}"/>
			</div>
		</div>

		<div class="form-group">
			<label class="col-lg-4 control-label" style="color: tan;">Password</label>
			<div class="col-sm-4">
				<input type="password" class="form-control" name="password"
					placeholder="Password" value="${login == '2' ? password: ''}"/>
			</div>
		</div>


		<input type="Submit"
			class="btn btn-success btn-sm active col-md-offset-7" value="Login">

	</form>
</body>
</html>