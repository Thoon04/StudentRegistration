<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="index.jsp"></jsp:include>
	<h3>Students Info</h3>
	
	<div class="container">
	<a href="/student_registration/addstudent">Add Student</a>
		<div class="row">
			<div class="col">id</div>
			<div class="col">Student Id</div>
			<div class="col">Student Name</div>
			<div class="col">Date of Birth</div>
			<div class="col">Gender</div>
			<div class="col">Phone</div>
			<div class="col">Education</div>
			<div class="col">Attend</div>
			
			
			
		</div>
		<c:forEach var="student" items="${students}">
			<div class="row">
				<div class="col">${student.id}</div>
				<div class="col">${student.student_id}</div>
				<div class="col">${student.student_name}</div>
				<div class="col">${student.dateofbirth}</div>
				<div class="col">${student.gender}</div>
				<div class="col">${student.phone}</div>
				<div class="col">${student.education}</div>
				<div class="col">${student.attend}</div>
				</div>
				
				<div class="col">
					<a href="editstudent/${student.id}">Update</a> ||
					<a href="deletestudent/${student.id}">Delete </a>
				</div>
		</c:forEach>
				
	</div>
</body>
</html>