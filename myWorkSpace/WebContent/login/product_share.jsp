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

.body {
	overflow: auto;
	width: 70%;
	height:900px;
	margin: 0px auto;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	grid-gap: 5%;
}

.title_box{
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	width:90%;
	height: 50px;
	justify-content: center;
	align-items: center;
	margin-left: 5%;
	margin-top: 1%;
}

.title_text{
	font-size: 39px;
	float: left;
}

.select{
	background: #BFF6B6;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	width:100%;
	height:70%;
	border-radius: 4px 4px 0 0;
	
}

.select a{
	display: flex;
	justify-content: center;
    align-items: center;
    font-size : 20px;
    font-weight: bold;
}
.select a:hover{
  text-decoration: underline; 
}


.item{
	margin: 25% auto;
	border: 1px solid black;
	border-left: none;
	width:100%;
	height: 230px;
	display: grid;
	grid-template-columns: 1fr 1fr;
}
.item-img{
	display:flex;
	justify-content:center;
	align-items: center;
} 
.item-img img{
	object-fit: cover;
	width:230px;
	height: 230px;
}
.item-detail{
	margin-top: 20px;
	margin-left: 20px;
	display:inline-block;
	text-align:center;
	align-items: center;
}



</style>
<body>

	<div class="title_box">
		<div class="title_text">나눔</div>
		<div></div>
		<div class="select">
				<a class="nav-link text-white" href="#">제품 목록</a>
				<a class="nav-link text-white" href="#">인기 제품</a>
				<a class="nav-link text-white" href="#">나눔</a>
		</div>
	</div>
	<hr style="width: 90%; background: black; margin: 0 auto;">
	
	<section class="body">
		<div class="item">
			<div class="item-img" style="border-right:1px solid black">
				<img src="../imgfolder/clothes1.png"/>
			</div>
			<div class="item-detail">
				<p>스웨터</p>
				<p>나눔자: 인천 계양구</p>
			</div>
		</div>
		
		<div class="item">
			<div class="item-img" style="border-right:1px solid black">
				<img src="../imgfolder/clothes2.png"/>
			</div>
			<div class="item-detail">
				<p>스웨터</p>
				<p>나눔자: 인천 계양구</p>
			</div>
		</div>
		
		<div class="item">
			<div class="item-img" style="border-right:1px solid black">
				<img src="../imgfolder/clothes3.png"/>
			</div>
			<div class="item-detail">
				<p>스웨터</p>
				<p>나눔자: 인천 계양구</p>
			</div>
		</div>
		
		<div class="item">
			<div class="item-img" style="border-right:1px solid black">
				<img src="../imgfolder/clothes1.png"/>
			</div>
			<div class="item-detail">
				<p>스웨터</p>
				<p>나눔자: 인천 계양구</p>
			</div>
		</div>
		
		<div class="item">
			<div class="item-img" style="border-right:1px solid black">
				<img src="../imgfolder/clothes2.png"/>
			</div>
			<div class="item-detail">
				<p>스웨터</p>
				<p>나눔자: 인천 계양구</p>
			</div>
		</div>
		
		<div class="item">
			<div class="item-img" style="border-right:1px solid black">
				<img src="../imgfolder/clothes3.png"/>
			</div>
			<div class="item-detail">
				<p>스웨터</p>
				<p>나눔자: 인천 계양구</p>
			</div>
		</div>
		
		<div class="item">
			<div class="item-img" style="border-right:1px solid black">
				<img src="../imgfolder/clothes1.png"/>
			</div>
			<div class="item-detail">
				<p>스웨터</p>
				<p>나눔자: 인천 계양구</p>
			</div>
		</div>
		
		<div class="item">
			<div class="item-img" style="border-right:1px solid black">
				<img src="../imgfolder/clothes2.png"/>
			</div>
			<div class="item-detail">
				<p>스웨터</p>
				<p>나눔자: 인천 계양구</p>
			</div>
		</div>
		
		<div class="item">
			<div class="item-img" style="border-right:1px solid black">
				<img src="../imgfolder/clothes3.png"/>
			</div>
			<div class="item-detail">
				<p>스웨터</p>
				<p>나눔자: 인천 계양구</p>
			</div>
		</div>
		
		<div class="item">
			<div class="item-img" style="border-right:1px solid black">
				<img src="../imgfolder/clothes1.png"/>
			</div>
			<div class="item-detail">
				<p>스웨터</p>
				<p>나눔자: 인천 계양구</p>
			</div>
		</div>
		
		<div class="item">
			<div class="item-img" style="border-right:1px solid black">
				<img src="../imgfolder/clothes2.png"/>
			</div>
			<div class="item-detail">
				<p>스웨터</p>
				<p>나눔자: 인천 계양구</p>
			</div>
		</div>
		
		<div class="item">
			<div class="item-img" style="border-right:1px solid black">
				<img src="../imgfolder/clothes3.png"/>
			</div>
			<div class="item-detail">
				<p>스웨터</p>
				<p>나눔자: 인천 계양구</p>
			</div>
		</div>
		
		<div class="item">
			<div class="item-img" style="border-right:1px solid black">
				<img src="../imgfolder/clothes1.png"/>
			</div>
			<div class="item-detail">
				<p>스웨터</p>
				<p>나눔자: 인천 계양구</p>
			</div>
		</div>
		
		<div class="item">
			<div class="item-img" style="border-right:1px solid black">
				<img src="../imgfolder/clothes2.png"/>
			</div>
			<div class="item-detail">
				<p>스웨터</p>
				<p>나눔자: 인천 계양구</p>
			</div>
		</div>
		
		<div class="item">
			<div class="item-img" style="border-right:1px solid black">
				<img src="../imgfolder/clothes3.png"/>
			</div>
			<div class="item-detail">
				<p>스웨터</p>
				<p>나눔자: 인천 계양구</p>
			</div>
		</div>
			
	</section>

	<%@ include file="../footer.jsp"%>
</body>
</html>