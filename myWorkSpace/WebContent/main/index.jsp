<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
				<img src="../image/camera.png" class="d-block w-100"
					style="height: 300px;">
			</div>
			<div class="carousel-item">
				<img src="../image/camera.png" class="d-block w-100"
					style="height: 300px;">
			</div>
			<div class="carousel-item">
				<img src="../image/camera.png" alt="" class="d-block w-100"
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
	<div class="m-3">최근 등록된 상품</div>
		<div class="row m-3 justify-content-center" style="display: flex; text-align: center;">
			<div class="card col-md-4 mb-5"
				style="width: 16rem; margin-right: 50px;  padding:10px;">
				<img src="https://mdbcdn.b-cdn.net/img/new/standard/city/062.webp"
					class="card-img-top" alt="Chicago Skyscrapers" />
				<div class="card-body">
					<h5 class="card-title">상품명</h5>
				</div>
				<ul class="list-group list-group-light list-group-small">
					<li class="list-group-item px-4">판매자</li>
					<li class="list-group-item px-4">가격</li>
					<li class="list-group-item px-4">주소</li>
				</ul>
				<div class="card-body">
					<a href="#" class="card-link">상세보기</a>
				</div>
			</div>
			<div class="card col-md-4 mb-5"
				style="width: 16rem; margin-right: 50px;  padding:10px;">
				<img src="https://mdbcdn.b-cdn.net/img/new/standard/city/062.webp"
					class="card-img-top" alt="Chicago Skyscrapers" />
				<div class="card-body">
					<h5 class="card-title">상품명</h5>
				</div>
				<ul class="list-group list-group-light list-group-small">
					<li class="list-group-item px-4">판매자</li>
					<li class="list-group-item px-4">가격</li>
					<li class="list-group-item px-4">주소</li>
				</ul>
				<div class="card-body">
					<a href="#" class="card-link">상세보기</a>
				</div>
			</div>
			<div class="card card col-md-4 mb-5"
				style="width: 16rem; margin-right: 50px; padding:10px;">
				<img src="https://mdbcdn.b-cdn.net/img/new/standard/city/062.webp"
					class="card-img-top" alt="Chicago Skyscrapers" />
				<div class="card-body">
					<h5 class="card-title">상품명</h5>
				</div>
				<ul class="list-group list-group-light list-group-small">
					<li class="list-group-item px-4">판매자</li>
					<li class="list-group-item px-4">가격</li>
					<li class="list-group-item px-4">주소</li>
				</ul>
				<div class="card-body">
					<a href="#" class="card-link">상세보기</a>
				</div>
			</div>
			
		</div>
</main>
<%@ include file="../footer.jsp"%>