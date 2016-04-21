<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Application</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script>
	function populateProgram() {
		var dept = $('#department').val();
		$('#program').html(
				'<option value=' + $('#pgmid').val() + '>' + $('#pgm').val()
						+ '</option>');

		$.ajax({
			type : "GET",
			url : "getdept.html?id=" + dept + "&pgm=" + $('#pgm').val(),
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
		/* var cell5 = row.insertCell(4); */
		cell1.innerHTML = "<input type='text' name='college"+educount+"' class='form-control' placeholder='College/University' />";
		cell2.innerHTML = "<input type='text' name='time"+educount+"' class='form-control' placeholder='Time Period Attended' />";
		cell3.innerHTML = "<input type='text' name='degreeEarned"+educount+"' class='form-control' placeholder='Degree Earned' />";
		cell4.innerHTML = "<input type='text' name='major"+educount+"' class='form-control' placeholder='Major' />";
		/* cell5.innerHTML = "<input type='button' value='Remove' class='btn btn-primary btn-md danger' />"; */
		document.getElementById("educount").value = educount;
	}
</script>
<script>
	$(document).ready(function() {
		$("#edutable td").click(function() {

			var column_num = parseInt($(this).index()) + 1;
			var row_num = parseInt($(this).parent().index()) + 1;
			if (column_num == 5) {
				eduremove(row_num);
			}
			
		});
	});

	function eduremove(row) {
		document.getElementById("edutable").deleteRow(row - 1);
	}
</script>
<script>
var rmvarr = [];
var rmvcount = 0;
function rmv(id){
	rmvcount++;
	rmvarr.push(id);
	document.getElementById("educount1").value=rmvcount;
	document.getElementById("eduarr").value=rmvarr;
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
<body background="img4.jpg" onload="populateProgram()">
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
			<h2 style="text-align: center; color: tan;">Edit Application</h2>
		</div>

		<br />

		<form class="form-horizontal" action="editApplication.html"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="app" id="app" value="${param.id}" /> <input
				type="hidden" name="sid" id="sid" value="${param.sid }" />
				
				<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">First
					Name</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="firstname"
						placeholder="First Name" value="${app.firstname}" required/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">Last
					Name</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="lastname"
						placeholder="Last Name" value="${app.lastname}" required/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">Email</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="email"
						placeholder="Email" value="${app.email}" required/>
				</div>
			</div>
			<div class="form-group" id="div1">
				<label class="col-sm-9 " style="color: tan; text-align: center;">Department:
					<font color="white"> ${app.department.department}</font>
				</label> <input type="hidden" name="department" id="department"
					value="${app.department.department_id}" />
			</div>

			<div class="form-group">
				<input type="hidden" name="pgm" id="pgm"
					value="${app.program.program}" /> <input type="hidden"
					name="pgmid" id="pgmid" value="${app.program.program_id }" /> <label
					class="col-sm-4 control-label" style="color: tan;">Program</label>
				<div class="col-sm-4">
					<select class="form-control" id="program" name="program">

					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">Term</label>
				<div class="col-sm-4">
					<input type="text" name="term" class="form-control"
						placeholder="Term" value="${app.term}" required />
				</div>
			</div>
			<br />

			<div class="text-center" id="ediv">
				<h2 style="text-align: center; color: tan;">Educational
					Background</h2>
			</div>

			<table style="width: 65%; color: white;" align="center" id="edutable"
				name="edutable" class="edutable">
				<tr>
					<th style="color: tan;">College/University</th>
					<th style="color: tan;">Time Period Attended</th>
					<th style="color: tan;">Degree Earned</th>
					<th style="color: tan;">Major</th>
				</tr>

				<c:forEach items="${app.degree}" var="degree">
					<c:if test="${not empty degree.degree }">
						<tr>
							<td width="25%"><input type="text"
								name="college${degree.degree_id}" class="form-control"
								placeholder="College/University" value="${degree.university}"
								disabled /></td>
							<td width="25%"><input type="text"
								name="time${degree.degree_id}" class="form-control"
								placeholder="Time Period Attended" value="${degree.time_period}"
								disabled /></td>
							<td width="25%"><input type="text"
								name="degreeEarned${degree.degree_id}" class="form-control"
								placeholder="Degree Earned" value="${degree.degree}" disabled /></td>
							<td width="25%"><input type="text"
								name="major${degree.degree_id}" class="form-control"
								placeholder="Major" value="${degree.major}" disabled /></td>
							<td><input type="button" value="Remove"
								onClick="rmv(${degree.degree_id})"
								class="btn btn-primary btn-md danger" /></td>
						</tr>
					</c:if>
				</c:forEach>
			</table>

			<input type="hidden" name="educount" id="educount" value="0" /> <input
				type="hidden" name="educount1" id="educount1" value="0" /> <input
				type="hidden" name="eduarr" id="eduarr" /> <input type="button"
				value="Add More" onClick="add();"
				class="btn btn-primary btn-md active col-sm-offset-9" />

			<div class="text-center">
				<h2 style="text-align: center; color: tan;">Academic Details</h2>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">TOEFL</label>
				<div class="col-sm-4">
					<input type="text" name="toefl" class="form-control"
						placeholder="TOEFL" value="${app.toefl}" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">GRE</label>
				<div class="col-sm-4">
					<input type="text" name="gre" class="form-control"
						placeholder="GRE" value="${app.gre}" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">GPA</label>
				<div class="col-sm-4">
					<input type="text" name="gpa" class="form-control"
						placeholder="GPA" value="${app.gpa}" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label" style="color: tan;">Transcript</label>
				<div class="col-sm-4">
					<a href="/gapp/download.html?sid=${param.sid}&aid=${param.id}"
						style="color: tan;">View</a>
					<p style="color: red;">or</p>
					<input type="file" name="file" style="color: tan;" />
					<!-- <input
						type="submit" name="upload" value="Upload" /> -->
				</div>
			</div>
		 <input style="margin-left: 700px;" type="submit" value="Save" name="submit"
				class="btn btn-primary active col-sm-offset-4" /> <input style="margin-left: 20px;"
				type="submit" value="Submit" name="submit"
				class="btn btn-success active col-sm-offset-7" />

		</form>

	</div>

</body>
</html>