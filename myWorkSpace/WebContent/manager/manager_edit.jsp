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
						<input type="text" id="form12" class="form-control"
												placeholder="아이디" />
					</div>
				</div>
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;" >
					<div class="col-md-6">
						<h5>비밀번호</h5>
					</div>
					<div class="form-outline col-md-6" >
						<input type="text" id="form12" class="form-control"
							placeholder="비밀번호" />
					</div>
				</div>
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;">
					<div class="col-md-6">
						<h5>이메일</h5>
					</div>
					<div class="form-outline col-md-6" >
						<input type="text" id="form12" class="form-control"
							placeholder="이메일" />
					</div>
				</div>
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;" >
					<div class="col-md-6">
						<h5>전화번호</h5>
					</div>
					<div class="form-outline col-md-6" >
						<input type="text" id="form12" class="form-control"
							placeholder="전화번호" />
					</div>
			
				</div>
	
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;" >
					<div class="col-md-6">
						<h5>주소</h5>
					</div>
					<div class="form-outline col-md-6" >
						<input type="text" id="form12" class="form-control"
							placeholder="주소" />
					</div>
				</div>
				<hr class="mt-3 mb-3">
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;">
					<div class="col-md-6">
					<button type="submit" class="btn btn-success btn-rounded mt-3">확인</button>
					</div>
					<div class="form-outline col-md-6" data-mdb-input-init>
						<button type="button" class="btn btn-success btn-rounded mt-3" id="manager_Home">취소</button>
					</div>
				</div>
			</div>
		</form>
	</div>
<script>
    $(document).ready(function() {
        $('#manager_Home').click(function(e) {
            e.preventDefault(); // 링크 클릭 동작 취소
            window.location.href = 'manager_main.jsp'; // 페이지 이동
        });
    });
</script>
