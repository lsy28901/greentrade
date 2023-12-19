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

.join_text {
	margin: 30px auto 30px auto;
	width: 120px;
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
	box-sizing: border-box;
	position: relative;
	width: 960px;
	height:	930px;
	background: #FFFFFF;
	border: 1px solid rgba(0, 0, 0, 0.5);
	border-radius: 8px;
}

.form_box {
	display: grid;
	grid-template-rows: 1fr 1fr 1fr;
	margin: 25px;
	border: 1px solid black;
	border-radius: 10px;
	height: 760px;
	border: 1px solid black;
}

.regist_button {
	width: 147px;
	height: 72px;
	float : right;
	background: #BFF6B6;
	border-radius: 20px;
	justify-content: center; 
	align-items: center;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 85px;
	pdding: 0px;
}

.form-group input {
	margin: 0 auto;
	width: 400px;
	height: 80px;
}

.profile_photo{
	margin: 10px auto;
	justify-content: center;
	align-items: center;
	width: 100px;
	height: 100px;
	
}
.profile_photo img{
	width: 100px;
	height: 100px;
	margin: 0 auto;
	
}
.potho_button {
	width: 147px;
	height: 40px;
	align-items: center;
	justify-content: center;
}
</style>
<body>

	<div class="join_text">회원가입</div>
	<hr style="width: 90%; background: black; margin: 0 auto;">
	<section class="body">
		<div class="container-body">
			<form action="./" method="POST" class="form_box">

				<div style="display: grid; grid-template-rows: 1fr 0.3fr;">
					<div class="profile_photo">
						<img src="../imgfolder/profile.png">
					</div>

					<div style="display:flex; justify-content:center; align-items: center;">
				 		<button type="submit" class="photo_button" href="#">
								프로필 사진 등록
						</button>
					</div>
				</div>
				
			
				<hr>
				<div class="form-group">
					<label for="id"></label>
					 <input type="text" class="form-control"name="id" placeholder="아이디">
					 <label for="Password"></label>
					<input type="password" class="form-control" name="pw" placeholder="비밀번호">
					<label for="Email"></label>
					<input type="text" class="form-control" name="email" placeholder="이메일">
					<label for="PhoneNum"></label>
					<input type="text" class="form-control" name="phonenum" placeholder="전화번호">
					<label for="Address"></label>
					<input type="text" class="form-control" name="addresss" placeholder="주소">
				</div>

				<div>
					<button type="submit" class="regist_button" href="#">회원가입</button>
				</div>
			</form>
		</div>

	</section>

	<%@ include file="../footer.jsp"%>
</body>
</html>