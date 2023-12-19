<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sell method</title>
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
	<main style="width:960px; height:500px; margin:10px auto;">
		<h3 style="padding:20px;">원하시는 거래 방법을 선택해주세요.</h3>
		
		<div style="display:grid; grid-tamplate-rows:1fr 1fr; grid-gap:50px; padding:20px;">
			<div style="border:1px solid; padding:10px;">
				<p style="font-weight:bold;">택배거래</p>
				<p>원하는 주소로 판매자에게 택배로 받을 수 있어요.</p>	
			</div>
			
			<div style="border:1px solid; padding:10px;">
				<p style="font-weight:bold;">직거래</p>	
				<p>채팅으로 약속을 정하고 직접 만나서 거래할수 있어요.</p>
			</div>
		</div>
	</main>
<%@ include file="../footer.jsp"%>
</body>
</html>