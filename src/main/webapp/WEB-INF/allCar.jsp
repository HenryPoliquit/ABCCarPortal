<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="header.jsp">
	<jsp:param value="View All Cars" name="HTMLtitle" />
</jsp:include>
<div class="mb-5 carManage" style="min-height: 69vh;">
<div class="p-5 mt-1"></div>

<div class="container mt-3 text-white">
	<h3 class="headline">Car Management</h3>

	<div class="row">
		<div class="col-12 table-responsive">
			<table class="table table-bordered text-white">
				<thead>
					<tr>
						<th class="heading" scope="col">No.</th>
						<th class="heading" scope="col">Name</th>
						<th class="heading" scope="col">Model</th>
						<th class="heading" scope="col">Price (Pesos)</th>
						<th class="heading" scope="col">Seller</th>
						<th class="heading" scope="col">Action</th>
						<th class="heading" scope="col">Sell Car?</th>
						<th class="heading" scope="col">Current Bid (Pesos)</th>
						<th class="heading" scope="col">Booking Date</th>
						<th class="heading" scope="col">Approve Booking?</th>
						<th class="heading" scope="col">Bidder Name</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cars}" var="c" varStatus="status">
						<tr>
							<th scope="row" class="text-white">${status.count}</th>
							<td class="text-white">${c.name}</td>
							<td class="text-white">${c.model}</td>
							<td class="text-white">${c.price}</td>
							<td><a type="button" class="btn btn-primary"
								href="/view?uid=${c.sellerId}"> <i class="far fa-eye"></i>
							</a></td>
							<td><a type="button" class="btn btn-primary"
								href="/car_detail?cid=${c.id}"> <i class="far fa-eye"></i>
							</a> <!-- Button trigger modal -->
								<button type="button" class="btn btn-success"
									data-bs-toggle="modal"
									data-bs-target="#exampleModal${status.index}">
									<i class="fas fa-edit"></i>
								</button> <!-- Modal -->

								<div class="modal fade" id="exampleModal${status.index}"
									tabindex="-1" aria-labelledby="exampleModalLabel"
									aria-hidden="true" role="dialog">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title heading" id="exampleModalLabel">Edit Car
													Post</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">

												<!-- Car Post Form -->
												<sf:form action="/edit_car?cid=${c.id}" method="post"
													class="was-validated" modelAttribute="car"
													enctype="multipart/form-data">
													<div class="mb-3 mt-3">
														<label for="name" class="d-flex form-label heading">Name:</label>
														<input type="text" class="form-control"
															placeholder="Enter car name" name="name" path="name"
															required="true" value="${c.name}" />
														<div class="valid-feedback">Valid.</div>
														<div class="invalid-feedback">Please fill out this
															field.</div>
													</div>
													<div class="mb-3">
														<label for="model" class="d-flex form-label heading">Model:</label>
														<input type="text" class="form-control"
															placeholder="Enter model" name="model" path="model"
															value="${c.model}" required="true" />
														<div class="valid-feedback">Valid.</div>
														<div class="invalid-feedback">Please fill out this
															field.</div>
													</div>
													<div class="mb-3">
														<label for="price" class="d-flex form-label heading">Price
															(RM):</label> <input type="text" class="form-control" id="price"
															placeholder="Enter car price" name="price" path="price"
															value="${c.price}" required="true" />
														<div class="valid-feedback">Valid.</div>
														<div class="invalid-feedback">Please fill out this
															field.</div>
													</div>
													<div class="mb-3">
														<label for="make" class="d-flex form-label heading">Make
															Year:</label> <input type="text" class="form-control"
															placeholder="Enter make year" name="make" path="make"
															value="${c.make}" required="true" />
														<div class="valid-feedback">Valid.</div>
														<div class="invalid-feedback">Please fill out this
															field.</div>
													</div>
													<div class="mb-3">
														<label for="registeration" class="d-flex form-label heading">Registration
															Date:</label> <input type="text" class="form-control"
															id="registeration" placeholder="Enter registeration date"
															name="registeration" path="registeration"
															value="${c.registeration}" required="true" />
														<div class="valid-feedback">Valid.</div>
														<div class="invalid-feedback">Please fill out this
															field.</div>
													</div>

													<input type="hidden" name="sellerId" value="${c.sellerId}" />
													<input type="hidden" name="photos" value="${c.photos}" />
													<input type="hidden" name="photoImagePath"
														value="${c.photoImagePath}" />

													<div class="holder"
														style="height: 300px; width: 300px; margin: auto;">
														<img id="imgPreview" src="${c.photoImagePath}"
															alt="image preview" style="width: inherit;" />
													</div>

													<button type="submit" class="btn btn-outline-dark d-flex">Edit</button>
												</sf:form>
												<script>
						            $(document).ready(() => {
						            	
						                $("#photo").change(function () {
						                    const file = this.files[0];
						                    if (file) {
						                        let reader = new FileReader();
						                        reader.onload = function (event) {
						                            $("#imgPreview")
						                              .attr("src", event.target.result);
						                        };
						                        reader.readAsDataURL(file);
						                    }
						                });
						            });
						        </script>
												<!-- Car Post Form -->
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>

											</div>
										</div>
									</div>

								</div> <a type="button" class="btn btn-danger"
								href="/delete_car?cid=${c.id}"> <i class="far fa-trash-alt"></i>
							</a></td>


							<!-- selling modal -->
							<td class="text-white">${c.sellStatus}<!-- Button trigger modal -->
								<button type="button" class="btn" data-bs-toggle="modal"
									data-bs-target="#exampleModal2${status.index}">
									<i class="fas fa-edit fa-sm"></i>
								</button> <!-- Modal -->

								<div class="modal fade text-dark" id="exampleModal2${status.index}"
									tabindex="-1" aria-labelledby="exampleModalLabel"
									aria-hidden="true" role="dialog">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title heading" id="exampleModal2Label">Set Car
													Sale Status</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">

												<!-- Sale Status Form -->
												<sf:form action="/sale_status?cid=${c.id}" method="post"
													class="was-validated" modelAttribute="biddings">
													<div class="mb-3 mt-3">
														<label for="sellStatus" class="form-label heading">Sale
															Status:</label> <input type="text" class="form-control"
															placeholder="Enter sale status" name="sellStatus"
															value="${c.sellStatus}" required="true" />
														<div class="valid-feedback">Valid.</div>
														<div class="invalid-feedback">Please fill out this
															field.</div>
													</div>

													<button type="submit" class="btn btn-primary">Set</button>
												</sf:form>
											</div>
										</div>
									</div>
								</div>

							</td>
							<!-- selling modal -->
							<c:forEach items="${c.biddings}" var="b" begin="0" end="0">

								<td class="text-white">${b.bidderPrice}</td>
								<td class="text-white">${b.bookDate}</td>
								<!-- booking modal -->
								<td class="text-white">${b.bookStatus}<!-- Button trigger modal -->
									<button type="button" class="btn" data-bs-toggle="modal"
										data-bs-target="#exampleModal1${status.index}">
										<i class="fas fa-edit fa-sm"></i>
									</button> <!-- Modal -->

									<div class="modal fade text-dark" id="exampleModal1${status.index}"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title heading" id="exampleModal1Label">Set
														Booking Status</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">

													<!-- Booking Status Form -->
													<sf:form action="/booking_status?bid=${b.id}" method="post"
														class="was-validated" modelAttribute="book">
														<div class="mb-3 mt-3">
															<label for="bookStatus" class="form-label heading">Booking
																Status:</label> <input type="text" class="form-control"
																placeholder="Enter booking status" name="bookStatus"
																value="${b.bookStatus}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>

														<button type="submit" class="btn btn-primary">Set</button>
													</sf:form>
												</div>
											</div>
										</div>
									</div> <!-- booking modal -->
								</td>
								<td class="text-white">${b.bidderName}</td>

							</c:forEach>

						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>