<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<div class="container-fluid">
	<main class="container-fluid mt-4" id="main" style="width: 960px; height: 100%; margin: 30px auto;">
		<div class="row">
			<section class="col-md-9 " style="">
				<div id="main-content" class="border p-4 rounded bg-white"
					style="min-height: 600px;">
					<div class="mb-4">
						<div class="d-flex align-items-center mb-4">
							<div class="bg-secondary rounded-circle h-12 w-12"></div>
							<span class="font-weight-bold" style="font-size: 24px;">구매
								내역</span>
						</div>
						<hr>

						<div class="container mt-3" style="font-size: 12px;">
							<div class="row">
								<!-- 상품 카드 1 -->
								<div class="col-md-6">
									<div class="card" style="max-height: 250px;">
										<!-- 인라인 스타일로 최대 너비 설정 -->
										<div class="row no-gutters">
											<!-- 왼쪽에는 사진 -->
											<div class="col-md-6">
												<img src="../imgfolder/clothes1.png" alt="상품 사진 1"
													class="card-img" style="max-height: 250px; height:100%;">
												<!-- 이미지 최대 높이 설정 -->
											</div>
											<!-- 오른쪽에는 상품 정보 -->
											<div class="col-md-6">
												<div class="card-body">
													<h6 class="card-title">상품 제목 2</h6>
													<p class="card-text">결제</p>

													<p class="card-text">
														<strong>판매자:</strong>
													</p>
													<p class="card-text">
														<strong>가격:</strong> 200000원
													</p>
													<p class="card-text">
														<strong style="cursor: pointer;">판매자 평가하기</strong>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- 상품 카드 2 -->

								<div class="col-md-6">
									<div class="card" style="max-height: 250px;">
										<!-- 인라인 스타일로 최대 너비 설정 -->
										<div class="row no-gutters">
											<!-- 왼쪽에는 사진 -->
											<div class="col-md-6">
												<img src="../imgfolder/clothes1.png" alt="상품 사진 1"
													class="card-img" style="max-height: 250px;  height:100%;">
												<!-- 이미지 최대 높이 설정 -->
											</div>
											<!-- 오른쪽에는 상품 정보 -->
											<div class="col-md-6">
												<div class="card-body">
													<h6 class="card-title">상품 제목 2</h6>
													<p class="card-text">결제</p>

													<p class="card-text">
														<strong>판매자:</strong>
													</p>
													<p class="card-text">
														<strong>가격:</strong> 200000원
													</p>
													<p class="card-text">
														<strong style="cursor: pointer;">판매자 평가하기</strong>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="container mt-3" style="font-size: 12px;">
							<div class="row">
								<!-- 상품 카드 1 -->
								<div class="col-md-6">
									<div class="card" style="max-height: 250px;">
										<!-- 인라인 스타일로 최대 너비 설정 -->
										<div class="row no-gutters">
											<!-- 왼쪽에는 사진 -->
											<div class="col-md-6">
												<img src="../imgfolder/clothes1.png" alt="상품 사진 1"
													class="card-img" style="max-height: 250px;  height:100%;">
												<!-- 이미지 최대 높이 설정 -->
											</div>
											<!-- 오른쪽에는 상품 정보 -->
											<div class="col-md-6">
												<div class="card-body">
													<h6 class="card-title">상품 제목 2</h6>
													<p class="card-text">결제</p>

													<p class="card-text">
														<strong>판매자:</strong>
													</p>
													<p class="card-text">
														<strong>가격:</strong> 200000원
													</p>
													<p class="card-text">
														<strong style="cursor: pointer;">판매자 평가하기</strong>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- 상품 카드 2 -->

								<div class="col-md-6">
									<div class="card" style="max-height: 250px;">
										<!-- 인라인 스타일로 최대 너비 설정 -->
										<div class="row no-gutters">
											<!-- 왼쪽에는 사진 -->
											<div class="col-md-6">
												<img src="../imgfolder/clothes1.png" alt="상품 사진 1"
													class="card-img" style="max-height: 250px;  height:100%;">
												<!-- 이미지 최대 높이 설정 -->
											</div>
											<!-- 오른쪽에는 상품 정보 -->
											<div class="col-md-6">
												<div class="card-body">
													<h6 class="card-title">상품 제목 2</h6>
													<p class="card-text">결제</p>

													<p class="card-text">
														<strong>판매자:</strong>
													</p>
													<p class="card-text">
														<strong>가격:</strong> 200000원
													</p>
													<p class="card-text">
														<strong style="cursor: pointer;">판매자 평가하기</strong>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
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
							<li class="nav-item mb-2"><a href="../mypage/mypage_edit.jsp"
								class="nav-link text-success border rounded p-2"
								id="manager_memberListMenu">내 정보 수정</a></li>
							<li class="nav-item mb-2"><a href="../mypage/mypage_like.jsp"
								class="nav-link text-success border rounded p-2"
								id="manager_reportListMenu">찜 목록</a></li>
							<li class="nav-item mb-2"><a href="../mypage/mypage_buylog.jsp"
								class="nav-link text-success border rounded p-2">구매 현황</a></li>
							<li class="nav-item mb-2"><a href="../mypage/mypage_selllog.jsp"
								class="nav-link text-success border rounded p-2">판매 현황</a></li>
							<li class="nav-item mb-2"><a href="../mypage/mypage_buylist.jsp"
								class="nav-link text-success border rounded p-2">구매 내역</a></li>
							<li class="nav-item mb-2"><a href="../mypage/mypage_selllist.jsp"
								class="nav-link text-success border rounded p-2">판매 내역</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link text-success border rounded p-2">판매자 평가</a></li>
							<li class="nav-item mb-2"><a href="../manager/manager_main.jsp"
								class="nav-link text-success border rounded p-2">고객 센터</a></li>
						</ul>
					</nav>
				</div>
			</aside>
		</div>
	</main>
</div>

<%@ include file="../footer.jsp"%>