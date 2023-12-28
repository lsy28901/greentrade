<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sell info</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
.container {
	margin: 0;
}

.bg-green {
	background-color: #BFF6B6;
}

.text-black {
	color: black;
}

.bg-black {
	background-color: black;
}
</style>
</head>
<body>
	<main style="width:960px; margin:0 auto;">
		<div style="display:grid; grid-template-columns:1fr 1fr; border:1px solid; padding:20px; margin:40px auto;">
			<div style="display:grid; grid-template-rows:1fr 1fr;">
				<div style="display:grid; grid-template-columns:1fr 1fr;">
					<img src="${seller.imgurl }" style="width:80px; height:80px;" />
					<p>${seller.nickname }</p>
				</div>
				<div>
					<P>그린스코어</P>
					<div style="background-color:green; height:10px; width:80%">${seller.greenscore }</div>
				</div>
			</div>
			
			<div style="display:grid; grid-template-columns:1fr 1fr;">
				<div style="padding:10px;">
					<div style="display:flex; justify-content:center;">
						<p>거래후기</p>
					</div>
					<hr>
					<div style="display:flex; justify-content:center;">
						<a href="/myWorkSpace/review.do?userno=${ seller.userno}">${seller.reviewCount }</a>
					</div>
				</div>
				<div style="padding:10px;">
					<div style="display:flex; justify-content:center;">
						<p>단골</p>
					</div>
					<hr>
					<div style="display:flex; justify-content:center;">
						<p>0</p>
					</div>
				</div>
			</div>
		</div>
		
		<div style="border:1px solid; padding:20px; margin:40px auto;">
			<p>${seller.nickname }님의 전체 상품</p>
		<section class="">
		<div class="container  mt-2">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach var="product" items="${sellerItemList}">
					<div class="col mb-5">
						<div class="card h-100"
							style="transition: box-shadow 0.3s, cursor 0.3s; cursor: pointer;"
							onmouseover="this.style.boxShadow='0 0 10px rgba(0, 0, 0, 0.3)'"
							onmouseout="this.style.boxShadow='none'"
							onclick="location.href='/myWorkSpace/detaiIitem.do?productno=${product.productno}';">
							<!-- Sale badge-->
							<div class="badge bg-green text-black position-absolute"
								style="top: 0.5rem; right: 0.5rem">${product.paymethod}</div>
							<!-- Product image-->
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

		</div>
	</main>
<%@ include file="../footer.jsp"%>
</body>
</html>