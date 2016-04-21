<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Department Details</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<script type="text/javascript" src="jquery-1.3.2.min.js"></script>
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
<script>
	var count = 0;
	function add_program() {
		var form = document.getElementsByTagName('form')[0], input = document
				.createElement('input');

		count++;
		var a = document.getElementById("div3");
		var mybr = document.createElement('br');
		var b = document.getElementById("newProgramCount")
		b.setAttribute("value", count);
		
		var label = document.createElement("Label");
		label.innerHTML = "New Label";
		label.setAttribute("style", "font-weight:normal");
		
		input.setAttribute('type', 'text');
		/* input.setAttribute('width', '100px')
		input.setAttribute('margin', 'auto'); */
		input.setAttribute('name', 'newProgram' + count);
		input.setAttribute('label', 'Program');
		input.setAttribute('placeholder', 'Program')
		//	input.setAttribute('class', 'form-horizontal')
		input.setAttribute('class', 'form-control')
		//input.setAttribute('class', 'col-sm-3')
		input.setAttribute('style', 'width:300px;')
		//input.setAttribute('b', 'count')
		
		form.insertBefore(input, a)
		form.insertBefore(mybr, input)
		form.insertBefore(mybr, a)

	};
</script>
<script>
	var countAdd = 0;
	function add_additionField() {
		var form = document.getElementsByTagName('form')[0], input = document
				.createElement('input');
		countAdd++;
		var a = document.getElementById("div4");
		var mybr = document.createElement('br');
		var b = document.getElementById("newFieldCount")
		b.setAttribute("value", countAdd);
		input.setAttribute('type', 'text');
		input.setAttribute('name', 'newAdditionalRequirements' + countAdd);
		input.setAttribute('placeholder', 'Additional Requirement')
		//	input.setAttribute('class', 'form-horizontal')
		input.setAttribute('class', 'form-control')
		//input.setAttribute('class', 'col-sm-3')
		input.setAttribute('style', 'width:300px;')
		form.insertBefore(input, a)
		form.insertBefore(mybr, input)
		form.insertBefore(mybr, a)

	};
</script>

<script>
	var pgmcounter = 0;
	var pgmlist = [];
	function rmv(id) {
		pgmcounter++;		
		pgmlist.push(id);
	
		document.getElementById("pgmcount").value=pgmcounter;
	 	document.getElementById("rmvpgm").value=pgmlist; 
		var button = document.getElementById('remove' + id);
		var box = document.getElementById('box' + id);
		button.remove();
		box.remove();
	}
</script>
<script>
	var fieldcounter =0;
	var fieldlist = [];
	function rmvfld(id){
		
		fieldcounter++;
		fieldlist.push(id);
		document.getElementById("fieldcount").value=fieldcounter;
		document.getElementById("rmvfield").value=fieldlist;
		var fbutton = document.getElementById('fremove'+id);
		var  fbox = document.getElementById('fbox'+id);
		fbutton.remove();
		fbox.remove();
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
			<a href="home.html" role="button" style="float: right; color: tan;">Logout
			</a>
		</h4>
		<h2 style="text-align: center; color: tan;">Edit Department</h2>



		<br />

		<form class="form-horizontal" action="edit.html" method="post">
			<input type="hidden" name="id" value="${dept.department_id }" />
			<div class="form-group" id="div1">
				<label class="col-sm-4 control-label" style="color: tan;">Department
					Name</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="deptName"
						value="${dept.department }" placeholder="Department Name" />
				</div>
			</div>

			<div class="form-group" id="div2">
				<label class="col-sm-4 control-label" style="color: tan;">Program</label>
				<input type="hidden" id="newProgramCount" name="newProgramCount"
					value="" />
				<c:if test="${fn:length(dept.programs) == 0}">
					<span> <input type="text" class="form-control"
						name="program" id="program" placeholder="Program" /></span>
				</c:if>
				<div class="col-sm-3" id="div">
					<c:if test="${fn:length(dept.programs) > 0}">
						<c:forEach items="${dept.programs}" var="pgm">
							<!-- 	<label class="col-sm-4 control-label" style="color: tan;">Program</label> -->
							<input type="hidden" value="${pgm.program_id }" name="pgmid"
								id="pgmid" />
							<!-- <label class="col-sm-4 control-label" style="color: tan;">Program</label> -->
							<input id="box${pgm.program_id}" type="text" class="form-control"
								name="program" placeholder="Program" value="${pgm.program }" />
							<input type="button" class="remove"
								onclick="rmv(${pgm.program_id})" value="Remove"
								id="remove${pgm.program_id}" />
							<br />
							<br />
						</c:forEach>
					</c:if>
					<input type="hidden" name="pgmcount" id="pgmcount" value="0" /> <input
						type="hidden" name="rmvpgm" id="rmvpgm" />
				</div>
				<input type="button" onClick="add_program();"
					value="Add another program" />


			</div>




			<div class="form-group" id="div3">
				<label class="col-sm-4 control-label" style="color: tan;">Additional
					Requirements</label> <input type="hidden" id="newFieldCount"
					name="newFieldCount" value="" /><span class="col-sm-3"> <c:if
						test="${fn:length(dept.addField) == 0}">
						<input type="text" class="form-control"
							name="additionalRequirements"
							placeholder="Additional Requirement" />
					</c:if> <c:if test="${fn:length(dept.addField) > 0}">
						<c:forEach items="${dept.addField}" var="field">
							<input type="hidden" name="fieldid" value="${field.field_id}">
							<input type="text" class="form-control"
								id="fbox${field.field_id}"
								name="additionalRequirements${field.field_id}"
								value="${field.field_name}" />
							<input type="button" onclick="rmvfld(${field.field_id})"
								value="Remove" id="fremove${field.field_id}" />
							<br />

						</c:forEach>
					</c:if> <input type="hidden" name="fieldcount" id="fieldcount" value="0" />
					<input type="hidden" name="rmvfield" id="rmvfield" value="0" /> 
			</div>

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



			<div class="form-group" id="div4">
				<input type="Submit"
					class="btn btn-primary btn-lg active col-md-offset-6" value="Save" />
			</div>
		</form>


	</div>


</body>
</html>