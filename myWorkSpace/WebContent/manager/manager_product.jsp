<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="mb-4">
    <div class="d-flex align-items-center mb-4">
        <div class="bg-secondary rounded-circle h-12 w-12"></div>
        <span class="font-weight-bold" style="font-size: 24px;">상품 정보 관리</span>
    </div>
    <hr>
    <div class="float-end mt-4">
        <button class="btn btn-success" id="manager_Home">홈으로</button>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#manager_Home').click(function(e) {
            e.preventDefault(); // 링크 클릭 동작 취소
            window.location.href = '/myWorkSpace	/manager/manager_main.jsp'; // 페이지 이동
        });
    });
</script>