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
							<span class="font-weight-bold" style="font-size: 24px;">판매
								현황</span>
						</div>
						<hr>
						<div class="container mt-3">
							<table id="board-table" class="table table-hover" border="1px"
								style="text-align: center">
								<thead>
									<tr>
										<th>상태</th>
										<th>상품명</th>
										<th>가격</th>
										<th>거래일</th>
										<th>결제방식</th>
										<th>배송방식</th>
										<th>취소</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="selllogList" items="${selllogList}">
										<tr>
											<td>${selllogList.tradestatus}</td>
											<td>${selllogList.title}</td>
											<td>${selllogList.price}</td>
											<td>${selllogList.tradestartdate}</td>
											<td>${selllogList.paymethod}</td>
											<td>${selllogList.trademethod}</td>
											<td>
											<c:if test="${selllogList.buyuserno ne 0}">
											    판매완료
											</c:if>
											<c:if test="${selllogList.buyuserno eq 0}">
											    <form action="/myWorkSpace/delleteSellItem.do" method="post">
											        <input type="hidden" name="productno" value="${selllogList.productno}">
											        <input type="submit" 
											        style=" background-color: #4CAF50; color: white; border: none; border-radius: 4px;"
											        value="판매취소">
											    </form>
											</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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