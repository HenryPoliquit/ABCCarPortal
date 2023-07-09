<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp">
	<jsp:param value="Login" name="HTMLtitle" />
</jsp:include>

<div class="container-fluid login mb-4">
	<div class="p-5"></div>
	<div class="mt-lg-5 mt-md-5 mt-4">
		<div class="row m-0">
			<div class="col-lg-3 col-md-2"></div>
			<div class="col-lg-6 col-md-8">
				<div class="container-fluid rounded pt-3 px-3 pb-1"
					style="background-color: rgba(255, 255, 255);">

					<c:if test="${error_string != null}">

						<div class="alert alert-danger">${error_string}
							Click here to <a class="footer-link" href="register_user">Register</a>
						</div>

					</c:if>

					<c:if test="${success_login != null}">
						<div class="alert alert-success text-dark">${success_login}
							Click here to navigate to <a href="home" class="footer-link">Home</a>
						</div>
					</c:if>

					<c:if test="${success_logout != null}">
						<div class="alert alert-success">${success_logout}
							Click here to <a href="login" class="footer-link">Login</a>
						</div>

					</c:if>

					<div>
						<c:if
							test="${ (success_logout == null) && (success_login == null) }">
							<h3 class="heading">Sign In</h3>

							<c:url var="post_url" value="/login" />
							<form action="${post_url}" method="post" class="was-validated">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="mb-3 mt-3">
									<label for="username" class="form-label heading">Username:</label>
									<input type="text" class="form-control" id="userName"
										placeholder="Enter username" name="username" value="" required>
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="mb-3">
									<label for="password" class="form-label heading">Password:</label>
									<input type="password" class="form-control" id="password"
										placeholder="Enter password" name="password" value="" required>
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>

								<input type="submit" name="Login" value="Sign In"
									 type="button" class="btn btn-outline-dark"></input>
							</form>

							<p class="mt-3">
								New User? Click here to <a href="register_user"
									class="footer-link">Register</a>
							</p>
						</c:if>
					</div>
				</div>
				<c:if test="${success_login != null}">
					<div style="height: 38vh"></div>
				</c:if>
				<c:if test="${success_logout != null}">
					<div style="height: 38vh"></div>
				</c:if>
			</div>
			<div class="col-lg-3 col-md-2"></div>
		</div>
	</div>
	<div class="m-5"></div>
</div>
<c:if test="${error_string != null}">
	<div class="p-4"></div>
</c:if>
<jsp:include page="footer.jsp"></jsp:include>