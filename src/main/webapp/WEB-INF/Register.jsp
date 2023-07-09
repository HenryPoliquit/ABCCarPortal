<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="header.jsp">
	<jsp:param value="Register" name="HTMLtitle" />
</jsp:include>

<div class="container-fluid register">
	<div class="p-5"></div>
		<div class="mt-lg-3 mt-md-3 mt-3">
	<div class="row m-0">
		<div class="col-lg-3 col-md-2"></div>
		<div class="col-lg-6 col-md-8">
			<div class="container">

				<c:if test="${success_register != null}">

					<div class="alert alert-success">${success_register}
						Click here to <a href="login"> Sign In</a>
					</div>

				</c:if>
				<div class="rounded p-3"
					style="background-color: rgba(255, 255, 255);">
					<h3 class="heading">Register</h3>

					<sf:form action="register" method="post" class="was-validated"
						modelAttribute="user">

						<div class="mb-2 mt-3">
							<label for="name" class="form-label heading">Name:</label>
							<sf:input type="text" class="form-control"
								placeholder="Enter name" name="name" path="name" required="true" />
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>
						<div class="mb-2">
							<label for="userName" class="form-label heading">Username:</label>
							<sf:input type="text" class="form-control" id="userName"
								placeholder="Enter username" name="userName" path="userName"
								required="true" />
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>
						<div class="mb-2">
							<label for="email" class="form-label heading">Email:</label>
							<sf:input type="email" class="form-control"
								placeholder="Enter email address" name="email" path="email"
								required="true" />
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>
						<div class="mb-2">
							<label for="password" class="form-label heading">Password:</label>
							<sf:input type="password" class="form-control" id="password"
								placeholder="Enter password" name="password" path="password"
								required="true" />
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>

						<input type="submit" value="Register" class="btn btn-outline-dark" />
					</sf:form>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-2"></div>
		</div>
	</div>
	<div class="m-3"></div>
</div>
<jsp:include page="footer.jsp"></jsp:include>