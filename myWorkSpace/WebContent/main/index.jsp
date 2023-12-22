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

    <div class="row m-3 justify-content-start" style="display: flex; text-align: center;">
        <c:forEach var="product" items="${recentProduct}">
            <div class="card col-md-4 mb-5" style="width: 16rem; margin-right: 50px; padding: 10px;">
                <img src="${product.image}" class="card-img-top" alt="Product Image" />
                <div class="card-body">
                    <h5 class="card-title">${product.title}</h5>
                </div>
                <ul class="list-group list-group-light list-group-small">
                    <li class="list-group-item px-4" style="background-color:#BFF6B6;font-weight: bold; font-family: 'Arial', sans-serif;">판매자: ${product.user_name}</li>
                    <li class="list-group-item px-4">가격: ${product.price}</li>
                    <li class="list-group-item px-4">상품상태: ${product.productStatus}</li>
                </ul>
                <div class="card-body">
                    <a href="/myWorkSpace/detaiIitem.do?productno=${product.productno}" class="card-link">상세보기</a>
                </div>
            </div>
        </c:forEach>
    </div>

</main>
<%@ include file="../footer.jsp"%>