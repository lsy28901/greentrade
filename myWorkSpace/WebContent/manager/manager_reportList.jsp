<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
int pageNo = request.getParameter("pageNo") != null ? Integer.parseInt(request.getParameter("pageNo")) : 1; 
int pageSize = 10; // 페이지당 게시물 수 
int totalRows = request.getAttribute("totalRows") != null ? (Integer)request.getAttribute("totalRows") : 0;
int totalPages = (int) Math.ceil((double) totalRows / pageSize); // 총 페이지 수
int maxPageLinks = 5; // 최대 페이지 링크 수
int startPage = Math.max(1, pageNo - maxPageLinks / 2); // 시작 페이지 번호
int endPage = Math.min(startPage + maxPageLinks - 1, totalPages); // 끝 페이지 번호
%>
<div class="mb-4">
    <div class="d-flex align-items-center mb-4">
        <div class="bg-secondary rounded-circle h-12 w-12"></div>
        <span class="font-weight-bold" style="font-size: 24px;">신고 내역</span>
    </div>
    <hr>
    <div>
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
	                                <td>${report.targetNickname}</td>
	                                <td><a href="/myWorkSpace/reportContent.do?reportid=${report.reportid}" class="text-decoration-none">${report.reporttitle}</a></td>
	                                <td>${report.reportdate }</td>
	                                <td>${report.reporterNickname}</td>
	                            </tr>
	                        </c:forEach>
	                    </tbody>
	                </table>
	                <div class="text-center mt-4">
					    <%
					    if (pageNo > 1) {
					    %>
					        <a href="#" class="btn btn-success" onclick="loadPage('/myWorkSpace/reportList.do?pageNo=<%= pageNo - 1 %>', 'main-content')">이전</a>
					    <%
					    }
					    for (int currentPage = startPage; currentPage <= endPage; currentPage++) {
					        if (currentPage == pageNo) {
					    %>
					            <span class="btn btn-primary"><%= currentPage %></span>
					    <%
					        } else {
					    %>
					            <a href="#" class="btn btn-secondary" onclick="loadPage('/myWorkSpace/reportList.do?pageNo=<%= currentPage %>', 'main-content')"><%= currentPage %></a>
					    <%
					        }
					    }
					    if (pageNo < totalPages) {
					    %>
					        <a href="#" class="btn btn-success" onclick="loadPage('/myWorkSpace/reportList.do?pageNo=<%= pageNo + 1 %>', 'main-content')">다음</a>
					    <%
					    }
					    %>
					</div>

					<div class="mb-4" style="position: relative;">
					    <div style="position: absolute; right: 0; bottom: 0;">
					        <button class="btn btn-success" id="manager_Home">홈으로</button>
					    </div>
					</div>
					
	</div>
</div>
<script>
    $(document).ready(function() {
        $('#manager_Home').click(function(e) {
            e.preventDefault(); // 링크 클릭 동작 취소
            window.location.href = '/myWorkSpace/manager/manager_main.jsp'; // 페이지 이동
        });
        
    });
</script>