<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail item</title>
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
	<main style="margin:20px auto; padding:20px; width:960px;">
		<div style="display:grid; grid-template-columns:1fr 1fr; grid-gap:10px; margin-bottom:20px;">
			<div style="border:1px solid; width:100%; height:350px; padding:10px;">
				<img src="../imgfolder/bag.jpg" style="width:100%; height:100%;">
			</div>
			
			<div style="border:1px solid; width:100%; height:350px; padding:10px;">
				<div>
					<h2 style="padding:10px;">군인 가방 보급 백팩</h2>
					<h2 style="padding:10px;">13,000원</h2>
				</div>
				<hr>
				
				<div style="display:grid; height:30%; grid-template-columns:auto auto;">
					<div style="padding:10px;">
						<span>찜하기 ♡ </span>
						<span><a href="../marketPrice/MarketPrice.jsp">상품 시세 조회하러 가기</a></span><br><br>
						<span>상품상태</span><br>
						<span>새상품</span>
					</div>
					<div style="border:1px solid;">
						<img>
					</div>
				</div>
				
				<div style="display:grid; grid-template-columns:1fr 1fr; grid-gap:10px; height:15%; margin-top:20px;">
					<button style="width:100%;">채팅하기</button>
					<button style="width:100%;">거래하기</button>
				</div>
			</div>
		</div>
		<hr>
		
		<div style="display:grid; grid-template-columns:1fr 1fr; grid-gap:10px; margin-top:20px; margin-bottom:20px;">
			<div style="border:1px solid; width:100%; height:300px; padding:10px;">
				<span>상품설명</span>
			</div>
			
			<div style="border:1px solid; width:100%; height:300px; padding:10px;">
				<span>판매자 정보</span>
			</div>
		</div>
		<hr>
		
		<div>
			<span>서울시, 강남구</span>
			<div style="border:1px solid; width:100%; height:350px;">
			
			</div>
		</div>
	</main>
<%@ include file="../footer.jsp"%>
</body>
</html>