<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="index.jsp"></jsp:include>
	
	<h4>Student Update Information</h4>
		
	
	<form:form action="/student_registration/editstudent" method="post"  modelAttribute="student">
	<div class="alert alert-danger col-sm-5">${error_msg}</div>
	<div class="container">
	<div class=mb-4>
		
		<form:input type="hidden"  class="form-control" path='id'></form:input>
		</div>
		
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
                        <form:radiobutton path="gender" id="genderMale" value="Male" checked="true" /> 
                        <label for="genderMale">Male</label>
                    </div>
                    <div class="form-check-inline">
                        <form:radiobutton path="gender" id="genderFemale" value="Female" />
                        <label for="genderFemale">Female</label>
                    </div>
                </div>
            </fieldset>
            
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="education" class="col-md-2 col-form-label">Education</label>
                <div class="col-md-4">
                    <form:select path="education" class="form-select" id="education" required="true">
                        <form:option value="Bachelor of Information Technology">Bachelor of Information Technology</form:option>
                        <form:option value="Diploma in IT">Diploma in IT</form:option>
                        <form:option value="Bachelor of Computer Science">Bachelor of Computer Science</form:option>
                    </form:select>
                </div>
            </div>

			<div class="row mb-4">
				<div class="col-md-2"></div>
				<form:label path='phone' class="col-md-2 col-form-label">Phone</form:label>
				<div class="col-md-4">
					<form:input type="text" class="form-control" path='phone' value="+95 "></form:input>
				</div>
			</div>
			<fieldset class="row mb-4">
                <div class="col-md-2"></div>
                <legend class="col-form-label col-md-2 pt-0">Attend</legend>
                <div class="col-md-4">
                    <c:forEach items="${courseList}" var="course">
                        <div class="form-check-inline col-md-2">
                            <form:checkbox path="attend" id="${course.id}" value="${course.name}" />
                            <label for="${course.id}">${course.name}</label>
                        </div>
                    </c:forEach>
                </div>
            </fieldset>
            <div class="row mb-4">
        <div class="col-md-2"></div>
        <label for="photo" class="col-md-2 col-form-label">Photo</label>
        <div class="col-md-4">
            <input type="file" class="form-control" id="photo1" name="photo1" accept="image/**" multiple />
        </div>
    </div>
		</form:form>
</body>
</html>