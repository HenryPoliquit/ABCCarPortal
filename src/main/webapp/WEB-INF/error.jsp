<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="header.jsp">
	<jsp:param value="Error" name="HTMLtitle" />
</jsp:include>

<div class="mb-5" style="min-height: 69vh;">
<div class="p-5 mt-1"></div>
<div class="row m-0">
	<div class="col-lg-3 col-md-3"></div>
	<div class="col-lg-6 col-md-6">
		<div class="p-4 rounded"
			style="background-color: rgba(255, 255, 255);">
			<h3 class="mb-3 heading">${message}</h3>
			<h4 class="mb-3 heading">${description}</h4>
			<h4 class="mb-3 heading">${dateTime}</h4>
			<form align='left' action='http://localhost:8080/home'>
				<div>
					<input type='submit' type="button" class="btn btn-outline-dark"
						value='Back' />
				</div>
			</form>
		</div>
	</div>
	<div class="col-lg-3 col-md-3"></div>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>