<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<div class="container-fluid">
	<main class="container-fluid mt-4" id="main"
		style="width: 960px; height: 100%; margin: 30px auto;">
		<div class="row">
			<section class="col-md-9">
				<div id="main-content" class="border p-4 rounded bg-white"
					style="min-height: 600px;">
					<div class="mb-4">
						<div class="d-flex align-items-center mb-4">
							<div class="bg-secondary rounded-circle h-12 w-12"></div>
							<span class="font-weight-bold" style="font-size: 24px;">판매자
								평가하기 </span>
						</div>
						<hr>

						<div class="container rounded  border mt-5  text-center  "
							style="padding: 20px;">


							<form action="/myWorkSpace/insertReview.do" method="post">
							 <input type="hidden" name="productno" value="${productno}">
								<div class="row">
									<div class="col-md-6 mt-3">
										<div class="row justify-content-between">
											<div class="col-md-4 ">
												<p class="m-3 text-right">판매자</p>
											</div>
											<div class="col-md-8 align-items-center">
												<p class="m-3 text-center">${sellusername }</p>
											</div>
										</div>
									</div>
									<div class="col-md-6  align-items-center mt-3">
										<p class="m-3">거래방식 : ${trademethod }</p>
									</div>
								</div>

								<div class="row mt-3">
									<div class="col-md-6  align-items-center">
										<div class="row justify-content-between">
											<div class="col-md-4 mt-3">
												<p class="m-3 text-right">평점</p>
											</div>
											<div class="col-md-8 d-flex align-items-center mt-3">
												<select class="form-select form-select text-center"
													name="reviewscore"
													aria-label=".form-select example">
													<option selected>평점 선택하기</option>
													<option class="text-center" value="1">1</option>
													<option class="text-center" value="2">2</option>
													<option class="text-center" value="3">3</option>
													<option class="text-center" value="4">4</option>
													<option class="text-center" value="5">5</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-md-6  align-items-center mt-3">
										<p class="m-3">평가자 : ${reviewusername }</p>
									</div>
								</div>

								<div class="d-flex align-items-center mt-3">
									<select class="form-select form-select text-center mt-5"
										name="reviewcontent"
										aria-label=".form-select example">
										<option selected>-- 평가 내용을 선택해주세요 --</option>
										<option class="text-center" value="판매자가 친절해요">판매자가
											친절해요</option>
										<option class="text-center" value="응답이 빨라요">응답이 빨라요</option>
										<option class="text-center" value="상품 상태가 좋아요">상품 상태가
											좋아요</option>
										<option class="text-center" value="상품배송이 빨라요">상품배송이
											빨라요</option>
										<option class="text-center" value="거래 시간을 잘 지켜요">거래
											시간을 잘 지켜요</option>
									</select>
								</div>
								<div class="mt-5 style="margin-top: 20px;">
									<button type="submit" class="btn btn-primary mt-5"
										style="margin-right: 20px;">확인</button>
									<a href="/myWorkSpace/getBuyList.do" class="btn btn-secondary mt-5">취소</a>
								</div>
							</form>

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
							<li class="nav-item mb-2"><a
								href="/myWorkSpace/getReviewList.do"
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