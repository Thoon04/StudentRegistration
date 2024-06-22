<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="<c:url value="/resources/test.css"/> ">
        

        <link rel="stylesheet" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>" >
    
    	
        <title>Insert title here</title>
</head>
<body>
        <jsp:include page="index.jsp"></jsp:include>
<div class="main_contents">
    <div id="sub_content">
        <form:form action="/student_registration/adduser" method="post" modelAttribute="user" id="af-form">
            <h2 class="col-md-6 offset-md-2 mb-5 mt-4">User Registration</h2>
            <div class="row mb-4">
                <label for="userName" class="col-md-2 col-form-label">Name</label>
                <div class="col-md-4">
                    <form:input type="text" class="form-control" path="userName" id="userName"   />
                </div>
            </div>
            <div class="row mb-4">
                <label for="userEmail" class="col-md-2 col-form-label">Email</label>
                <div class="col-md-4">
                    <form:input type="userEmail" class="form-control" path="userEmail" id="userEmail"   />
                </div>
            </div>
            <div class="row mb-4">
                <p style="color:red;"><form:errors path="*" /></p>
                <label for="password" class="col-md-2 col-form-label">Password</label>
                <div class="col-md-4">
                    <form:password class="form-control" path="password" id="password"   />
                </div>
            </div>
            <div class="row mb-4">
                <label for="confirmPassword" class="col-md-2 col-form-label">Confirm Password</label>
                <div class="col-md-4">
                    <form:password class="form-control" path="confirmPassword" id="confirmPassword"    />
                </div>
            </div>
            <div class="row mb-4">
                <label for="role" class="col-md-2 col-form-label">User Role</label>
                <div class="col-md-4">
                    <form:select class="form-select" path="userRole" id="userRole" value="" required="true">
                        <form:option value="admin">Admin</form:option>
                        <form:option value="user">User</form:option>
                    </form:select>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-4"></div>
                <div class="col-md-6">
                    <button type="submit" class="btn btn-secondary col-md-2">Add</button>
                </div>
            </div>
        </form:form>
    </div>
</div>
</body>
</html>