<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="../header.jsp"%>
	<main class="container-fluid mt-4 bg-white border rounded" style="min-height: 600px;">
	    <div class="mb-4">
	        <div class="border rounded d-flex align-items-center m-4">
	            <div class="bg-secondary rounded-circle h-12 w-12"></div>
	            <span class=" text-center flex-fill" style="font-size: 24px;">자주 묻는 질문</span>
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
	            <div class="float-end mt-4">
	                <button type="submit" class="btn btn-success report_conetent">
	                    	 신고하기
	                </button>
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