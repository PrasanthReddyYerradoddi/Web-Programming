<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add New Department</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<script>
	var programCount = 0;

	function addProgram() {
		programCount++;

		var table = document.getElementById("programTable");
		var row = table.insertRow(1);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);

		cell2.innerHTML = "<input type='text' name='program"+programCount+"' class='form-control' placeholder='Program' />";
		document.getElementById("programcount").value = programCount;
	}
</script>
<script>
	var fieldCount = 0;
	function addField() {
		fieldCount++;
		var table = document.getElementById("fieldTable");
		var row = table.insertRow(2);
		var cell1 = row.insertCell(0);
		var cell2 = row.insertCell(1);
		var cell3 = row.insertCell(2);

		cell1.innerHTML = "<input type='text' name='name"+fieldCount+"' class='form-control' placeholder='Name' />";
		cell2.innerHTML = "<select name='type"+fieldCount+"' class='form-control' > <option value='number'>Number</option> <option value='Text'>Text</option> <option value='File'>File</option> </select>"
		cell3.innerHTML = "<select name='required"+fieldCount+"' class='form-control' > <option value='Required'>Required</option> <option value='Optional'>Optional</option> </select>"
		document.getElementById("fieldcount").value = fieldCount;
	}
</script>


<style>
table, th, td {
	border: 1px solid rgba(0, 0, 0, 0);
	border-collapse: collapse;
}

th, td {
	padding: 5px;
	text-align: left; //
	color: white;
}

th {
	color: white;
}

table {
	width: 50%;
	background-color: rgba(0, 0, 0, 0);
}
</style>
</head>
<body background="img4.jpg">
	<div class="container">
		<div class="breadcrumb"></div>
		<h4>
			<h5>
				<a href="admin.html" role="button" style="float: left; color: tan;">Back</a>
			</h5>
			<a href="home.html" class="btn btn-link pull-right active"
				role="button">Logout </a>
		</h4>
		<br> <br>
		<h2 class="text-center" style="color: tan;">Add New Department</h2>
		<br />

		<form class="form-horizontal" action="addDepartment.html"
			method="post" id="form">
			<div class="form-group" id="div1">
				<label class="col-sm-4 control-label" style="color: tan;">Department
					Name</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="deptName"
						placeholder="Department Name" />
				</div>
			</div>

			<div class="form-group" id="div2">
				
			
				<table align="center" id="programTable">
					<tr>
						<th style="color: tan; width: 18%;">Program</th>
						<td style="width: 48%;"><input type="text" name="program"
							placeholder="Program" class="form-control" /></td>
						<td><input type="button" onClick="addProgram();"
							value="Add another program" /></td>
					</tr>
				</table>
				<input type="hidden" name="programcount" value="0" id="programcount" />
				<!-- </div> -->
			</div>

			<div class="form-group" id="div3">
			
				<h4 style="text-align: center; color: tan;">Additional
					Requirements</h4>
				<table align="center" id="fieldTable">
					<tr>
						<th style="color: tan; text-aling: center;">Name</th>
						<th style="color: tan">Type</th>
						<th style="color: tan">Required/Optional</th>

					</tr>
					<tr>
					<tr>
						<td width="25%"><input type="text" name="name"
							class="form-control" placeholder="Name" /></td>
						<td width="25%"><select name="type" class="form-control">
								<option value="Number">Number</option>
								<option value="Text">Text</option>
								<option value="File">File</option>
						</select></td>
						<td width="25%"><select name="required" class="form-control">
								<option value="Required">Required</option>
								<option value="Optional">Optional</option>
						</select></td>
						<td><input type="button" onClick="addField();"
							value="Add another field" /></td>

					</tr>

					</tr>
				</table>
				<input type="hidden" name="fieldcount" value="0" id="fieldcount" />

			</div>

			<div class="form-group" id="div4">
				<input type="Submit"
					class="btn btn-success btn-md active col-md-offset-6" value="Add" />
			</div>
		</form>

	</div>
</body>
</html>