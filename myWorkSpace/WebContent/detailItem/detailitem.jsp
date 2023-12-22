<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail item</title>
<link href="/myWorkSpace/detailItem/detailitem.css" rel="stylesheet">
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
	<main>
		<div id="Product_container">
			<div id="Product_info1_container">
				<img id="Product_img" src="../imgfolder/bag.jpg">
			</div>
			
			<div id="Product_info2_container">
				<div>
					<h2 style="padding:10px;">${prodetail.title}</h2>
					<h2 style="padding:10px;">${prodetail.price}</h2>
				</div>
				<hr>
				
				<div id="info2_detail">
					<div style="padding:10px;">
						<span>찜하기 ♡ </span>
						<span><a id="go_MarketPrice" href="../marketPrice/MarketPrice.jsp">상품 시세 조회하러 가기</a></span><br><br>
						<span>상품상태</span><br>
						<span>${prodetail.productStatus}</span>
					</div>
					<div id="info2_img">
						<img>
					</div>
				</div>
				
				<div id="button_Container">
					<button id="chatBtn" >채팅하기</button>
					<button id="tradeBtn"><a href="/myWorkSpace/pay/pay.jsp">거래하기</a></button>
				</div>
			</div>
		</div>
		<hr>
		
		<div id="seller_container">
			<div id="Product_ment">
				<span>상품설명</span>
				<p>${prodetail.productDetail}</p>
			</div>
			
			<div id="Seller_info">
				<span>판매자 정보</span>
				<span>${UserId }</span>
			</div>
		</div>
		<hr>
		
		<div>
			<span>${ prodetail.tradelocation }</span>
			<div id="map">
				
			</div>
		</div>
	</main>
<%@ include file="../footer.jsp"%>
</body>
</html>