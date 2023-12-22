<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../header.jsp"%>
<main style="width: 960px; height: 100%; margin: 30px auto;">
	<!-- Carousel -->
	<div id="demo" class="carousel slide  m-4" data-bs-ride="carousel">

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
				<img src="/myWorkSpace/imgfolder/carousel_back1.jpg" class="d-block w-100"
					style="height: 300px;">
			</div>
			<div class="carousel-item">
				<img src="/myWorkSpace/imgfolder/carousel_back2.jpg" class="d-block w-100"
					style="height: 300px;">
			</div>
			<div class="carousel-item">
				<img src="/myWorkSpace/imgfolder/carousel_back3.jpg" alt="" class="d-block w-100"
					style="height: 300px;">
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
	 <div class="m-3" style="font-weight: bold; font-family: 'Arial', sans-serif;">최근 등록된 상품</div>

    <section class="product mt-2">
		<section class="products row " style=" text-align:center;" >
			<c:forEach var="product" items="${recentProduct}">
				<article class="mt-3 col-md-2" style="transition: box-shadow 0.3s, cursor 0.3s; cursor: pointer;" onmouseover="this.style.boxShadow='0 0 10px rgba(0, 0, 0, 0.3)'" onmouseout="this.style.boxShadow='none'"
				onclick="location.href='/myWorkSpace/detaiIitem.do?productno=${product.productno}';">
					<img src="${product.image}" style="width:100%;height:150px;">

					<div class="mt-2">
						<b>${product.title}</b>
					</div>

					<div class="text-secondary mt-2"">${product.price}원</div>

					<div class="mt-2">판매자: ${product.user_name}</div>
					
					
					<div class="mt-2">${product.productStatus}</div>
				</article>
			</c:forEach>
		</section>
	</section>
	
	<div class="mt-4"
		style="font-weight: bold; font-family: 'Arial', sans-serif;">인기 상품</div>
	<section class="product mt-2">
		<section class="products row " style="text-align:center;">
			<c:forEach var="product" items="${recentProduct}">
				<article class="mt-3 col-md-2 product-card"  style="transition: box-shadow 0.3s, cursor 0.3s; cursor: pointer;" onmouseover="this.style.boxShadow='0 0 10px rgba(0, 0, 0, 0.3)'" onmouseout="this.style.boxShadow='none'"
				onclick="location.href='/myWorkSpace/detaiIitem.do?productno=${product.productno}';">
					<img src="${product.image}" style="width:100%;height:150px;">

					<div class="mt-2">
						<b>${product.title}</b>
					</div>

					<div class="text-secondary mt-2"">${product.price}원</div>

					<div class="mt-2">판매자: ${product.user_name}</div>

					<div class="mt-2">${product.productStatus}</div>
				</article>
			</c:forEach>
		</section>
	</section>
</main>
<%@ include file="../footer.jsp"%>