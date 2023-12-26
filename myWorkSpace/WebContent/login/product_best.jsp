<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pay</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>

.body {
	overflow: auto;
	width: 70%;
	height:900px;
	margin: 0px auto;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	grid-gap: 5%;
}

.title_box{
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	width:90%;
	height: 50px;
	justify-content: center;
	align-items: center;
	margin-left: 5%;
	margin-top: 1%;
}

.title_text{
	font-size: 39px;
	float: left;
}

.select{
	background: #BFF6B6;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	width:100%;
	height:70%;
	border-radius: 4px 4px 0 0;
	
}

.select a{
	display: flex;
	justify-content: center;
    align-items: center;
    font-size : 20px;
    font-weight: bold;
}
.select a:hover{
  text-decoration: underline; 
}


.item{
	margin: 25% auto;
	border: 1px solid black;
	border-left: none;
	width:100%;
	height: 230px;
	display: grid;
	grid-template-columns: 1fr 1fr;
}
.item-img{
	display:flex;
	justify-content:center;
	align-items: center;
} 
.item-img img{
	object-fit: cover;
	width:230px;
	height: 230px;
}
.item-detail{
	margin-top: 20px;
	margin-left: 20px;
	display:inline-block;
	text-align:center;
	align-items: center;
}

.grade{
	display: inline-flex;
	align-items: center;
	justify-content: center;
	border: 1px solid white;
	border-radius:25px;
	width: 50px;
	height:50px;
	background-color:  rgb(254, 222, 132);;
	font-weight: bold;
	color: black;
}

</style>
<body>

	<div class="title_box">
		<div class="title_text">나눔</div>
	</div>
	<hr style="width: 90%; background: black; margin: 0 auto;">
	
	<main style="width: 960px; height: 100%; margin: 30px auto;">
	<section class="">
		<div class="container  mt-2">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
				<c:forEach var="productbest" items="${productbest}">
					<div class="col mb-5">
						<div class="card h-100"
							style="transition: box-shadow 0.3s, cursor 0.3s; cursor: pointer;"
							onmouseover="this.style.boxShadow='0 0 10px rgba(0, 0, 0, 0.3)'"
							onmouseout="this.style.boxShadow='none'"
							onclick="location.href='/myWorkSpace/detaiIitem.do?productno=${productbest.productno}';">
							<!-- Sale badge-->
							<div class="badge bg-green text-black position-absolute"
								style="top: 0.5rem; right: 0.5rem">${productbest.paymethod}</div>
							<!-- Product image-->
							<img class="card-img-top h-100" src="${productbest.image}" />
							<!-- Product details-->
							<div class="card-body p-4">
								<div class="text-center">
									<!-- Product name-->
									<h5 class="fw-bolder">${productbest.title}</h5>
									<div class="text-secondary">${productbest.price}원</div>
									<!-- Product reviews-->
									<div class="d-flex justify-content-center text-success mb-2">
										<div class="bi-star-fill mt-2">${productbest.productStatus}</div>
									</div>
									<div class="d-flex justify-content-center  mb-2">
										<div class="bi-star-fill text-danger mt-2">${productbest.adddate}</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	
	</main>

	<%@ include file="../footer.jsp"%>
</body>
</html>