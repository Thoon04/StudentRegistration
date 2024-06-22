<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="<c:url value="/resources/test.css"/> ">
        <link rel="stylesheet" href="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>" 
         integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <link rel="stylesheet" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>" >
    
    	<script src="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"/>"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    
        <title>User Registration</title>
</head>
<body>
	<%@ include file="index.jsp" %>
	<div class="container">
		<div class="main_contents">
    		<div id="sub_content">
       			 <form:form class="row g-3 mt-3 ms-2" action="/student_registration/adduser" method="get"  modelAttribute="user">
			            <div class="col-auto">
			                <form:label path='userId' for="staticEmail2" class="visually-hidden">User Id</form:label>
			                <form:input type="text" class="form-control" id="staticEmail2" placeholder="User ID" path='userId'/>
			            </div>
			            <div class="col-auto">
			                <form:label path='userName' for="inputPassword2" class="visually-hidden">User Name</form:label>
			                <form:input type="text" class="form-control" id="inputPassword2" placeholder="User Name" path='userName'/>
			            </div>
			    
			            <div class="col-auto">
			                <button type="submit" class="btn btn-primary mb-3" >Search</button>
			            </div>
			            <div class="col-auto">
			            
			            	<button type="submit" class="btn btn-secondary " onclick="location.href ='USR001.html';">Add</button>
			            
			            </div>
			            
			            <div class="col-auto">
			                <button type="submit" class="btn btn-danger mb-3" >Reset</button>
			            </div>
			        </form:form>
    
			        <table class="table table-striped" id="stduentTable">
			            <thead>
			                <tr>
			                    <th scope="col">User ID</th>
			                    <th scope="col">User Name</th>
			                    <th scope="col">Details</th>
			                    
			                </tr>
			            </thead>
			            <tbody>
			                <tr>
			                    <td>USR001</td>
			                    <td>Harry</td>
			                    
			                <td>
			                    <input type="submit" class="btn btn-success  " onclick="location.href = 'USR002.html';" value="Update"/>
			                </td>
			                <td><input type="submit" class="btn btn-secondary mb-3" data-bs-toggle="modal"
			                    data-bs-target="#exampleModal" value="Delete"/></td>
			    
			                </tr>
			                <tr>
			                    <td>USR002</td>
			                    <td>John</td>
			                <td>
			                    <input type="submit" class="btn btn-success  " onclick="location.href = 'USR002.html';" value="Update"/>
			                </td>
			                <td><input type="submit" class="btn btn-secondary mb-3" data-bs-toggle="modal"
			                    data-bs-target="#exampleModal" value="Delete"/></td>
			    
			                </tr>
			    
			                <tr>
			                    <td>USR003</td>
			                    <td>Bryce</td>
			                    
			                <td>
			                    <input type="submit" class="btn btn-success  " onclick="location.href = 'USR002.html';" value="Update"/>
			                </td>
			                <td> <input type="submit" class="btn btn-secondary mb-3" data-bs-toggle="modal"
			                    data-bs-target="#exampleModal" value="Delete"/></td>
			                </tr>
			    
			            </tbody>
			        </table>
			    
			        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			            <div class="modal-dialog modal-dialog-centered">
			                <div class="modal-content">
			                    <div class="modal-header">
			                        <h5 class="modal-title" id="exampleModalLabel">Student Deletion</h5>
			                        <input type="submit" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
			                    </div>
			                    <div class="modal-body">
			                        
			                         <h5 style="color: rgb(127, 209, 131);">Are you sure want to delete !</h5>
			                    </div>
			                    <div class="modal-footer">
			                        <input type="submit" class="btn btn-success col-md-2" data-bs-dismiss="modal" value="Ok">
			    
			                    </div>
			                </div>
			            </div>
			        </div>
    		</div>
		</div>
	</div>

</body>
</html>