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
							<span class="font-weight-bold" style="font-size: 24px;">판매 현황</span>
						</div>
						<hr>
						<div class="container mt-3">
							<table id="board-table" class="table table-hover" border="1px" style="text-align: center">
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
									<tr>
										<td>거래중</td>
										<td>딸기</td>
										<td>20000</td>
										<td>2023-12-04</td>
										<td>결제</td>
										<td>직거래</td>
										<td>판매취소하기</td>
									</tr>
									<tr>
										<td>거래중</td>
										<td>딸기</td>
										<td>20000</td>
										<td>2023-12-04</td>
										<td>결제</td>
										<td>직거래</td>
										<td>판매취소하기</td>
									</tr>
									<tr>
										<td>취소</td>
										<td>딸기</td>
										<td>20000</td>
										<td>2023-12-04</td>
										<td>결제</td>
										<td>직거래</td>
										<td>판매취소</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
			</section>
			<aside class="col-md-3">
				<div class="border p-4 rounded bg-white text-center"
					style="min-height: 600px;">
					<nav>
						<ul class="nav flex-column">
							<li class="nav-item mb-2"><a href="#"
								class="nav-link text-success border rounded p-2"
								id="manager_memberListMenu">내 정보 수정</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link text-success border rounded p-2"
								id="manager_reportListMenu">찜 목록</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link text-success border rounded p-2">구매 현황</a></li>
							<li class="nav-item mb-2"><a href="FAQ_list.jsp"
								class="nav-link text-success border rounded p-2">판매 현황</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link text-success border rounded p-2">구매 내역</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link text-success border rounded p-2">판매 내역</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link text-success border rounded p-2">판매자 평가</a></li>
							<li class="nav-item mb-2"><a href="#"
								class="nav-link text-success border rounded p-2">고객 센터</a></li>
						</ul>
					</nav>
				</div>
			</aside>
		</div>
	</main>
</div>

<%@ include file="../footer.jsp"%>