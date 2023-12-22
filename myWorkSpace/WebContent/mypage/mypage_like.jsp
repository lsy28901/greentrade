<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<div class="container-fluid">
	<main class="container-fluid mt-4" id="main" style="width: 960px; height: 100%; margin: 30px auto;">
		<div class="row">
			<section class="col-md-9">
				<div id="main-content" class="border p-4 rounded bg-white"
					style="min-height: 600px;">
					<div class="mb-4">
						<div class="d-flex align-items-center mb-4">
							<div class="bg-secondary rounded-circle h-12 w-12"></div>
							<span class="font-weight-bold" style="font-size: 24px;">찜
								목록</span>
						</div>
						<hr>
						<div class="row m-3 justify-content-center"
							style="display: flex; text-align: center;">
							<div class="card col-md-3 mb-5"
								style="width: 16rem; margin-right: 50px; padding: 10px;">
								<img
									src="https://mdbcdn.b-cdn.net/img/new/standard/city/062.webp"
									class="card-img-top" alt="Chicago Skyscrapers" />
								<div class="card-body">
									<h5 class="card-title">상품명</h5>
								</div>
								<ul class="list-group list-group-light list-group-small">
									<li class="list-group-item px-4">판매자</li>
									<li class="list-group-item px-4">가격</li>
									<li class="list-group-item px-4">주소</li>
								</ul>
								<div class="card-body">
									<a href="#" class="card-link">상세보기</a>
								</div>
							</div>
							<div class="card col-md-3 mb-5"
								style="width: 16rem; margin-right: 50px; padding: 10px;">
								<img
									src="https://mdbcdn.b-cdn.net/img/new/standard/city/062.webp"
									class="card-img-top" alt="Chicago Skyscrapers" />
								<div class="card-body">
									<h5 class="card-title">상품명</h5>
								</div>
								<ul class="list-group list-group-light list-group-small">
									<li class="list-group-item px-4">판매자</li>
									<li class="list-group-item px-4">가격</li>
									<li class="list-group-item px-4">주소</li>
								</ul>
								<div class="card-body">
									<a href="#" class="card-link">상세보기</a>
								</div>
							</div>
							<div class="card card col-md-3 mb-5"
								style="width: 16rem; margin-right: 50px; padding: 10px;">
								<img
									src="https://mdbcdn.b-cdn.net/img/new/standard/city/062.webp"
									class="card-img-top" alt="Chicago Skyscrapers" />
								<div class="card-body">
									<h5 class="card-title">상품명</h5>
								</div>
								<ul class="list-group list-group-light list-group-small">
									<li class="list-group-item px-4">판매자</li>
									<li class="list-group-item px-4">가격</li>
									<li class="list-group-item px-4">주소</li>
								</ul>
								<div class="card-body">
									<a href="#" class="card-link">상세보기</a>
								</div>
							</div>
							<div class="card col-md-3 mb-5"
								style="width: 16rem; margin-right: 50px; padding: 10px;">
								<img
									src="https://mdbcdn.b-cdn.net/img/new/standard/city/062.webp"
									class="card-img-top" alt="Chicago Skyscrapers" />
								<div class="card-body">
									<h5 class="card-title">상품명</h5>
								</div>
								<ul class="list-group list-group-light list-group-small">
									<li class="list-group-item px-4">판매자</li>
									<li class="list-group-item px-4">가격</li>
									<li class="list-group-item px-4">주소</li>
								</ul>
								<div class="card-body">
									<a href="#" class="card-link">상세보기</a>
								</div>
							</div>

						</div>
					</div>
			</section>
				<aside class="col-md-3">
				<div class="border p-4 rounded bg-white text-center"
					style="min-height: 600px; height: 100%">
					<nav>
						<ul class="nav flex-column">
							<li class="nav-item mb-2"><a href="/myWorkSpace/mypageEdit.do"
								class="nav-link text-success border rounded p-2"
								id="manager_memberListMenu">내 정보 수정</a></li>
							<li class="nav-item mb-2"><a href="/myWorkSpace/mypage/mypage_like.jsp"
								class="nav-link text-success border rounded p-2"
								id="manager_reportListMenu">찜 목록</a></li>
							<li class="nav-item mb-2"><a href="/myWorkSpace/mypage/mypage_buylog.jsp"
								class="nav-link text-success border rounded p-2">구매 현황</a></li>
							<li class="nav-item mb-2"><a href="/myWorkSpace/mypage/mypage_selllog.jsp"
								class="nav-link text-success border rounded p-2">판매 현황</a></li>
							<li class="nav-item mb-2"><a href="/myWorkSpace/mypage/mypage_buylist.jsp"
								class="nav-link text-success border rounded p-2">구매 내역</a></li>
							<li class="nav-item mb-2"><a href="/myWorkSpace/mypage/mypage_selllist.jsp"
								class="nav-link text-success border rounded p-2">판매 내역</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link text-success border rounded p-2">판매자 평가</a></li>
							<li class="nav-item mb-2"><a href="/myWorkSpace/faqList.do"
								class="nav-link text-success border rounded p-2">자주 묻는 질문</a></li>
						</ul>
					</nav>
				</div>
			</aside>
		</div>
	</main>
</div>

<%@ include file="../footer.jsp"%>