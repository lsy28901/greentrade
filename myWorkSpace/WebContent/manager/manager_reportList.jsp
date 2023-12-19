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
	                            <th>신고 대상자</th>
	                            <th>신고 제목</th>
	                            <th>신고 날짜</th>
	                            <th>신고 회원명</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <c:forEach var="report" items="${reportList}" varStatus="loop">
	                            <tr>
	                                <td>${loop.index + 1}</td>
	                                <td>${report.reporterNickname}</td>
	                                <td><a href="reportContent.do?reportid=${report.reportid}" class="text-decoration-none">${report.reporttitle}</a></td>
	                                <td>${report.reportdate }</td>
	                                <td>${report.targetNickname}</td>
	                            </tr>
	                        </c:forEach>
	                    </tbody>
	                </table>
        <div class="float-end mt-1">
            <button class="btn btn-success" id="manager_Home">홈으로</button>
        </div>
	</div>
</div>
<script>
    $(document).ready(function() {
        $('#manager_Home').click(function(e) {
            e.preventDefault(); // 링크 클릭 동작 취소
            window.location.href = 'manager_main.jsp'; // 페이지 이동
        });
        $('.report-button').click(function(e) {
            e.preventDefault(); // 링크 클릭 동작 취소
            window.location.href = 'reportContent.do?reportid=2'; // 페이지 이동
        });
    });
</script>