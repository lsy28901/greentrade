<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="mb-4">
		<div class="d-flex align-items-center mb-4">
			<div class="bg-secondary rounded-circle h-12 w-12"></div>
			<span class="font-weight-bold" style="font-size: 24px;">관리자
				정보 수정</span>
			</div>
			<hr>
		<form>
			<div class="row d-flex align-items-center justify-content-center"
				style="text-align: center;">
				<img
					src="https://mdbcdn.b-cdn.net/img/new/standard/city/047.webp"
					class="img-fluid rounded-circle col-md-6"
					style="width: 200px; height: 200px" />
				<div class="col-md-6">
					<h2>관리자</h2>
				</div>
				<hr class="mt-3">
	
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;" >
					<div class="col-md-6">
						<h5>아이디</h5>
					</div>
					<div class="form-outline col-md-6" >
						<h5>아이디</h5>
					</div>
				</div>
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;" >
					<div class="col-md-6">
						<h5>비밀번호</h5>
					</div>
					<div class="form-outline col-md-6" >
						<h5>1234</h5>
					</div>
				</div>
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;" >
					<div class="col-md-6">
						<h5>이메일</h5>
					</div>
					<div class="form-outline col-md-6" >
						<h5>aaa@naver.com</h5>
					</div>
				</div>
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;" >
					<div class="col-md-6">
						<h5>전화번호</h5>
					</div>
					<div class="form-outline col-md-6" >
						<h5>010-1234-1234</h5>
					</div>
			
				</div>
	
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;" >
					<div class="col-md-6">
						<h5>주소</h5>
					</div>
					<div class="form-outline col-md-6" >
						<h5>경기도 남양주시</h5>
					</div>
				</div>
				<hr class="mt-3 mb-3">
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;">
					<div class="col-md-6">
					<button type="submit" class="btn btn-success btn-rounded mt-3"
						>블랙하기</button>
						<!--회원 삭제 기능 추가할것-->
					</div>
					<div class="form-outline col-md-6">
						<button type="button" class="btn btn-success btn-rounded mt-3" id="back_manager_memberList"
							>회원 정보 관리로</button>
					</div>
				</div>
			</div>
		</form>
	</div>
<script>
    $(document).ready(function() {
        $('#back_manager_memberList').click(function(e) {
            e.preventDefault(); // 링크 클릭 동작 취소
            loadPage('manager_memberList.jsp','main-content'); // 페이지 이동
        });
    });
</script>