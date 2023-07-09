<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp">
	<jsp:param value="Home" name="HTMLtitle" />
</jsp:include>

<c:forEach items="${user}" var="u">
	<c:set var="name" value="${u.name}"></c:set>
</c:forEach>
<div class="home">
	<div class="p-5 mt-1"></div>
	<div class="container-fluid mt-5">
		<div class="row m-0">
			<div class="col-lg-3 col-md-3"
				style="background-image: url('resources/home-bg.png'); background-size: 100% 100%;"></div>
			<div class="col-lg-6 col-md-6 col-sm-12">
				<div class="">
					<h1 class="display-4 headline">Bid for Cars!</h1>
					<h2 class="display-6 heading text-white">Welcome, ${name}!</h2>
					<p class="lead wtfu text-white">Check out all the cars in our
						auction.</p>
					<hr class="my-4">
					<p class="h4 text-white">Bid for the car of your dreams!</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-3"
				style="background-image: url('resources/home-bg2.png'); background-size: 100% 100%;"></div>
		</div>
	</div>
	<div class="container mt-5 mb-5">
		<div class="row">
			<div class="col-lg-4 col-md-4">
				<iframe width="100%" height="auto"
					src="https://www.youtube.com/embed/Nvedr1AeQt8"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					allowfullscreen></iframe>
			</div>
			<div class="col-lg-4 col-md-4">
			<p class="text-white">ABC Car Portal is the perfect
					platform for all car enthusiasts. It is an online marketplace that
					allows users to buy and sell cars from anywhere in the world. The
					portal has a wide variety of vehicles, from luxury cars to vintage
					collectibles. With its user-friendly interface and easy-to-use
					tools, ABC Car Portal makes it easy for car owners to find the
					right car for their needs.</p>
			</div>
			<div class="col-lg-4 col-md-4">
				<iframe width="100%" height="auto"
					src="https://www.youtube.com/embed/sitXeGjm4Mc"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					allowfullscreen></iframe>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
