<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<img style="width:80px; height:80px;">
					<p>가방팔이</p>
				</div>
				<div>
					<P>그린스코어</P>
					<div style="background-color:green; height:10px; width:80%"></div>
				</div>
			</div>
			
			<div style="display:grid; grid-template-columns:1fr 1fr;">
				<div style="padding:10px;">
					<p>거래후기</p>
					<hr>
					<p>0</p>
				</div>
				<div style="padding:10px;">
					<p>단골</p>
					<hr>
					<p>0</p>
				</div>
			</div>
		</div>
		
		<div style="border:1px solid; padding:20px; margin:40px auto;">
			<p>전체 상품</p>
			<div style="display:grid; grid-template-columns:1fr 1fr 1fr 1fr; grid-gap:10px;">
				<img style="width:100%; height:250px;">
				<img style="width:100%; height:250px;">
				<img style="width:100%; height:250px;">
				<img style="width:100%; height:250px;">
			</div>
		</div>
	</main>
<%@ include file="../footer.jsp"%>
</body>
</html>