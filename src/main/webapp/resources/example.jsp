<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id="sub_content">
		<form:form action="/student_registration/addstudent" method="post"  modelAttribute="student">

			<h2 class="col-md-6 offset-md-2 mb-5 mt-4">Student Registration</h2>
			<div class="row mb-4">
				<div class="col-md-2"></div>
				<form:label path='student_id' class="col-md-2 col-form-label">Student
				ID</form:label>
				<div class="col-md-4">
					<form:input type="text" class="form-control" value="STU001"
						path='student_id' disabled=""></form:input>
				</div>
			</div>
			<div class="row mb-4">
				<div class="col-md-2"></div>
				<form:label path='student_name' class="col-md-2 col-form-label">Name</form:label>
				<div class="col-md-4">
					<form:input type="text" class="form-control" path='student_name' value="Harry"></form:input>
				</div>
			</div>
			<div class="row mb-4">
				<div class="col-md-2"></div>
				<form:label path='dateofbirth' class="col-md-2 col-form-label">DOB</form:label>
				<div class="col-md-4">
					<form:input type="date" class="form-control" path='dateofbirth'></form:input>
				</div>
			</div>
			<fieldset class="row mb-4">
				<div class="col-md-2"></div>
				<legend class="col-form-label col-md-2 pt-0">Gender</legend>
				<div class="col-md-4">
					<div class="form-check-inline">
						<form:input class="form-check-input" type="radio" name="gridRadios"
							path='gridRadios1' value="option1" checked=""></form:input>
							<form:label
							class="form-check-label" path='gridRadios1'> Male </form:label>
					</div>
					<div class="form-check-inline">
						<form:input class="form-check-input" type="radio" name="gridRadios"
							path='gridRadios2' value="option2"></form:input>
							<form:label
							class="form-check-label" path='gridRadios2'> Female </form:label>
					</div>

				</div>
			</fieldset>

			<div class="row mb-4">
				<div class="col-md-2"></div>
				<form:label path='phone' class="col-md-2 col-form-label">Phone</form:label>
				<div class="col-md-4">
					<form:input type="text" class="form-control" path='phone' value="+95 "></form:input>
				</div>
			</div>
  </form:form>
	</div>
</body>
</html>