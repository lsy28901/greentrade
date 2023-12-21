<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="mb-4">
    <div class="d-flex align-items-center mb-4">
        <div class="bg-secondary rounded-circle h-12 w-12"></div>
        <span class="font-weight-bold" style="font-size: 24px;">회원 정보 관리</span>
    </div>
    <hr>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <table id="board-table" class="table table-bordered text-center">
            <thead>
              <tr>
                <th>번호</th>
                <th>회원명</th>
                <th>회원 id</th>
                <th>신고당한 횟수</th>
                <th>회원 정보 확인</th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach var="memberlist" items="${managerMemberList}" varStatus="loop">
					<tr>
	                   <td>${loop.index + 1}</td>
	                   <td>${memberlist.user_name}</td>
	                   <td>${memberlist.user_id}</td>
	                   <td>${memberlist.targetid_count}회</td>
	                   <td><button class="btn btn-success fix_button">확인</button></td>
	                </tr>
	            </c:forEach>
              
            </tbody>
          </table>
    	</div>
    	<div class="float-end mt-1">
            <button class="btn btn-success" id="manager_Home">홈으로</button>
        </div>
</div>
<script>
    $(document).ready(function() {
        $('#manager_Home').click(function(e) {
            e.preventDefault(); // 링크 클릭 동작 취소
            window.location.href = 'manager_main.jsp'; // 페이지 이동
        });
    });
    $(document).ready(function() {
        $('.fix_button').click(function(e) {
            e.preventDefault(); // 링크 클릭 동작 취소
            var user_id = $(this).closest("tr").find("td:eq(2)").text(); // 회원 id 가져오기
            loadPage('/myWorkSpace/managerMemberInfo.do?user_id=' + user_id, 'main-content'); // 페이지 이동
        });
    });

</script>