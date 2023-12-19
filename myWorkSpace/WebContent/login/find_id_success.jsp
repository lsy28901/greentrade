<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
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
* {
	margin: 0;
	padding: 0;
}

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

.body {
	width: 960px;
	margin: 0px auto;
	padding-top: 10px;
}

.findId_text {
	margin: 30px auto 30px auto;
	width: 250px;
	height: 36px;
	left: 680px;
	top: 360px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 400;
	font-size: 30px;
	line-height: 36px;
	text-align: center;
	color: #000000;
}

.container-body {
	margin: 30px auto 30px auto;
	border: 1px solid black;
	border-radius: height: 500px;
	box-sizing: border-box;
	position: relative;
	width: 960px;
	height: 450px;
	background: #FFFFFF;
	border: 1px solid rgba(0, 0, 0, 0.5);
	border-radius: 8px;
}

.info_box {
	margin: 25px;
	height: 400px;
	
}

.info_box button {
	margin: 0 20px;
	width: 147px;
	height: 72px;
	left: 648px;
	top: 342px;
	background: #BFF6B6;
	border-radius: 20px;
	float: right;
}

.info-group {
	border: 1px solid black;
	border-radius: 8px;
	width: 650px;
	height: 235px;
	margin: 50px auto;
	pdding: 0px;
	
	display: flex; 
	justify-content: center; 
	align-items:center;
	font-weight:bold;
	font-size: 25px;
}


</style>
<body>
	<div class="findId_text">아이디 찾기</div>
	<hr style="width: 90%; background: black; margin: 0 auto;">
	<section class="body">
		<div class="container-body">
			<div class="info_box">
				<div class="info-group">
					<p>가입 되어있는 아이디는 
					<span>______</span>입니다.</p>
				</div>
				<div>
					<button type="button" onclick="">취소</button>
					<button type="button" onclick="">비밀번호 찾기</button>
				</div>
			</div>
		</div>


	</section>

	<%@ include file="../footer.jsp"%>
</body>
</html>