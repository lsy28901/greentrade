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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
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
.photo_box{
	width:300px;
	height:200px
	display:flex;
}
.photo_regist{
	cursor: pointer;
}
.photo_view{
	margin-top: 0px;;
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
		name.value = file.name;//파일 이름 가져오는 역할
	    
	  //새로운 이미지 div 추가
	    var newImage = document.createElement("img");
	    newImage.setAttribute("class", 'img');
		
	    //이미지 source 가져오기
	    newImage.src = URL.createObjectURL(file);   
	  
        
	    newImage.style.width = "70px";
	    newImage.style.height = "70px";
	    //newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지를 숨긴다
	    newImage.style.objectFit = "contain";
	    
	    //이미지를 image-show div에 추가
	    var container = document.getElementById('image-show');
	    container.appendChild(newImage);
	    document.getElementById('image-upload').style.visibility = 'hidden';
	    document.getElementById('photo_regist').style.height = '0px';
	    
	    
	};
</script> 
<body>

	<div class="join_text">회원가입</div>
	<hr style="width: 90%; background: black; margin: 0 auto;">
	<section class="body">
		<div class="container-body">
			<form action="/myWorkSpace/join.do" method="POST" class="form_box" onsubmit="return validateForm(this)">

				
					<div class="photo_box" style="width:405px;justify-content:center; align-items: center; margin: 0 auto;">
				 		<div class="photo_view">
				 			<input style="visibility: hidden;" type="file" id="fname" accept="image/*" onchange="loadFile(this)" multiple/>
				 				<input style="visibility: hidden;" type="text" id="imgurl" name="imgurl">
				 				<div id="image-show" style="display:flex; justify-content:right;
				 				align-items:end;
				 				width:230px;">
				 				
				 				</div>
				 		</div>
				 		<div class="photo_regist" id="photo_regist">
				 			<label id="image-upload" for="fname" style="cursor:pointer; border:1px solid; 
				 			background: #BFF6B6;
							border-radius: 4px;
							text-align: center; 
							align-items: center;
							padding:1px;
							width:120px;
							margin-top:12px;">
				 				사진등록 클릭</label>
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
					
					<label for="postnum"></label>
					<input type="text" id="sample6_postcode" placeholder="우편번호" class="form-control" name="postnum" >
					<input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="form-control"
					style="background: #BFF6B6;"><br>
					
					<label for="address1"></label>
					<input type="text" id="sample6_address" placeholder="주소" class="form-control"name="address1"><br>
					
					<label for="address2"></label>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" class="form-control" name="address2">
					
					<label for="sample6_extraAddress"></label>
					<input style="visibility:hidden;" type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-control" name="extraAddress">
					
					<label for="staff"></label>
					<input type="text" class="form-control"name="staff" value="user" style="visibility: hidden;">
				</div>
				


				<div style="justify-content:center; align-items:center;">
					<button type="submit" class="regist_button" id="regist_button">회원가입</button>
				</div>
			</form>
		</div>

	</section>

	<%@ include file="../footer.jsp"%>
</body>
</html>