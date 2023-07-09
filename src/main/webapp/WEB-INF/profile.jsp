<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="header.jsp">
	<jsp:param value="Profile" name="HTMLtitle" />
</jsp:include>
<div class="mb-5 profile" style="min-height: 69vh;">
	<section>
		<c:forEach items="${user}" var="u">
			<c:set var="id" value="${u.id}"></c:set>
			<c:set var="name" value="${u.name}"></c:set>
			<c:set var="uname" value="${u.userName}"></c:set>
			<c:set var="email" value="${u.email}"></c:set>
			<c:set var="mobile" value="${u.mobile}"></c:set>
			<c:set var="address" value="${u.address}"></c:set>
		</c:forEach>

		<div class="p-5 mt-1"></div>
		<div class="container mt-3">

			<div class="row">
				<h3 class="headline">
					User Profile
					<!-- Button trigger modal -->
					<button type="button" class="btn" data-bs-toggle="modal"
						data-bs-target="#exampleModal">
						<i class="fas fa-edit fa-sm"></i>
					</button>
				</h3>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title heading" id="exampleModalLabel">Update
									User</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">

								<!-- User Update Form -->
								<sf:form action="update" method="post" class="was-validated"
									modelAttribute="user">
									<div class="mb-3 mt-3">
										<label for="name" class="form-label heading">Name:</label> <input
											type="text" class="form-control" placeholder="Enter name"
											name="name" path="name" value="${name}" required="true" />
										<div class="valid-feedback">Valid.</div>
										<div class="invalid-feedback">Please fill out this
											field.</div>
									</div>
									<div class="mb-3">
										<label for="userName" class="form-label heading">Username:</label>
										<input type="text" class="form-control" id="userName"
											placeholder="Enter username" name="userName" path="userName"
											value="${uname}" required="true" />
										<div class="valid-feedback">Valid.</div>
										<div class="invalid-feedback">Please fill out this
											field.</div>
									</div>
									<div class="mb-3">
										<label for="email" class="form-label heading">Email:</label> <input
											type="email" class="form-control"
											placeholder="Enter username" name="email" path="email"
											value="${email}" required="true" />
										<div class="valid-feedback">Valid.</div>
										<div class="invalid-feedback">Please fill out this
											field.</div>
									</div>
									<div class="mb-3">
										<label for="mobile" class="form-label heading">Mobile:</label>
										<input type="text" class="form-control" id="mobile"
											placeholder="Enter mobile" name="mobile" path="mobile"
											value="${mobile}" required="true" />
										<div class="valid-feedback">Valid.</div>
										<div class="invalid-feedback">Please fill out this
											field.</div>
									</div>
									<div class="mb-3">
										<label for="address" class="form-label heading">Address:</label>
										<input type="text" class="form-control" id="address"
											placeholder="Enter address" name="address" path="address"
											value="${address}" required="true" />
										<div class="valid-feedback">Valid.</div>
										<div class="invalid-feedback">Please fill out this
											field.</div>
									</div>

									<button type="submit" class="btn btn-outline-dark">Update</button>
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

			<div class="row">

				<div class="col-lg-4 col-md-4">
					<div class="card mb-4">
						<div class="card-body text-center" style="height: 284px;">
							<img src="/resources/profpic.png" alt="avatar"
								class="rounded-circle img-fluid" style="width: 150px;">
							<h5 class="my-3">${name}</h5>
							<p class="text-muted mb-1">${address}</p>

						</div>
					</div>

				</div>
				<div class="col-lg-8 col-md-8">
					<div class="card mb-4">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0 heading">Full Name</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">${name}</p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0 heading">Email</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">${email}</p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0 heading">Username</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">${uname}</p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0 heading">Mobile</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">${mobile}</p>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<p class="mb-0 heading">Address</p>
								</div>
								<div class="col-sm-9">
									<p class="text-muted mb-0">${address}</p>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>



			<div class="row p-3">
				<nav class="nav nav-tabs about-tab rounded">
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<button class="nav-link active link-dark heading" id="nav-home-tab"
							data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
							role="tab" aria-controls="nav-home" aria-selected="true">Post
							Status</button>
						<button class="nav-link link-dark heading" id="nav-profile-tab"
							data-bs-toggle="tab" data-bs-target="#nav-profile" type="button"
							role="tab" aria-controls="nav-profile" aria-selected="false">Booking
							Status</button>

					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<c:if test="${not empty cars}">
							<div class="container">
								<div class="row">
									<div class="col-12 table-responsive">
										<table class="table table-bordered text-white">
											<thead>
												<tr>
													<th class="heading" scope="col">Post</th>
													<th class="heading" scope="col">Car</th>
													<th class="heading" scope="col">Post Date</th>
													<th class="heading" scope="col">Action</th>
													<th class="heading" scope="col">Current Bid (RM)</th>
													<th class="heading" scope="col">Bidder Name</th>
													<th class="heading" scope="col">Sale status</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${cars}" var="c" varStatus="status">
													<tr>
														<th class="heading" scope="row">${status.count}</th>
														<td class="text-white">${c.name}</td>
														<td class="text-white">${c.postDate}</td>
														<td>
															<!-- view car --> <a type="button"
															class="btn btn-primary" href="/car_detail?cid=${c.id}">
																<i class="far fa-eye"></i>
														</a> <!-- view car --> <!-- edit car --> <!-- <button type="button" class="btn btn-success">
														<i class="fas fa-edit"></i>
													</button> --> <!-- edit car --> <!-- delete car --> <a
															type="button" class="btn btn-danger"
															href="/deletecar?cid=${c.id}"> <i
																class="far fa-trash-alt"></i>
														</a> <!-- delete car -->
														</td>
														<c:forEach items="${c.biddings}" var="b" begin="0" end="0">
															<c:set var="bidPrice" value="${b.bidderPrice}"></c:set>
															<c:if test="${bidPrice > 0}">
																<td class="text-white">${b.bidderPrice}</td>
																<td class="text-white">${b.bidderName}</td>

															</c:if>
															<td class="text-white">${c.sellStatus}</td>
														</c:forEach>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>

								<!-- end of row -->
							</div>
						</c:if>
					</div>
					<div class="tab-pane fade" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<c:if test="${not empty cars}">
							<div class="container">
								<div class="row">
									<div class="col-12 table-responsive">
										<table class="table table-bordered text-white">
											<thead>
												<tr>
													<th class="heading" scope="col">No.</th>
													<th class="heading" scope="col">Car</th>
													<th class="heading" scope="col">Book Date</th>
													<th class="heading" scope="col">Book By</th>
													<th class="heading" scope="col">Book Status</th>

												</tr>
											</thead>
											<tbody>
												<c:forEach items="${cars}" var="c" varStatus="status">
													<c:forEach items="${c.biddings}" var="b">
														<c:set var="bookDate" value="${b.bookDate}"></c:set>
														<c:if test="${bookDate != null}">
															<tr>
																<th class="heading" scope="row">${status.count}</th>
																<td class="text-white">${c.name}</td>
																<td class="text-white">${b.bookDate}</td>
																<td class="text-white">${b.bidderName}</td>
																<td class="text-white">${b.bookStatus}</td>
															</tr>
														</c:if>
													</c:forEach>
												</c:forEach>

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</c:if>

						<c:if test="${empty cars}">
							<div class="container">
								<div class="row">
									<div class="col-12 table-responsive">
										<table class="table table-bordered text-white">
											<thead>
												<tr>
													<th class="heading" scope="col">No.</th>
													<th class="heading" scope="col">Book Date</th>
													<th class="heading" scope="col">Car</th>
													<th class="heading" scope="col">Book Status</th>
													<th class="heading" scope="col">View Car</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${bids}" var="b" varStatus="status">
													<c:set var="bookDate" value="${b.bookDate}"></c:set>
													<c:if test="${bookDate != null}">
														<tr>
															<th class="heading" scope="row">${status.count}</th>
															<td class="text-white">${b.bookDate}</td>
															<td class="text-white">${b.car.name}</td>
															<td class="text-white">${b.bookStatus}</td>
															<td>
																<!-- view car --> <a type="button"
																class="btn btn-primary"
																href="/car_detail?cid=${b.car.id}"> <i
																	class="far fa-eye"></i>
															</a> <!-- view car -->
															</td>
														</tr>
													</c:if>
												</c:forEach>

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</c:if>


					</div>

				</div>
			</div>
		</div>
	</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>