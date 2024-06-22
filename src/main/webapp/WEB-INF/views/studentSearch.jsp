<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="<c:url value="/resources/test.css"/> ">
       

        <link rel="stylesheet" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>" >
    
    	
    
        <title>Index Registration</title>
</head>
<body>
	<div class="container">
		<div class="main_contents">
    		<div id="sub_content">
		      <form:form class="row g-3 mt-3 ms-2">
		        <div class="col-auto">
		          <label for="staticEmail2" class="visually-hidden">studentID</label>
		          <input type="text"  class="form-control" id="staticEmail2" placeholder="Student ID">
		        </div>
		        <div class="col-auto">
		          <label for="inputPassword2" class="visually-hidden">studentName</label>
		          <input type="text" class="form-control" id="inputPassword2" placeholder="Student Name">
		        </div>
		        <div class="col-auto">
		            <label for="inputPassword2" class="visually-hidden">Course</label>
		            <input type="text" class="form-control" id="inputPassword2" placeholder="Course">
		          </div>
		        <div class="col-auto">
		          <button type="submit" class="btn btn-success mb-3">Search</button>
		        </div>
		        <div class="col-auto">
		          <button type="submit" class="btn btn-secondary mb-3">Reset</button>
		        </div>
		      </form:form>
				<div>
			      <table class="table table-striped" id="stduentTable">
			        <thead>
			          <tr>
			            <th scope="col">#</th>
			            <th scope="col">Student ID</th>
			            <th scope="col">Name</th>
			            <th scope="col">Course Name</th>
			            <th scope="col">Details</th>
			          </tr>
			        </thead>
			        <tbody>
			          <tr>
			            <th scope="row">1</th>
			            <td>STU0001</td>
			            <td>Thu</td>
			            <td>Java</td>
			            <td>
			              <a href="STU002.html"><button type="submit" class="btn btn-secondary mb-2">See More</button></a> 
			            </td>
			          </tr>
			          <tr>
			            <th scope="row">2</th>
			            <td>STU0001</td>
			            <td>Thu</td>
			            <td>java</td>
			            <td>
			              <a href="STU002.html"><button type="submit" class="btn btn-secondary mb-2">See More</button></a> 
			            </td>
			          </tr>
			          <tr>
			            <th scope="row">3</th>
			            <td>STU0001</td>
			            <td>Thu</td>
			            <td>Java</td>
			            <td>
			              <a href="STU002.html"><button type="submit" class="btn btn-secondary mb-2">See More</button></a>
			              <!-- <a href="STU002.html" class="text-decoration-none">See more</a> -->
			            </td>
			          </tr>
			        </tbody>
			      </table>
		    	</div>
		    </div>
		</div>
	</div>
</body>
</html>