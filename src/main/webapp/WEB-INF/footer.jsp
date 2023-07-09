<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<footer class="page-footer font-small text-white pt-4"
	style="background-color: rgba(255,255,255, 0.05);">
	<div class="container text-center">
		<!-- Grid row -->
		<div class="row">
			<!-- Grid column -->
			<div class="col-md-3 mt-md-0 mt-3">
				<!-- Content -->
				<sec:authorize access="!isAuthenticated()">
					<img src="resources/logo.png" alt="logo"
						class="d-inline-block align-top rounded img-fluid w-75">
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<a href="home"><img src="resources/logo.png" alt="logo"
						class="d-inline-block align-top rounded img-fluid w-75"></a>
				</sec:authorize>
			</div>

			<hr class="clearfix w-100 d-md-none pb-3">

			<div class="col-md-3 mb-md-0 mb-3">
				<!-- General -->
				<h5 class="text-uppercase heading">General</h5>

				<ul class="list-unstyled">
				<sec:authorize access="!isAuthenticated()">
					<li><a href="register_user" class="footer-link">Register</a></li>
					<li><a href="login" class="footer-link">Login</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li><a href="aboutUs" class="footer-link">About Us</a></li>
					<li><a href="contactUs" class="footer-link">Contact Us</a></li>
				</sec:authorize>
				</ul>
			</div>

			<div class="col-md-3 mb-md-0 mb-3">
				<!-- Browse ABC -->
				<h5 class="text-uppercase heading">Browse ABC</h5>

				<ul class="list-unstyled">
					<li><a href="#" class="footer-link">Terms and Conditions</a></li>
				</ul>
			</div>

			<div class="col-md-3 mb-md-0 mb-3 text-center">
				<!-- My Account -->
				<h5 class="text-uppercase heading">Social Accounts</h5>
				<a href="#" class="fa fa-facebook"></a> <a href="#"
					class="fa fa-twitter"></a> <a href="#" class="fa fa-instagram"></a>
				<a href="#" class="fa fa-google"></a> <a href="#"
					class="fa fa-pinterest"></a>
			</div>
		</div>
	</div>

	<div class="footer-copyright text-center py-3">
		© 2020 Copyright:
		<sec:authorize access="!isAuthenticated()">
			<a href="login" class="footer-link">ABCCars.com</a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<a href="home" class="heading" class="footer-link">ABCCars.com</a>
		</sec:authorize>
	</div>
</footer>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</body>
</html>