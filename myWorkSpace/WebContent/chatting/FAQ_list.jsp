<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<%@ include file="../header.jsp"%>
<main class="container-fluid mt-4 bg-white border rounded" style="min-height: 600px;">
    <div class="mb-4">
        <div class="border rounded d-flex align-items-center m-4">
            <div class="bg-secondary rounded-circle h-12 w-12"></div>
            <span class="text-center flex-fill" style="font-size: 24px;">자주 묻는 질문</span>
        </div>
        <section class="col-md-12">
            <div class="row row-cols-1 row-cols-md-3 g-4 m-4">
                <table id="board-table" class="table table-bordered text-center">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>카테고리</th>
                            <th>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</th>
                            <th>작성 시간</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="faq" items="${faqList}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${faq.faqcate}</td>
                                <td><a href="/myWorkSpace/faqContent.do?faqno=${faq.faqno}" class="text-decoration-none">${faq.faqtitle}</a></td>
                                <td>${faq.faqdate}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="text-center mt-4">
			    <%
			    if (pageNo > 1) {
			    %>
			        <a href="/myWorkSpace/faqList.do?pageNo=<%= pageNo - 1 %>" class="btn btn-success">이전</a>
			    <%
			    }
			    for (int currentPage = startPage; currentPage <= endPage; currentPage++) {
			        if (currentPage == pageNo) {
			    %>
			            <span class="btn btn-primary"><%= currentPage %></span>
			    <%
			        } else {
			    %>
			            <a href="/myWorkSpace/faqList.do?pageNo=<%= currentPage %>" class="btn btn-secondary"><%= currentPage %></a>
			    <%
			        }
			    }
			    if (pageNo < totalPages) {
			    %>
			        <a href="/myWorkSpace/faqList.do?pageNo=<%= pageNo + 1 %>" class="btn btn-success">다음</a>
			    <%
			    }
			    %>
			</div>
			<div class="mb-4" style="position: relative;">
				<div style="position: absolute; right: 0; bottom: 0;">
	                <button type="submit" class="btn btn-success report_conetent">
	                   	 신고하기
	                </button>
	            </div>
            </div>
        </section>
    </div>
</main>

<%@ include file="../footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $('.report_conetent').click(function(e) {
            e.preventDefault();
            window.location.href = 'manager/report_form.jsp';
        });
    });
</script>

