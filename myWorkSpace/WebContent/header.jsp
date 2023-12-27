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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


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
	<%
		String userStaff = (String) session.getAttribute("UserStaff");
		if(session.getAttribute("UserId") == null){
	%>
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
					<input id="searchInput" class="form-control me-2" type="text" placeholder="검색어를 입력하세요">
					<button id="searchButton" class="btn btn-primary bg-black" type="button" style="min-width:70px">검색</button>
				</form>
				<div class="collapse navbar-collapse col-md-4 justify-content-end "
					id="collapsibleNavbar">
					<ul class="navbar-nav ">
						<li class="nav-item "><a class="nav-link mr-3 text-black"
							href="#">채팅하기</a></li>
						<li class="nav-item "><a class="nav-link mr-3 text-black"
							href="/myWorkSpace/additem/additem.jsp">판매하기</a></li>
							<li class="nav-item "><a class="nav-link mr-3 text-black"
							href="/myWorkSpace/login/login.jsp">로그인</a></li>
					</ul>
				</div>

			</div>

		</nav>

		<nav class="navbar navbar-expand-sm bg-green navbar-dark">
			<div class="container-fluid">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link text-black"
						href="/myWorkSpace/productList.do">상품목록</a></li>
					<li class="nav-item"><a class="nav-link text-black"
						href="/myWorkSpace/productBest.do">인기상품</a></li>
					<li class="nav-item"><a class="nav-link text-black"
						href="/myWorkSpace/productShare.do">나눔</a></li>
				</ul>
			</div>
		</nav>
	</header>
	 <%} else{ %>
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
					<input id="searchInputLogin" class="form-control me-2" type="text" placeholder="검색어를 입력하세요">
					<button id="searchButtonLogin" class="btn btn-primary bg-black" type="button" style="min-width:70px">검색</button>
				</form>
				<div class="collapse navbar-collapse col-md-4 justify-content-end "
					id="collapsibleNavbar">
					<ul class="navbar-nav ">
						<li class="nav-item "><a class="nav-link mr-3 text-black"
							href="/myWorkSpace/chatting/chating.jsp?UserNo=<%=session.getAttribute("UserNo")%>">채팅하기</a></li>
						<li class="nav-item "><a class="nav-link mr-3 text-black"
							href="/myWorkSpace/additem/additem.jsp">판매하기</a></li>
							<li class="nav-item "><a class="nav-link mr-3 text-black"
							href="/myWorkSpace/login/logout.jsp" onclick="kakaoLogout()">로그아웃</a></li>
						<%if("manager".equals(userStaff)) {%>
						<li class="nav-item "><a class="nav-link mr-3 text-black"
							href="/myWorkSpace/manager/manager_main.jsp">관리자 페이지</a></li>
						<%}else{ %>
						<li class="nav-item "><a class="nav-link mr-3 text-black"
							href="/myWorkSpace/mypageMain.do">마이페이지</a></li>
						<%} %>
					</ul>
				</div>

			</div>

		</nav>

		<nav class="navbar navbar-expand-sm bg-green navbar-dark">
			<div class="container-fluid">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link text-black"
						href="/myWorkSpace/productList.do">상품목록</a></li>
					<li class="nav-item"><a class="nav-link text-black"
						href="/myWorkSpace/productBest.do">인기상품</a></li>
					<li class="nav-item"><a class="nav-link text-black"
						href="/myWorkSpace/productShare.do">나눔</a></li>
				</ul>
			</div>
		</nav>
	</header>
	 
   		<%-- <%=session.getAttribute("UserName") %> 회원님 로그인 성공
   		<a href="logout.jsp">[로그아웃]</a> --%>
   <%} %>
   <script>
	$(document).ready(function() {
	    $("#searchButton").click(function() {
	        var keyword = $("#searchInput").val(); // 검색어를 가져옴
	        
	        // 검색어가 비어있지 않은 경우에만 검색 요청을 보냄
	        if (keyword.trim() !== "") {
	            // AJAX 요청을 사용하여 검색어를 서버로 보냄
	            $.ajax({
	                type: "GET", // 또는 "POST" 등 HTTP 요청 방식 선택
	                url: "/myWorkSpace/search.do", // 검색 요청을 처리할 서블릿 또는 컨트롤러 URL
	                data: { keyword: keyword }, // 검색어를 전달
	                success: function(data) {
	                    window.location.href = "/myWorkSpace/search.do?keyword=" + keyword
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    alert("검색 요청 실패: " + textStatus);
	                }
	            });
	        } else {
	            alert("검색어를 입력하세요.");
	        }
	    });
	    $("#searchButtonLogin").click(function() {
	        var keyword = $("#searchInputLogin").val(); // 검색어를 가져옴
	        
	        // 검색어가 비어있지 않은 경우에만 검색 요청을 보냄
	        if (keyword.trim() !== "") {
	            // AJAX 요청을 사용하여 검색어를 서버로 보냄
	            $.ajax({
	                type: "GET", // 또는 "POST" 등 HTTP 요청 방식 선택
	                url: "/myWorkSpace/search.do", // 검색 요청을 처리할 서블릿 또는 컨트롤러 URL
	                data: { keyword: keyword }, // 검색어를 전달
	                success: function(data) {
	                    window.location.href = "/myWorkSpace/search.do?keyword=" + keyword
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    alert("검색 요청 실패: " + textStatus);
	                }
	            });
	        } else {
	        	alert("검색어를 입력하세요.");
	        }
	    });
	    
	    $("#searchInput").keypress(function(event) {
	        if (event.which === 13) {
	            event.preventDefault();
	            $("#searchButton").click();
	        }
	    });
	    $("#searchInputLogin").keypress(function(event) {
	        if (event.which === 13) {
	            event.preventDefault();
	            $("#searchButtonLogin").click();
	        }
	    });
	});
	
	function kakaoLogout() {
		   Kakao.Auth.logout(function() {
		      // 로그아웃 성공 시 추가적인 처리 가능
		      // 서버 세션을 삭제하는 등의 작업이 필요하다면 이 부분에 추가
		      alert("카카오 계정에서 로그아웃되었습니다.");

		      // 로그아웃 후 리다이렉트할 페이지 (원하는 페이지로 수정)
		      window.location.href = '/myWorkSpace/login/logout.jsp';
		   });
		}
	</script>