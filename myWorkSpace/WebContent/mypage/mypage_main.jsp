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
							<span class="font-weight-bold" style="font-size: 24px;">마이페이지</span>
						</div>
						<hr>
						<div class="row justify-content-center" style="">
							<img
								src="${mydto.imgurl}" 
								class="col-md-3 img-fluid rounded-circle  "
								alt="Townhouses and Skyscrapers"
								style="width: 150px; height: 100px;" />
							<h3 class="col-md-3 d-flex align-items-center "
								style="text-align: center;">
								${mydto.user_name }
								</h2>
								<div class="col-md-3 ">
									<div class="row h-100">
										<p class="col-md-3 d-flex  align-self-center w-100" style="font-size: 11px;">
										이메일: ${mydto.email }</p>
										<p class="col-md-3 d-flex  align-self-center w-100" style="font-size: 11px;">
										전화번호: ${mydto.user_call }</p>
										<div class="col-md-3 d-flex  align-self-center w-100" style="font-size: 11px;">
										${mydto.address1 }</div>
										<div class="col-md-3 d-flex  align-self-center w-100" style="font-size: 11px;">
										${mydto.address2 }</div>
									</div>
								</div>
								<div class="col-md-3 d-flex align-items-center ">
									<div class="row d-flex justify-content-center">
										<a href="/myWorkSpace/mypageEdit.do" class="btn btn-success row-md-6 mb-4 w-75">내 정보
											수정</a>
										<a href="/myWorkSpace/login/logout.jsp" class="btn btn-success row-md-6  w-75">로그 아웃</a>
									</div>
								</div>
						</div>
						<hr>
						<div class="row mt-5">
							<div class="col-md-4 text-center"  style="align-items: center">
								<div class="row">
									<p class="row-md-4"><a href="/myWorkSpace/getBuyList.do">구매 내역</a></p>
									<hr class="row-md-4 w-50 mx-auto">
									<p class="row-md-4">
									<a href="/myWorkSpace/getBuyList.do">${mydto.buylistcount }회</a>
									</p>
								</div>
							</div>
							<div class="col-md-4 text-center">
								<div class="row">
									<p class="row-md-4"><a href="/myWorkSpace/getSellList.do" >판매 내역</a></p>
									<hr class="row-md-4 w-50 mx-auto">
									<p class="row-md-4">
									<a href="/myWorkSpace/getSellList.do" >${mydto.selllistcount }회</a>
									</p>
								</div>
							</div>
							<div class="col-md-4 text-center ">
								<div class="row">
									<p class="row-md-4"><a href="/myWorkSpace/getReviewList.do">평가 내역</a></p>
									<hr class="row-md-4 w-50 mx-auto">
									<p class="row-md-4">
									<a href="/myWorkSpace/getReviewList.do">${mydto.reviewcount }회</a>
									</p>
								</div>
							</div>
						</div>
						<div class="mt-3 mb-2">최근본 상품</div>
						<div class="row border " >
							
							<div class="col-md-4 " style="height: 150px"></div>
							<div class="col-md-4 " style="height: 150px"></div>
							<div class="col-md-4 " style="height: 150px"></div>
						</div>
					</div><!-- 마이페이지  끝 -->
			</section>
			<aside class="col-md-3">
				<div class="border p-4 rounded bg-white text-center"
					style="min-height: 600px; height: 100%">
					<nav>
						<ul class="nav flex-column">
							<li class="nav-item mb-2"><a href="/myWorkSpace/mypageEdit.do"
								class="nav-link text-success border rounded p-2"
								id="manager_memberListMenu">내 정보 수정</a></li>
							<li class="nav-item mb-2"><a href="/myWorkSpace/getLikeList.do"
								class="nav-link text-success border rounded p-2"
								id="manager_reportListMenu">찜 목록</a></li>
							<li class="nav-item mb-2"><a href="/myWorkSpace/mypageBuylog.do"
								class="nav-link text-success border rounded p-2">구매 현황</a></li>
							<li class="nav-item mb-2"><a href="/myWorkSpace/mypageSelllog.do"
								class="nav-link text-success border rounded p-2">판매 현황</a></li>
							<li class="nav-item mb-2"><a href="/myWorkSpace/getBuyList.do"
								class="nav-link text-success border rounded p-2">구매 내역</a></li>
							<li class="nav-item mb-2"><a href="/myWorkSpace/getSellList.do"
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