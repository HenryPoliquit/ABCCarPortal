<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<title>ABC Car Portal | <%=request.getParameter("HTMLtitle") != null ? request.getParameter("HTMLtitle") : "ABC Cars"%></title>
 <link rel="icon" type="image/x-icon" href="/resources/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- General font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<!-- Font for headings -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Source+Serif+Pro&display=swap" rel="stylesheet">
	<!-- Font for headlines -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Prosto+One&display=swap" rel="stylesheet">
<!-- Font for lead -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@300&family=Orbitron&display=swap" rel="stylesheet">
<!-- CSS for bootstrap and custom -->
<link rel="stylesheet" href="css/social.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body style="background-color: rgba(3, 2, 1);">
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg fixed-top"
		style="background-color: rgba(50, 50, 50, 0.8);">
		<div class="container-fluid">
			<div class="navbar-nav">
				<img src="resources/logo.png" width=130 height=72 alt="logo"
					class="d-inline-block align-top rounded">
			</div>
			<button type="button" class="navbar-toggler"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse ms-2" id="navbarCollapse">
				<sec:authorize access="!isAuthenticated()">
					<div class="navbar-nav">
						<a href="aboutUs" class="nav-item nav-link mainMenu rounded">About
							Us</a> <a href="contactUs" class="nav-item nav-link mainMenu rounded">Contact
							Us</a>
					</div>
					<div class="navbar-nav ms-auto me-5">
						<a href="register_user" class="nav-item nav-link mainMenu rounded">Register</a>
						<a href="login" class="nav-item nav-link mainMenu rounded">Login</a>
					</div>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<sec:authorize access="hasRole('Users')">
						<div class="navbar-nav">
							<a href="home" class="nav-item nav-link mainMenu rounded">Home</a>
							<a href="cars" class="nav-item nav-link mainMenu rounded">Cars</a>
							<a href="profile" class="nav-item nav-link mainMenu rounded">Profile</a>
						</div>
						<div class="navbar-nav w-50 px-5">
							<sf:form action="search" method="get" style="width: 100%;">
								<div class="input-group">
									<input type="search" class="form-control rounded"
										placeholder="Search" aria-label="Search" name="keyword"
										aria-describedby="search-addon" />
									<button type="submit" class="btn btn-outline-primary">search</button>
								</div>
							</sf:form>
						</div>
					</sec:authorize>
					<sec:authorize access="hasRole('Administrator')">
						<div class="navbar-nav">
							<a href="home" class="nav-item nav-link mainMenu rounded">Home</a>
							<a href="all_cars" class="nav-item nav-link mainMenu rounded">View
								Cars</a> <a href="users" class="nav-item nav-link mainMenu rounded">View
								Users</a> <a href="profile"
								class="nav-item nav-link mainMenu rounded">Profile</a>
						</div>
						<div class="navbar-nav w-50 px-5">
							<sf:form action="search" method="get" style="width: 100%;">
								<div class="input-group">
									<input type="search" class="form-control rounded"
										placeholder="Search" aria-label="Search" name="keyword"
										aria-describedby="search-addon" />
									<button type="submit" class="btn btn-outline-primary">search</button>
								</div>
							</sf:form>
						</div>
					</sec:authorize>
					<div class="navbar-nav ms-auto">
						<form action="logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="submit" name="Logout"
								value="Logout" class="btn btn-danger nav-link nav-item"></input>
						</form>
					</div>
				</sec:authorize>
			</div>
		</div>
	</nav>