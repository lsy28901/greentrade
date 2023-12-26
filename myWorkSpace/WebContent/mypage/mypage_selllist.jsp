<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<div class="container-fluid">
	<main class="container-fluid mt-4" id="main"
		style="width: 960px; height: 100%; margin: 30px auto;">
		<div class="row">
			<section class="col-md-9 " style="">
				<div id="main-content" class="border p-4 rounded bg-white"
					style="min-height: 600px;">
					<div class="mb-4">
						<div class="d-flex align-items-center mb-4">
							<div class="bg-secondary rounded-circle h-12 w-12"></div>
							<span class="font-weight-bold" style="font-size: 24px;">판매
								내역</span>
						</div>
						<hr>

						<div class="container mt-3" style="font-size: 12px;">
							<div class="row">
								<!-- 반복문으로 BuyListDTO 정보를 동적으로 생성 -->
								<c:forEach var="sellList" items="${sellList}">
									<div class="col-md-6">
										<div class="card" style="max-height: 250px;">
											<div class="row no-gutters">
												<div class="col-md-6"
													style="display: flex; align-items: center;">
													<img src="${sellList.image}" class="card-img"
														style="max-height: 150px; height: 100%; margin-left: 10px;">
												</div>
												<div class="col-md-6">
													<div class="card-body">
														<h6 class="card-title">${sellList.title}</h6>
														<p class="card-text mt-3">
															<strong>결제방법:</strong> ${sellList.paymethod}
														</p>
														<p class="card-text">
															<strong>구매자:</strong> ${sellList.user_name}
														</p>
														<p class="card-text">
															<strong>가격:</strong> ${sellList.price}원
														</p>
														<p class="card-text">
															
														</p>
												
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
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
							<li class="nav-item mb-2"><a
								href="/myWorkSpace/mypageEdit.do"
								class="nav-link text-success border rounded p-2"
								id="manager_memberListMenu">내 정보 수정</a></li>
							<li class="nav-item mb-2"><a
								href="/myWorkSpace/getLikeList.do"
								class="nav-link text-success border rounded p-2"
								id="manager_reportListMenu">찜 목록</a></li>
							<li class="nav-item mb-2"><a
								href="/myWorkSpace/mypageBuylog.do"
								class="nav-link text-success border rounded p-2">구매 현황</a></li>
							<li class="nav-item mb-2"><a
								href="/myWorkSpace/mypageSelllog.do"
								class="nav-link text-success border rounded p-2">판매 현황</a></li>
							<li class="nav-item mb-2"><a
								href="/myWorkSpace/getBuyList.do"
								class="nav-link text-success border rounded p-2">구매 내역</a></li>
							<li class="nav-item mb-2"><a
								href="/myWorkSpace/getSellList.do"
								class="nav-link text-success border rounded p-2">판매 내역</a></li>
							<li class="nav-item mb-2"><a href="/myWorkSpace/getReviewList.do"
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