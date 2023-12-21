<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
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
	margin-top: 120px;
}

.form-group {
	overflow: auto;
	margin-bottom: 40px;
	pdding: 0px;
	height: 500px;
}

.form-group input {
	margin: 0 auto;
	width: 400px;
	height: 50px;
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

<script>
	function validateForm(form){
		//밑의 아이디와 비번 접근 방법 1//document.loginFrm.user_id.value;
		//validateForm()의 괄호안에 this가 있을경우 함수안에 아무 변수 지금은 form을 넣으면
		//위의 첫번째 접근 방법의 document.loginFrm부분을 생략 가능하다.
		form.user_id.value;
		
		//숫자 : 0 -> false, 0아니면 -> true
		//문자 :"" ->false, ""아니면 -> true
		
		if(!form.user_id.value){//
			alert("아이디를 입력하세요");
			form.user_id.focus();
			return false;
		}
		
		if(form.user_pwassword.value == ""){
			alert("패스워드를 입력하세요");
			return false;
		}
		
		if(form.email.value == ""){
			alert("이메일을 입력하세요");
			return false;
		}
		
		if(form.staff.value == ""){
			alert("역할을 입력하세요");
			return false;
		}
		
		if(form.address1.value == ""){
			alert("주소를 입력하세요");
			return false;
		}
		
		if(form.address12.value == ""){
			alert("상세주소를 입력하세요");
			return false;
		}
		
		if(form.postnum.value == ""){
			alert("우편번호를 입력하세요");
			return false;
		}
		
		
	}
	function loadFile(input) {
	    var file = input.files[0];	//선택된 파일 가져오기

	    //미리 만들어 놓은 div에 text(파일 이름) 추가
	    var name = document.getElementById('imgurl');
	    name.textContent = file.name;

	    //이미지 source 가져오기
	    newImage.src = URL.createObjectURL(file);   
	    
	    var nameInput = document.getElementById('imgurl');
	    
	    
	};
</script> 
<body>

	<div class="join_text">회원가입</div>
	<hr style="width: 90%; background: black; margin: 0 auto;">
	<section class="body">
		<div class="container-body">
			<form action="./joinProcess.jsp" method="POST" class="form_box" onsubmit="return validateForm(this)">

				<div>
					

					<div style="width:405px;justify-content:center; align-items: center; margin: 0 auto;">
				 		<div style="margin: 10px 0;">
				 			<label for="fname">
				 				사진등록 클릭</label>
				 		</div>
				 		<input style="visibility: hidden;" type="file" id="fname" accept="image/*" onchange="loadFile(this)">
				 			<p>FILE NAME:  <input type="text" id="imgurl" name="imgurl"> </p>
                    	
					</div>
				</div>
				
			
				<hr>
				<div class="form-group">
					<label for="user_name"></label>
					<input type="text" class="form-control"name="user_name" placeholder="이름">
					
					<label for="user_call"></label>
					<input type="text" class="form-control" name="user_call" placeholder="전화번호">
					
					<label for="user_id"></label>
					<input type="text" class="form-control"name="user_id" placeholder="아이디">
					 
					<label for="user_password"></label>
					<input type="password" class="form-control" name="user_password" placeholder="비밀번호">
					
					<label for="email"></label>
					<input type="text" class="form-control" name="email" placeholder="이메일">
					
					<label for="nickname"></label>
					<input type="text" class="form-control"name="nickname" placeholder="닉네임">
					
					<label for="staff"></label>
					<input type="text" class="form-control"name="staff" placeholder="역할">
					
					<label for="address1"></label>
					<input type="text" class="form-control"name="address1" placeholder="주소">
					
					<label for="address2"></label>
					<input type="text" class="form-control"name="address2" placeholder="상세주소">
					
					<label for="postnum"></label>
					<input type="text" class="form-control"name="postnum" placeholder="우편변호">
				</div>

				<div style="justify-content:center; align-items:center;">
					<button type="submit" class="regist_button">회원가입</button>
				</div>
			</form>
		</div>

	</section>

	<%@ include file="../footer.jsp"%>
</body>
</html>