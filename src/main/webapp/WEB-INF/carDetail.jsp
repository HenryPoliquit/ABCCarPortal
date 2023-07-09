<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="header.jsp">
	<jsp:param value="Car Detail" name="HTMLtitle" />
</jsp:include>
<div class="mb-5 carDetail" style="min-height: 69vh;">
	<div class="p-5 mt-1"></div>

	<c:forEach items="${car}" var="c">
		<c:set var="id" value="${c.id}"></c:set>
		<c:set var="name" value="${c.name}"></c:set>
		<c:set var="image" value="${c.photoImagePath}"></c:set>
		<c:set var="make" value="${c.make}"></c:set>
		<c:set var="model" value="${c.model}"></c:set>
		<c:set var="registeration" value="${c.registeration}"></c:set>
		<c:set var="price" value="${c.price}"></c:set>
		<c:set var="sellStatus" value="${c.sellStatus}"></c:set>
	</c:forEach>

	<div class="container mt-3 mb-5">
		<div class="card mb-5">
			<div class="row g-0">
				<div class="col-md-6 border-end">
					<div class="d-flex flex-column justify-content-center">
						<div class="main_image">
							<img src="${image}" id="main_product_image" width="100%">
						</div>

					</div>
				</div>
				<div class="col-md-6">
					<div class="p-3 right-side">
						<div class="d-flex justify-content-between align-items-center">
							<h3 class="heading">${name}</h3>

						</div>
						<div class="my-3 mx-5 content">


							<div class="d-flex">
								<div style="width: 300px;">
									<span class="fw-bold heading">Condition</span>
									<p style="font-size: 16px;">
										<i class="fas fa-car"></i> Used Car
									</p>
								</div>

								<div>
									<span class="fw-bold heading">Manufacture Year</span>
									<p style="font-size: 16px;">
										<i class="fas fa-calendar"></i> ${make}
									</p>
								</div>
							</div>

							<div class="d-flex">
								<div style="width: 300px;">
									<span class="fw-bold heading">Model</span>
									<p style="font-size: 16px;">
										<i class="fas fa-tag"></i> ${model}
									</p>
								</div>

								<div>
									<span class="fw-bold heading">Registration Date</span>
									<p style="font-size: 16px;">
										<i class="fas fa-calendar"></i> ${registeration}
									</p>
								</div>
							</div>


						</div>

						<c:if test="${sellStatus == 'sold'}">
							<h3>Car Sold!</h3>
						</c:if>
						
						<c:if test="${sellStatus != 'sold'}">

						<div>
							<span class="fw-bold heading">Current Price</span>
							<h3>Pesos ${price}</h3>
						</div>

						<div class="mt-4">
							<span class="fw-bold heading">Current Bid</span>
							<c:if test="${empty highest}">
								<h3>Pesos 0</h3>
							</c:if>
							<c:if test="${not empty highest}">
								<h3>Pesos ${highest}</h3>
							</c:if>

						</div>
						<div class="buttons d-flex flex-row mt-5 gap-3">
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-outline-dark"
								data-bs-toggle="modal" data-bs-target="#exampleModal1"
								style="width: 500px;">Book for Test Drive</button>

							<!-- Modal -->
							<div class="modal fade" id="exampleModal1" tabindex="-1"
								aria-labelledby="exampleModal1Label" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title heading" id="exampleModal1Label">Book for
												Test Drive</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">

											<!-- Book Form -->
											<sf:form action="book" method="post" class="was-validated"
												modelAttribute="booking">
												<div class="mb-3 mt-3">
													<label for="bookDate" class="form-label heading">Booking
														Date:</label> <input type="date" class="form-control"
														name="bookDate" required="true" />
													<div class="valid-feedback">Valid.</div>
													<div class="invalid-feedback">Please fill out this
														field.</div>
												</div>

												<input type="hidden" name="cid" value="${id}">

												<button type="submit" class="btn btn-primary"
													style="width: auto;">Book on this Date</button>
											</sf:form>
											<!-- User Update Form -->
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>

										</div>
									</div>
								</div>

							</div>
							<!-- Modal -->

							<!-- Button trigger modal -->
							<button type="button" class="btn btn-dark" data-bs-toggle="modal"
								data-bs-target="#exampleModal">Bid</button>

							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title heading" id="exampleModalLabel">Car
												Bidding</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">

											<!-- Bid Form -->
											<sf:form action="bid" method="post" class="was-validated"
												modelAttribute="bidding">
												<div class="mb-3 mt-3">
													<label for="name" class="form-label heading">Bid Price
														(Pesos):</label> <input type="text" class="form-control"
														placeholder="Enter bidding price" name="bidderPrice"
														required="true" />
													<div class="valid-feedback">Valid.</div>
													<div class="invalid-feedback">Please fill out this
														field.</div>
												</div>

												<input type="hidden" name="cid" value="${id}">

												<button type="submit" class="btn btn-primary">Bid
													at this price</button>
											</sf:form>
											<!-- User Update Form -->
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>

										</div>
									</div>
								</div>

							</div>
						</div>
						</c:if>
						<!-- end of button options -->
					</div>
				</div>
			</div>
		</div>

		<!--list of car bidder -->
		<c:if test="${not empty bid}">
			<div class="row">
				<h3 class="headline">Bidding & Booking Status</h3>
				<div class="col-12 table-responsive">
					<table class="table table-bordered text-white">
						<thead>
							<tr>
								<th class="heading text-white" scope="col">Name</th>
								<th class="heading text-white" scope="col">Bidding Date</th>
								<th class="heading text-white" scope="col">Bidding Price (Pesos)</th>
								<th class="heading text-white" scope="col">Test Drive Book Date</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bid}" var="b">
								<tr>
									<td class="text-white">${b.bidderName}</td>
									<td class="text-white">${b.bidDate}</td>
									<td class="text-white">${b.bidderPrice}</td>
									<td class="text-white">${b.bookDate}</td>
								</tr>

							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</c:if>

		<!--list of car bidder -->
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>