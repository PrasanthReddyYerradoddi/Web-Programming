<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New Application</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>

<script>
	function populateProgram() {
		var dept = $('#department').val();
		$('#program').html('<option value="">Select One</option>');

		$.ajax({
			type : "GET",
			url : "getdepartment.html?id=" + dept,
			async : false,
			success : function(data) {
				$('#program').append(data);

			}

		});

	}
</script>

<script>
	var educount = 0;
	function add() {
		educount++;
		var table = document.getElementById("edutable");
		var row = table.insertRow(1);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);
		var cell4 = row.insertCell(3);
		cell1.innerHTML = "<input type='text' name='college"+educount+"' class='form-control' placeholder='College/University' />";
		cell2.innerHTML = "<input type='text' name='time"+educount+"' class='form-control' placeholder='Time Period Attended' />";
		cell3.innerHTML = "<input type='text' name='degreeEarned"+educount+"' class='form-control' placeholder='Degree Earned' />";
		cell4.innerHTML = "<input type='text' name='major"+educount+"' class='form-control' placeholder='Major' />";
		document.getElementById("educount").value = educount;
	}
</script>
<script>
	var fieldcount = 0;
	function addfield() {
		fieldcount++;
		var table = document.getElementById("infotable");
		var row = table.insertRow(1);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		cell1.innerHTML = "<input type='text' name='name"+fieldcount+"' class='form-control' placeholder='Ex: GMAT ' />";
		cell2.innerHTML = "<input type='text' name='score"+fieldcount+"' class='form-control' placeholder='Ex: 100 or 200' />";
		document.getElementById("nhidden").value = fieldcount;
	}
</script>
<script>
	var filecount = 0;
	function addfile() {
		filecount++;
		var table = document.getElementById("infotable");
		var row = table.insertRow(1);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		cell1.innerHTML = "<input type='name' name='fupload"+filecount+"' class='form-control' placeholder='Ex: SOP ' />";
		cell2.innerHTML = "<input type='file' name='file2' style='color: tan;' />";
		document.getElementById("fhidden").value = filecount;
	}
</script>
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
	width: 27%;
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


			<h4>
				<a href="home.html" role="button" style="float: right; color: tan;">Logout
				</a>
				<h5>
					<a href="student.html?id=${param.sid}" role="button"
						style="float: left; color: tan;">Back</a>
				</h5>

			</h4>
			<h2 style="text-align: center; color: tan;">New Application</h2>
		</div>

		<form class="form-horizontal" action="addApplication.html"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="sid" value="${param.sid }" />

			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">First
					Name*</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="firstname"
						placeholder="First Name" value="${user.first_name}" required />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">Last
					Name*</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="lastname"
						placeholder="Last Name" value="${user.last_name}" required />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">Email*</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="email"
						placeholder="Email" value="${user.email}" required />
				</div>
			</div>


			<div class="form-group">
				<%--   <c:forEach items="${deptList}" var="depts"> --%>
				<input type="hidden" value="${deptList}" id="deptList" />
				<%-- </c:forEach>   --%>

				<c:forEach items="${pgmList}" var="pgms">
					<input type="hidden" value="${pgms}" id="pgmList" />
				</c:forEach>

				<label class="col-sm-4 control-label" style="color: tan;">Department*</label>
				<div class="col-sm-4">
					<select required="required" class="form-control" id="department"
						name="department" onchange="populateProgram()">
						<option value="">Select One</option>
						<c:forEach items="${deptList}" var="depts">
							<option value="${depts.department_id}">${depts.department}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">Program*</label>
				<div class="col-sm-4">
					<select required="required" class="form-control" id="program"
						name="program">
						<option>Select One</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">Term*</label>
				<div class="col-sm-4">
					<input type="text" name="term" class="form-control"
						placeholder="Term" required />
				</div>
			</div>
			<br />

			<div class="text-center">
				<h2 style="text-align: center; color: tan;">Academic Details</h2>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">TOEFL</label>
				<div class="col-sm-4">
					<input type="text" name="toefl" class="form-control"
						placeholder="TOEFL" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">GRE</label>
				<div class="col-sm-4">
					<input type="text" name="gre" class="form-control"
						placeholder="GRE" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">GPA</label>
				<div class="col-sm-4">
					<input type="text" name="gpa" class="form-control"
						placeholder="GPA" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">Transcript*</label>
				<div class="col-sm-4">
					<input type="file" required name="file" style="color: tan;" />
					<!-- <input
						type="submit" name="upload" value="Upload" /> -->
				</div>
			</div>
			<br />

			<div class="text-center" id="ediv">
				<h2 style="text-align: center; color: tan;">Educational
					Background</h2>
			</div>


			<table style="width: 65%; color: white;" align="center" id="edutable">
				<tr>
					<th style="color: tan;">College/University</th>
					<th style="color: tan;">Time Period Attended</th>
					<th style="color: tan;">Degree Earned</th>
					<th style="color: tan;">Major</th>
				</tr>


				<tr>
					<td width="25%"><input type="text" name="college"
						class="form-control" placeholder="College/University" /></td>
					<td width="25%"><input type="text" name="time"
						class="form-control" placeholder="Time Period Attended" /></td>
					<td width="25%"><input type="text" name="degreeEarned"
						class="form-control" placeholder="Degree Earned" /></td>
					<td width="25%"><input type="text" name="major"
						class="form-control" placeholder="Major" /></td>
				</tr>



			</table>
			<input type="hidden" name="educount" id="educount" value="0" /> <input
				type="button" value="Add More" onClick="add();"
				class="btn btn-primary btn-md active col-sm-offset-9" />

			<div class="text-center">
				<h2 style="text-align: center; color: tan;">Additional
					Information</h2>
			</div>

			<table style="width: 55%; color: white;" align="center"
				id="infotable">
				<tr>
					<th style="color: tan;">Name</th>
					<th style="color: tan;">Score or Attachment</th>
				</tr>

				<tr>
					<td><input type="text" name="name" class="form-control"
						placeholder="Ex: GMAT " /></td>
					<td><input type="text" name="score" class="form-control"
						placeholder="Ex: 100 or 200" /></td>
				</tr>

				<tr>
					<td><input type="text" name="fupload" class="form-control"
						placeholder="Ex: SOP" /></td>
					<td><input type="file" name="file1" style="color: tan;" /></td>
				</tr>

			</table>


			<input style="margin-left: 593px;" type="button"
				value="Add More Fields" onClick="addfield();"
				class="btn btn-primary active" /> <input style="margin-left: 20px;"
				type="button" value="Upload More Files" onClick="addfile();"
				class="btn btn-primary active" /> <input type="hidden"
				name="nhidden" id="nhidden" value="0" /> <input type="hidden"
				name="fhidden" id="fhidden" value="0" /><br /> <br /> <input
				style="margin-left: 730px;" type="submit" value="Save" name="submit"
				class="btn btn-primary  active " /> <input
				style="margin-left: 20px;" type="submit" value="Submit"
				name="submit" class="btn btn-success  active " />
		</form>
	</div>

</body>
</html>