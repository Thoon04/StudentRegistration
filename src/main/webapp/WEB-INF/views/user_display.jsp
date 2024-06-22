<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Search</title>
<link rel="stylesheet" href="<c:url value="/resources/test.css"/>">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="index.jsp" />

	<div class="container">
		<div class="main_contents">
			<div id="sub_content">
				<form:form class="row g-3 mt-3 ms-2" action="" method="post"
					modelAttribute="user">
					<div class="col-auto">
						<form:label path="userId" for="staticEmail2"
							class="visually-hidden">User Id</form:label>
						<form:input type="text" class="form-control" id="staticEmail2"
							path="userId" placeholder="User ID" />
					</div>
					<div class="col-auto">
						<form:label path="userName" for="inputPassword2"
							class="visually-hidden">User
							Name</form:label>
						<form:input type="text" class="form-control" id="inputPassword2"
							path="userName" placeholder="User Name" />
					</div>

					<div class="col-auto">
						<button type="submit" class="btn btn-primary mb-3">Search</button>
					</div>
					<div class="col-auto">
						<button type="button" class="btn btn-secondary"
							onclick="location.href = '/users/user';">Add</button>
					</div>
					<div class="col-auto">
						<button type="button" class="btn btn-danger mb-3">Reset</button>
					</div>
				</form:form>

				<table class="table table-striped" id="userTable">
					<thead>
						<tr>
							<th scope="col">User ID</th>
							<th scope="col">User Name</th>
							<th scope="col">Details</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${users}">
							<tr>
								<td>${user.userId}</td>
								<td>${user.user_name}</td>
								<td><a
									href="/student_registration/editUser/${user.userId}"
									class="btn btn-secondary mb-2">Edit</a></td>
								<td><a
									href="/student_registration/deleteUser/${user.userId}"
									class="btn btn-secondary mb-2">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">User
									Deletion</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<h5 style="color: rgb(127, 209, 131);">Are you sure you
									want to delete this user?</h5>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success"
									data-bs-dismiss="modal">Ok</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>