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

.logo {
	position: absolute;
	width: 263px;
	height: 44px;
	left: 51px;
	top: 33px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 400;
	font-size: 36px;
	line-height: 44px;
	/* identical to box height */
	text-align: center;
	text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
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

.form_box {
	margin: 25px;
	border: 1px solid black;
	border-radius: 10px;
	height: 400px;
	border: 1px solid black;
}

.form_box button {
	margin: 0 20px;
	width: 147px;
	height: 72px;
	left: 648px;
	top: 342px;
	background: #BFF6B6;
	border-radius: 20px;
	float: right;
}

.form-group {
	margin: 50px auto;
	pdding: 0px;
}

.form-group input {
	margin: 0 auto;
	width: 600px;
	height: 80px;
}

.anotherlog_box {
	margin: 0 auto 40px auto;
	display: grid;
	grid-template-columns: auto auto;
	place-items: center;
	border: 1px solid black;
	border-radius: 8px;
	width: 804px;
	height: 103px;
}

.naver_box {
	display: grid;
	grid-template-columns: 1fr 3fr;
	place-items: center;
	background-color: #25C52C;
	border-radius: 0px 8px 8px 0px;
	width: 399px;
	height: 101px;
}

.kakao_box {
	display: grid;
	grid-template-columns: 1fr 3fr;
	place-items: center;
	background-color: #F6F61D;
	border-radius: 8px 0px 0px 8px;
	width: 402px;
	height: 101px;
}

.select {
	margin: 0 auto;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	place-items: center;
	width: 500px;
}

.select a {
	color: gray;
}
</style>
<body>
	<div class="findId_text">아이디 찾기</div>
	<hr style="width: 90%; background: black; margin: 0 auto;">
	<%if(request.getAttribute("userId") == null){ %>
	<section class="body">
		<div class="container-body">
			<form action="/myWorkSpace/findId.do" method="POST" class="form_box">
				<div class="form-group">
					<label for="Email"></label> <input type="text" class="form-control"
						name="email" placeholder="이메일"> 
					<label for="user_call"></label>
					<input type="text" class="form-control" name="user_call"
						placeholder="전화번호">
				</div>
				<div>
					<button type="submit" onclick="" value="아이디 찾기">아이디찾기</button>
				</div>
			</form>
		</div>


	</section>
	<%}else { %>
	<section class="body">
		<div class="container-body">
			<form action="" method="POST" class="form_box">
				<div class="form-group" style="justify-content:center; align-items:center;
				text-align: center; font-size: 20px;">
					가입된 아이디는<input style="width:80px; border:none; text-decoration: underline;
					font-size: 35px;"
					type="text" value="${userId}" />입니다.
				</div>
				<div>
					<button type="button" onclick="window.location.href='/myWorkSpace/login/login.jsp'">로그인으로 이동</button>
				</div>
			</form>
		</div>


	</section>
	<%} %>

	<%@ include file="../footer.jsp"%>
</body>
</html>