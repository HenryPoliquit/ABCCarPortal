<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="header.jsp">
	<jsp:param value="Car Detail" name="HTMLtitle" />
</jsp:include>

<div class="mb-5 searchResult" style="min-height: 69vh;">
	<div class="p-5 mt-1"></div>
		<c:if test="${empty searchCar}">

			<div class="container alert alert-danger">No search results found for
			${keyword}</div>

		</c:if>
		<!-- list of all cars posted -->
		<div class="container">
		<h1 class="headline">Search Results</h1>
		<div class="row" style="gap: 60px;">

			<c:forEach items="${searchCar}" var="c">

				<div class="card pt-3" style="width: 400px; height: 400px;">
					<img class="card-img-top" src="${c.photoImagePath}"
						alt="${c.photos}" style="width: 100%; height: 60%;">
					<div class="card-body">
						<h4 class="card-title heading">${c.name}</h4>
						<p class="card-text">
							<i class="fas fa-tags"></i>&nbsp;Pesos ${c.price}
						</p>

						<!--<a href="#" class="btn"
							style="background-color: red; margin-right: 40px;">Book a
							Test Drive</a>-->
						<a href="/car_detail?cid=${c.id}" class="btn btn-outline-dark">View
							Car Details</a>
					</div>
				</div>
			</c:forEach>

		</div>
		</div>
		<!-- list of all cars posted -->
	</div>

<jsp:include page="footer.jsp"></jsp:include>