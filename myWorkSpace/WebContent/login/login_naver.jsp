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
:root{
	--body-background-color: white;
	--font-color: #4e4e4e;
	--border-gray-color : #dadada;
	--naver-green-color: #04c75a;
	--naver-green-border-color: #06b350;
}


*{
	margin:0;
	padding:0;
}

body{
	background:var(--body-background-color);
}

.main-container{
	width:100%;
	display:flex;
	flex-direction:column;
	align-items:center;
	margin-top: 21px;
}
.main-container .main-wrap{
	width:960px;
	margin: 50px 0;
	border:1px solid black;
	border-radius: 10px;
}

.main-container .main-wrap .logo-wrap{
	padding-top:55px;
}
.main-container .main-wrap .logo-wrap img
{
	width: 60px;
	height: 60px;
}



.main-container .main-wrap header .logo-wrap{
	display:flex;	
	flex-direction: column;
	align-items: center;
}
.login-input-section-wrap{
	padding-top: 30px;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-bottom: 100px;
}

.login-input-wrap{
	width: 465px;
	height :48px;
	border: solid 1px var(	--border-gray-color );
	background: white;
}
.password-wrap{
	margin-top: 13px;
}
.login-input-wrap input{
	border: none;
	width:430px;
	margin-top: 10px;
	font-size: 14px;
	margin-left: 10px;
	height:30px;
}
.login-button-wrap {
	padding-top: 13px;
}
.login-button-wrap button{
	width: 465px;
	height :48px;
	font-size: 18px;
	background: var(--naver-green-color);
	color: white;
	border: solid 1px var(--naver-green-border-color);
}
.login-stay-sign-in{
	width: 465px;
	height: 52px;
	
	display: flex;
	font-size: 15px;
	color: #4e4e4e;
	align-items: center;
	justify-content: flex-start;
	border-bottom: solid 1px var(--border-gray-color);
}
.login-stay-sign-in i{
	font-size: 25px;
	color: #9ba1a3;
}
.login-stay-sign-in span{
	padding-left: 5px;
	line-height: 25px;
}

.Easy-sgin-in-wrap{

	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 40px;

}
.Easy-sgin-in-wrap h2{
	font-size: 20px;
}
.Easy-sgin-in-wrap .sign-button-list
{
	padding-top:25px;
	list-style: none;
	width: 465px;
	display: flex;
	flex-direction: column;
	align-items: center;
}
.Easy-sgin-in-wrap .sign-button-list li{
	padding-bottom: 10px;
}
.Easy-sgin-in-wrap .sign-button-list li button{
	width: 465px;
	height: 56px;
	border: solid 1px var(--border-gray-color);
	text-align: left;
	background: white;
}
.Easy-sgin-in-wrap .sign-button-list li button i{
	padding-left: 15px;
	font-size: 20px;
}
.fa-qrcode
{
	color:var(--naver-green-color);
}
.fa-line{
	color:var(--naver-green-color);
}
.fa-facebook-square
{
	color:#4064ac;
}
.Easy-sgin-in-wrap .sign-button-list li button span{
	padding-left: 20px;
	font-size: 18px;
}
.Easy-sgin-in-wrap .forget-msg{
	color:var(--font-color);
	font-size: 14px;
	padding-top: 10px;

}

.copyright-wrap{

	display: flex;
	flex-direction: column;
	align-items: center;
	height: 15px;


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
<div class="main-container">
		<div class="main-wrap">
		<header>
			
			<div class="logo-wrap">
				<img src="../imgfolder/naverlogo.png">
			</div>
			<div style="margin: 0 auto; margin-top:20px;
			text-align:center; ">
				<p style="color:gray;">네이버에 로그인하여 <span style="font-weight:bold; font-size:18px; color:#25C52C;">중고나라 </span>서비스를</p> 
				<p style="color:gray;">이용하실 수 있습니다.</p>
				<p>공용 PC에서 사용하시는 경우 보안을 위해 서비스 이용 후</p>
				<p>반드시 로그아웃해 주세요</p>
			</div>
		</header>
		
		<section class="login-input-section-wrap">
			<div class="login-input-wrap">	
				<input placeholder="Username" type="text"></input>
			</div>
			<div class="login-input-wrap password-wrap">	
				<input placeholder="Password" type="password"></input>
			</div>
			<div class="login-button-wrap">
				<button>Sign in</button>
			</div>
		</section>
		
		</div>
	</div>

	<%@ include file="../footer.jsp"%>	
</body>
</html>