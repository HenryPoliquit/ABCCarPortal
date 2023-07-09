<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="header.jsp">
	<jsp:param value="View Cars" name="HTMLtitle" />
</jsp:include>
<div class="mb-5 viewCars" style="min-height: 69vh;">
	<div class="p-5 mt-1"></div>
	<div class="container mt-3">
		<sec:authorize access="hasRole('Users')">
			<!-- post car link-->
			<div class="row p-3 mb-5" style="background-color: #ff5c5c;">
				<div class="col-lg-9">
					<p class="text-white font-weight-bold"
						style="margin-bottom: 0px; font-weight: bolder;">Sell Your Car
						Today!</p>
					<p class="text-white" style="margin-bottom: 0px;">Sell Your Car
						in a click with Us</p>
				</div>
				<div class="col-lg-3 text-center mt-2">
					<span class="border border-white p-2"> <!-- Button trigger modal -->
						<button type="button" class="btn" data-bs-toggle="modal"
							data-bs-target="#exampleModal" style="font-color: white;">
							Sell Now</button>
					</span>
					<!-- Modal -->

					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true"
						role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">

								<div class="modal-header">
									<h5 class="modal-title heading" id="exampleModalLabel">Sell Your
										Car Today!</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<c:if test="${success_post != null}">
										<div class="alert alert-success">${success_post}</div>
									</c:if>

									<!-- Car Post Form -->
									<sf:form action="car_post" method="post" class="was-validated"
										modelAttribute="car" enctype="multipart/form-data">
										<div class="mb-3 mt-3">
											<label for="name" class="d-flex form-label heading">Name:</label>
											<sf:input type="text" class="form-control"
												placeholder="Enter car name" name="name" path="name"
												required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>
										<div class="mb-3">
											<label for="model" class="d-flex form-label heading">Model:</label>
											<sf:input type="text" class="form-control"
												placeholder="Enter model" name="model" path="model"
												required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>
										<div class="mb-3">
											<label for="price" class="d-flex form-label heading">Price
												(Pesos):</label>
											<sf:input type="text" class="form-control" id="price"
												placeholder="Enter car price" name="price" path="price"
												required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>
										<div class="mb-3">
											<label for="make" class="d-flex form-label heading">Make
												Year:</label>
											<sf:input type="text" class="form-control"
												placeholder="Enter make year" name="make" path="make"
												required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>
										<div class="mb-3">
											<label for="registeration" class="d-flex form-label heading">Registration
												Date:</label>
											<sf:input type="text" class="form-control" id="registeration"
												placeholder="Enter registeration date" name="registeration"
												path="registeration" required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>
										<div class="mb-3">
											<label class="d-flex form-label heading">Photo:</label> <input
												type="file" class="form-control" name="fileImage" id="photo"
												accept="image/png, image/jpeg" required="true" />
											<div class="valid-feedback">Valid.</div>
											<div class="invalid-feedback">Please fill out this
												field.</div>
										</div>

										<div class="holder"
											style="height: 300px; width: 300px; margin: auto;">
											<img id="imgPreview" src="#" alt="image preview"
												style="width: inherit;" />
										</div>

										<button type="submit" class="btn btn-outline-dark d-flex">Post</button>
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

					</div>
				</div>
			</div>
		</sec:authorize>
		<!-- post car link-->


		<!-- list of all cars posted -->
		<div class="row" style="gap: 60px;">
			<c:forEach items="${cars}" var="c">
				<c:set var="id" value="${c.id}"></c:set>
				<c:if test="${success_post == null}">

					<c:if test="${c.sellStatus != 'sold'}">
						<div class="card pt-3" style="width: 400px; height: 400px;">
							<img class="card-img-top" src="${c.photoImagePath}"
								alt="${c.photos}" style="width: 100%; height: 60%;">
							<div class="card-body">
								<h4 class="card-title heading">${c.name}</h4>
								<p class="card-text">
									<i class="fas fa-tags"></i>&nbsp;Pesos ${c.price}
								</p>

								<a href="/car_detail?cid=${c.id}" class="btn btn-outline-dark">View
									Car Details</a>
							</div>
						</div>
					</c:if>

				</c:if>
			</c:forEach>
			<c:if test="${success_post != null}">
				<div class="alert alert-success">${success_post}
					Click here to <a href="/car_detail?cid=${id}">View</a> your car
					post
				</div>
			</c:if>
		</div>
		<!-- list of all cars posted -->
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>