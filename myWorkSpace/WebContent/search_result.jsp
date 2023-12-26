<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>
<% 
int pageNo = request.getParameter("pageNo") != null ? Integer.parseInt(request.getParameter("pageNo")) : 1; 
int pageSize = 12; // 페이지당 게시물 수 
int totalRows = request.getAttribute("totalRows") != null ? (Integer)request.getAttribute("totalRows") : 0;
int totalPages = (int) Math.ceil((double) totalRows / pageSize); // 총 페이지 수
int maxPageLinks = 5; // 최대 페이지 링크 수
int startPage = Math.max(1, pageNo - maxPageLinks / 2); // 시작 페이지 번호
int endPage = Math.min(startPage + maxPageLinks - 1, totalPages); // 끝 페이지 번호
%>

<div class="mb-4">
    <div class="container-fluid">
        <main class="container-fluid mt-4">
        	<div class="d-flex align-items-center mt-4">
		        <div class="bg-secondary rounded-circle h-12 w-12"></div>
		        <span class="font-weight-bold" style="font-size: 24px;">상품 검색 목록</span>
		    </div>
	    	<hr>
            <div class="row border rounded" id="main">
                        <section class="product mt-2">
							<section class="products row " style="text-align:center;">
								<c:forEach var="search" items="${search}">
									<article class="mt-3 col-md-2 product-card"  style="transition: box-shadow 0.3s, cursor 0.3s; cursor: pointer;" onmouseover="this.style.boxShadow='0 0 10px rgba(0, 0, 0, 0.3)'" onmouseout="this.style.boxShadow='none'">
										<div onclick="location.href='/myWorkSpace/detaiIitem.do?productno=${search.productno}';">
											<img src="./${search.image}" style="width:100%;height:150px;">
											<div class="mt-2">
												<b>${search.title}</b>
											</div>
										</div>
										<div class="text-secondary mt-2">${search.price}원</div>
										<div class="mt-2">판매자: ${search.user_name}</div>					
										<div class="mt-2">${search.productStatus}</div>
									</article>
								</c:forEach>
								<div class="text-center mt-4">
						 			<%
										if (pageNo > 1) {
									%>
										<a href="#" class="btn btn-success" onclick="loadPage('/myWorkSpace/managerProduct.do?pageNo=<%= pageNo - 1 %>', 'main')">이전</a>
									<%
										}
										for (int currentPage = startPage; currentPage <= endPage; currentPage++) {
											if (currentPage == pageNo) {
									%>
											 <span class="btn btn-primary"><%= currentPage %></span>
									<%
											} else {
									%>
												<a href="#" class="btn btn-secondary" onclick="loadPage('/myWorkSpace/managerProduct.do?pageNo=<%= currentPage %>', 'main')"><%= currentPage %></a>
									<%
											}
										}
										if (pageNo < totalPages) {
									%>
											<a href="#" class="btn btn-success" onclick="loadPage('/myWorkSpace/managerProduct.do?pageNo=<%= pageNo + 1 %>', 'main')">다음</a>
									<%
										}
									%>
								</div>
							</section>
						</section>
                    </div>
				</main>
            </div>
	</div>
<%@ include file="../footer.jsp"%>