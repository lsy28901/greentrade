<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="mb-4">
		<div class="d-flex align-items-center mb-4">
			<div class="bg-secondary rounded-circle h-12 w-12"></div>
			<span class="font-weight-bold" style="font-size: 24px;">회원 정보 상세</span>
			</div>
			<hr>
		<form>
			<div class="row d-flex align-items-center justify-content-center"
				style="text-align: center;">
				<div class="col-md-6">
					<h2>${managerMemberInfo.user_name} 회원님</h2>
				</div>
				<hr class="mt-3">
	
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;" >
					<div class="col-md-6">
						<h5>아이디</h5>
					</div>
					<div class="form-outline col-md-6" >
						<h5>${managerMemberInfo.user_id}</h5>
					</div>
				</div>
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;" >
					<div class="col-md-6">
						<h5>비밀번호</h5>
					</div>
					<div class="form-outline col-md-6" >
						<h5>${managerMemberInfo.user_password}</h5>
					</div>
				</div>
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;" >
					<div class="col-md-6">
						<h5>이메일</h5>
					</div>
					<div class="form-outline col-md-6" >
						<h5>${managerMemberInfo.email}</h5>
					</div>
				</div>
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;" >
					<div class="col-md-6">
						<h5>전화번호</h5>
					</div>
					<div class="form-outline col-md-6" >
						<h5>${managerMemberInfo.user_call}</h5>
					</div>
			
				</div>
	
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;" >
					<div class="col-md-6">
						<h5>주소</h5>
					</div>
					<div class="form-outline col-md-6" >
						<h5>${managerMemberInfo.address1}</h5>
						<h5>${managerMemberInfo.address2}</h5>
					</div>
				</div>
				<hr class="mt-3 mb-3">
				<div class="row d-flex align-items-center mt-3"
					style="text-align: center;">
					<div class="col-md-4">
					<button type="submit" class="btn btn-success btn-rounded mt-3" id="black_member">
						블랙하기
					</button>
						<!--회원 삭제 기능 추가할것-->
					</div>
					<div class="form-outline col-md-4">
						<button type="button" class="btn btn-success btn-rounded mt-3" id="go_reportlist"
							data-userno="${managerMemberInfo.userno}">신고 당한 내역 확인</button>
					</div>
					<div class="form-outline col-md-4">
						<button type="button" class="btn btn-success btn-rounded mt-3" id="back_manager_memberList"
							>회원 정보 관리로</button>
					</div>
				</div>
			</div>
		</form>
	</div>
<script>

	var user_id = "${managerMemberInfo.user_id}";
    $(document).ready(function() {
        $('#back_manager_memberList').click(function(e) {
            e.preventDefault(); // 링크 클릭 동작 취소
            loadPage('/myWorkSpace/managerMemberList.do','main-content'); // 페이지 이동
        });
    });
    $(document).ready(function() {
    	$('#go_reportlist').click(function(e) {
            e.preventDefault(); // 링크 클릭 동작 취소

            var userno = $(this).data('userno'); // 버튼의 data-userno 속성에서 값을 가져옴

            $.ajax({
                type: 'POST',
                url: '/myWorkSpace/reportListByTarget.do',
                data: { userno: userno }, // userno 변수를 전송
                success: function(response) {
                    loadPage('/myWorkSpace/reportListByTarget.do?userno=' + userno, 'main-content');
                },
                error: function() {
                    // 삭제에 실패한 경우 처리
                    alert('회원 정보 삭제 중 오류가 발생했습니다.');
                }
            });
        });
    	$('#black_member').click(function(e) {
            e.preventDefault(); // 링크 클릭 동작 취소

            $.ajax({
                type: 'POST',
                url: '/myWorkSpace/managerMemberDelete.do',
                data: { user_id: user_id }, // user_id 변수를 전송
                success: function(response) {
                    alert('회원 정보가 삭제되었습니다.');
                    loadPage('/myWorkSpace/managerMemberList.do','main-content');
                },
                error: function() {
                    // 삭제에 실패한 경우 처리
                    alert('회원 정보 삭제 중 오류가 발생했습니다.');
                }
            });
        });
    });
</script>