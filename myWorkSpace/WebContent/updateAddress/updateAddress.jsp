<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update Address</title>
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
	<main style="width:960px; margin:10px auto;">
		<form style="display:grid; grid-template-rows:1fr 1fr 1fr 1fr 1fr 1fr; grid-gap:20px; padding:20px; margin:40px auto;">
			<input type="text" placeholder="배송지명" style="padding:20px;">
			<input type="text" placeholder="이름입력" style="padding:20px;">
			<input type="text" placeholder="휴대폰 번호" style="padding:20px;">
			<input type="text" placeholder="주소 검색" style="padding:20px;">
			<input type="text" placeholder="상세 주소" style="padding:20px;">
			<button type="submit" style="padding:20px; background-color:black; color:white;">완료</button>
		</form>
	</main>
<%@ include file="../footer.jsp"%>
</body>
</html>