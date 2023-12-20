<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Green Trade</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="/myWorkSpace/style.css" rel="stylesheet">
<link href="/myWorkSpace/additem.css" rel="stylesheet" >
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/myWorkSpace/manager_script.js"></script>
<style>
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

main {
	max-width: 960px;
}

#board-table thead th {
	background-color: #D5F4DF; /* 배경색 지정 */
}

a {
	text-decoration: none;
	color: inherit;
}
</style>
<body>
	<header>
		<nav class="navbar navbar-expand-sm bg-green navbar-dark">
			<div class="container-fluid ">
				<a class="navbar-brand col-md-4 text-black" href="/myWorkSpace/index.do">Green
					Trade</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<form class="d-flex col-md-4">
					<input class="form-control me-2 " type="text" placeholder="Search">
					<button class="btn btn-primary bg-black" type="button">Search</button>
				</form>
				<div class="collapse navbar-collapse col-md-4 justify-content-end "
					id="collapsibleNavbar">
					<ul class="navbar-nav ">
						<li class="nav-item "><a class="nav-link mr-3 text-black"
							href="#">채팅하기</a></li>
						<li class="nav-item "><a class="nav-link mr-3 text-black"
							href="/myWorkSpace/additem/additem.jsp">판매하기</a></li>
						<li class="nav-item "><a class="nav-link mr-3 text-black"
							href="/myWorkSpace/mypage/mypage_main.jsp">마이페이지</a></li>
					</ul>
				</div>

			</div>

		</nav>

		<nav class="navbar navbar-expand-sm bg-green navbar-dark">
			<div class="container-fluid">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link text-black"
						href="/myWorkSpace/login/product_list.jsp">상품목록</a></li>
					<li class="nav-item"><a class="nav-link text-black"
						href="/myWorkSpace/login/product_best.jsp">인기상품</a></li>
					<li class="nav-item"><a class="nav-link text-black"
						href="/myWorkSpace/login/product_share.jsp">나눔</a></li>
				</ul>
			</div>
		</nav>
	</header>