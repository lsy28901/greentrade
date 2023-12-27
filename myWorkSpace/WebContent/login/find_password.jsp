<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

.findPassword_text {
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

.container-body-after {
	margin: 30px auto 30px auto;
	border: 1px solid black;
	border-radius: height: 500px;
	box-sizing: border-box;
	position: relative;
	width: 960px;
	height: 600px;
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

.form_box_after{
	margin: 25px;
	border: 1px solid black;
	border-radius: 10px;
	height: 550px;
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

.submit_input input{
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
<script>

<script>
function validateForm(form){
	//밑의 아이디와 비번 접근 방법 1//document.loginFrm.user_id.value;
	//validateForm()의 괄호안에 this가 있을경우 함수안에 아무 변수 지금은 form을 넣으면
	//위의 첫번째 접근 방법의 document.loginFrm부분을 생략 가능하다.
	form.user_id.value;
	
	//숫자 : 0 -> false, 0아니면 -> true
	//문자 :"" ->false, ""아니면 -> true
	
	
	if(form.user_newpw.value == ""){
		alert("새로운 비밀번호를 입력해주세요");
		return false;
	}
	
	
	
}
</script>
<body><%
	if(request.getAttribute("Random") == null){
%>
	<div class="findPassword_text">비밀번호 찾기</div>
	<hr style="width: 90%; background: black; margin: 0 auto;">
	<section class="body">
		<div class="container-body">
			<form action="/myWorkSpace/findPassword.do" method="POST" class="form_box">
				<div class="form-group">
					<label for="Id"></label>
					<input type="text" class="form-control" name="user_id"
						placeholder="아이디">
						
						
					<!-- <label for="Email"></label> 
					<input type="text" class="form-control"
						name="user_email" placeholder="이메일">  -->
				</div>
				
				
				<div>
					<button type="submit" onclick="">찾기</button>
				</div>
				
				
			</form>
			 
			
			
		</div>


	</section>
	
	<% }else{ %>
	<div class="findPassword_text">비밀번호 변경</div>
	<hr style="width: 90%; background: black; margin: 0 auto;">
	<section class="body">
		<div class="container-body-after">
			<form action="/myWorkSpace/passwordUpdate.do" method="POST" class="form_box_after" onsubmit="return validateForm(this)">
				<div class="form-group">
				<label for="Id"></label>
						<input type="text" style="margin:0 auto;" class="form-control" name="user_id"
							placeholder="아이디" value="${Id}">
				<label for="user_pw"></label>
						<input type="text" class="form-control" name="user_pw"
							placeholder="비밀번호" value="${Random}">
				<label for="user_newpw"></label>
						<input type="text" class="form-control" name="user_newpw"
							placeholder="새비밀번호">		
				</div>
				
				
				<div class="submit_input">
					<input type="submit" value="비밀번호변경"></button>
				</div>
				
				
			</form>
			 
			
			
		</div>


	</section>
	<% } %>

	<%@ include file="../footer.jsp"%>
</body>
</html>