<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<div class="container-fluid">
	<main class="container-fluid mt-4" id="main"
		style="width: 960px; height: 100%; margin: 30px auto;">
		<div class="row">
			<section class="col-md-9">
				<div id="main-content" class="border p-4 rounded bg-white"
					style="min-height: 600px; height: 100%">
					<div class="mb-4">
						<div class="d-flex align-items-center mb-4">
							<div class="bg-secondary rounded-circle h-12 w-12"></div>
							<span class="font-weight-bold" style="font-size: 24px;">내
								정보 수정</span>
						</div>
						<hr>


						<!-- 여기서부터 정보수정 칸 -->
						<form action="/myWorkSpace/mypageEdit.do" method="post" enctype="multipart/form-data">
							<div class="row d-flex align-items-center justify-content-center"
								style="text-align: center;">
								<!-- 								<img -->
								<!-- 									src="https://mdbcdn.b-cdn.net/img/new/standard/city/047.webp" -->
								<!-- 									class="img-thumnail rounded-circle col-md-6 " -->
								<!-- 									style="width: 200px" /> -->
								<img id="profileImagePreview"
									class="img-thumnail rounded-circle col-md-6"
									style="width: 200px" src="${udto.imgurl}" />

								<div class="col-md-6">
									<h2>${udto.user_name }</h2>
									<input type="file" id="profileImageInput" name="profileImage"
										style="display: none;">


									<!-- 수정된 버튼 -->
									<button type="button"
										class="btn btn-success btn-secondary btn-rounded mt-3"
										onclick="document.getElementById('profileImageInput').click()">프로필
										이미지 수정</button>
									<!-- 파일 선택 input -->
									<input type="file" id="profileImageInput" name="profileImage"
										style="display: none;">
										
										
								</div>
								<hr class="mt-3">

								<div class="row d-flex align-items-center mt-3"
									style="text-align: center;" style="width:200px;">
									<div class="col-md-3">
										<h5 style="">아이디</h5>
									</div>
									<div class="form-outline col-md-3 " data-mdb-input-init
										style="width: 450px;">
										<input type="text" id="form12" class="form-control"
											placeholder="아이디" readonly disabled value="${udto.user_id }" />
									</div>
								</div>
								<div class="row d-flex align-items-center mt-3"
									style="text-align: center;" style="width:200px;">
									<div class="col-md-3">
										<!-- 										<h5>닉네임</h5> -->
										<!-- 									</div> -->
										<!-- 									<div class="form-outline col-md-3" data-mdb-input-init -->
										<!-- 										style="width: 450px;"> -->
										<!-- 										<input type="text" id="form12" class="form-control" -->
										<!-- 											placeholder="닉네임" /> -->
									</div>
								</div>
								<div class="row d-flex align-items-center mt-3"
									style="text-align: center;" style="width:200px;">
									<div class="col-md-3">
										<h5>이메일</h5>
									</div>
									<div class="form-outline col-md-6" data-mdb-input-init
										style="width: 450px;">
										<input type="text" id="form12" class="form-control"
											name="email" value="${udto.email }" placeholder="이메일" />
									</div>
								</div>
								<div class="row d-flex align-items-center mt-3"
									style="text-align: center;" style="width:200px;">
									<div class="col-md-3">
										<h5>전화번호</h5>
									</div>
									<div class="form-outline col-md-3" data-mdb-input-init
										style="width: 450px;">
										<input type="text" id="form12" class="form-control"
											name="user_call" value="${udto.user_call }"
											placeholder="전화번호" />
									</div>

								</div>

								<div class="row d-flex align-items-center mt-3"
									style="text-align: center;" style="width:200px;">
									<div class="col-md-3">
										<h5>주소</h5>
									</div>
									<div class="form-outline col-md-3" data-mdb-input-init
										style="width: 450px;">
										<input type="text" id="form12" class="form-control"
											name="address1" placeholder="주소1" value="${udto.address1 }" />
									</div>
								</div>

								<div class="row d-flex align-items-center mt-3"
									style="text-align: center;" style="width:200px;">
									<div class="col-md-3">
										<h5></h5>
									</div>
									<div class="form-outline col-md-3" data-mdb-input-init
										style="width: 450px;">
										<input type="text" id="form12" class="form-control"
											name="address2" value="${udto.address2 }" placeholder="주소2" />
									</div>
								</div>
								<hr class="mt-3 mb-3">
								<div
									class="row d-flex align-items-center mt-3 justify-content-center"
									style="text-align: center;">
									<div class="col-md-6 ">
										<button type="submit"
											class="btn btn-success btn-secondary btn-rounded w-50 mt-3"
											data-mdb-ripple-init style="">확인</button>
									</div>
									<div class="form-outline col-md-6 text-left"
										data-mdb-input-init>
										<a href="/myWorkSpace/mypageMain.do">
  <button type="button" class="btn btn-success btn-secondary btn-rounded w-50 mt-3" data-mdb-ripple-init style="">취소</button>
</a>
									</div>
								</div>

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
<!-- JavaScript 코드 -->
<script>
    // 파일이 선택되면 미리보기 업데이트
    document.getElementById('profileImageInput').addEventListener('change', function(event) {
        var preview = document.getElementById('profileImagePreview');
        var file = event.target.files[0];

        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
            };
            reader.readAsDataURL(file);
        } else {
            // 파일이 선택되지 않았을 때 기본 이미지로 설정
            preview.src = '${udto.imgurl}';
        }
    });
</script>


<%@ include file="../footer.jsp"%>