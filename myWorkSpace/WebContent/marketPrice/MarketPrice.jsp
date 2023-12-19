<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시세조회</title>
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
		<div style="margin:40px auto; width:960px;">
			<h2 style="text-align:center;">시세조회</h2>
		</div>
		
		<div style="width:960px; margin:40px auto; display:flex; align-items:center; justify-content:center;">
			<input type="search" style="width:600px; height:30px; padding:20px;">
		</div>
		
		<div style="width:960px; height:450px; margin:40px auto; border:1px solid;">
			<div style="margin:20px;"><p>시세금액</p></div>
			
			<div style="display:flex; align-items:flex-end; height:80%; justify-content:space-between; margin:30px;">
				<div>
					<p>11,567원</p>
				</div>
				
				<div style="width:60%; height:80%; border:1px solid;">
					시세그래프
				</div>
			</div>
		</div>
	</main>
<%@ include file="../footer.jsp"%>
</body>
</html>