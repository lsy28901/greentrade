<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<main style="width: 960px; height: 100%; margin: 30px auto;">
	

	<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">

		<!-- Indicators/dots -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/myWorkSpace/imgfolder/sale_banner1.jpg"
					class="d-block w-100" style="height: 300px;">
			</div>
			<div class="carousel-item">
				<img src="/myWorkSpace/imgfolder/banner2.jpg"
					class="d-block w-100" style="height: 300px;">
			</div>
			<div class="carousel-item">
				<img src="/myWorkSpace/imgfolder/banner3.jpg" alt=""
					class="d-block w-100" style="height: 300px;">
			</div>
		</div>

		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>
	
	
	
	<div class="m-3"
		style="font-weight: bold; font-family: 'Arial', sans-serif; font-size: 24px;">최근
		등록된 상품</div>
	<!--     <section class="product mt-2"> -->
	<!-- 		<section class="products row " style=" text-align:center;" > -->
	<%-- 			<c:forEach var="product" items="${recentProduct}"> --%>
	<!-- 				<article class="mt-3 col-md-2" style="transition: box-shadow 0.3s, cursor 0.3s; cursor: pointer;" onmouseover="this.style.boxShadow='0 0 10px rgba(0, 0, 0, 0.3)'" onmouseout="this.style.boxShadow='none'" -->
	<%-- 				onclick="location.href='/myWorkSpace/detaiIitem.do?productno=${product.productno}';"> --%>
	<%-- 					<img src="${product.image}" style="width:100%;height:150px;"> --%>

	<!-- 					<div class="mt-2"> -->
	<%-- 						<b>${product.title}</b> --%>
	<!-- 					</div> -->

	<%-- 					<div class="text-secondary mt-2"">${product.price}원</div> --%>

	<%-- 					<div class="mt-2">판매자: ${product.user_name}</div> --%>


	<%-- 					<div class="mt-2">${product.productStatus}</div> --%>
	<!-- 				</article> -->
	<%-- 			</c:forEach> --%>
	<!-- 		</section> -->
	<!-- 	</section> -->

	<!-- Section-->
	<section class="">
		<div class="container  mt-2">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach var="product" items="${recentProduct}">
					<div class="col mb-5">
						<div class="card h-100"
							style="transition: box-shadow 0.3s, cursor 0.3s; cursor: pointer;"
							onmouseover="this.style.boxShadow='0 0 10px rgba(0, 0, 0, 0.3)'"
							onmouseout="this.style.boxShadow='none'"
							onclick="location.href='/myWorkSpace/detaiIitem.do?productno=${product.productno}';">
							<!-- Sale badge-->
							<div class="badge bg-green text-black position-absolute"
								style="top: 0.5rem; right: 0.5rem">${product.paymethod}</div>
							
							<!-- Product images-->
							<img class="card-img-top h-100" src="${product.image}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${product.title}</h5>
									<div class="text-secondary">${product.price}원</div>
									<!-- Product reviews-->
									<div class="d-flex justify-content-center text-success mb-2">
										<div class="bi-star-fill mt-2">${product.productStatus}</div>
									</div>
									<div class="d-flex justify-content-center  mb-2">
										<div class="bi-star-fill text-danger mt-2">${product.adddate}</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>



			</div>
		</div>
	</section>
	
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder ">Green Trade</h1>
				<p class="lead fw-normal text-success mb-0">나만의 중고 거래를 시작해보세요</p>
			</div>
		</div>
	</header>
	

<!-- 	<div class="m-3" -->
<!-- 		style="font-weight: bold; font-family: 'Arial', sans-serif; font-size: 24px;">인기 상품</div> -->
</main>
<%@ include file="../footer.jsp"%>