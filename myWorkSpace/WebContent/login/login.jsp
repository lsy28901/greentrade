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

.login_text {
   margin: 30px auto 30px auto;
   width: 100px;
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
   position: absolute;
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


.naver_box{
   display: grid;
   grid-template-columns: 1fr 3fr;
   place-items: center;
   background-color : #25C52C;
   border-radius: 0px 8px 8px 0px;
   width: 399px;
   height:101px;
}

.kakao_box{
   display: grid;
   grid-template-columns: 1fr 3fr;
   place-items: center;
   background-color : #F6F61D;
   border-radius: 8px 0px 0px 8px;
   width: 402px;
   height:101px;
}

.select{
   margin: 0 auto;
   display: grid;
   grid-template-columns: 1fr 1fr 1fr;
   place-items: center;
   width: 500px;
}

.select a{
   color: gray;
}

.loginButton {
	float: right;
	margin-right: 30px;
}
.loginButton > input{
	background-color: #BFF6B6;
	width: 150px;
	height: 60px;
	border-radius: 10px;
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
		
		if(form.user_pw.value == ""){
			alert("패스워드를 입력하세요");
			return false;
		}
	}
</script>
<body>


<% 
	if(session.getAttribute("UserId") == null){
%>
   <div class="login_text">로그인</div>
   <hr style="width: 90%; background: black; margin: 0 auto;">
   <section class="body">
      <div class="container-body">
         <form action="/myWorkSpace/login.do" method="POST" class="form_box" name="loginFrm"
         onsubmit="return validateForm(this)">
            <div class="form-group">
               <label for="Id"></label>
               <input type="text" class="form-control" name="user_id" placeholder="아이디">
               <label for="Password"></label>
               <input type="password" class="form-control" name="user_pw"
                  placeholder="비밀번호">
            </div>
            <div class="loginButton">
	            <input type="submit" value="로그인">
            </div>
         </form>
      </div>
      <div class="anotherlog_box">
         <div class="kakao_box">
            <div>
               <img style="width:100px; height:100px; border-right:1px solid black;" src="../imgfolder/kakaologo.png">
            </div>
            <div>
               <a class="nav-link text-black" href="#">카카오 로그인</a>
            </div>
         </div>
         <div class="naver_box">
            <div>
               <img style="width:100px; height=100px; border-left:1px solid black; border-right:1px solid black;" 
               src="../imgfolder/naverlogo.png">
            </div>
            <div>
               <a class="nav-link text-black" href="#">네이버 로그인</a>
            </div>
         </div>
      </div>
      <div class="select">
         <div>
            <a href="#">아이디 찾기</a>
         </div>
         <div>
            <a href="#">비밀번호 찾기</a>
         </div>
         <div>
         <!--./join.jsp  -->
            <a href="/myWorkSpace/join.do">회원가입</a>
         </div>
      </div>
   </section>

   <%@ include file="../footer.jsp"%>	
   <%} else{ %>
   		<%-- <%=session.getAttribute("UserName") %> 회원님 로그인 성공
   		<a href="logout.jsp">[로그아웃]</a> --%>
   <%} %>
</body>
</html>