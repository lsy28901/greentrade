<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="d-flex align-items-center mb-4">
        <div class="bg-secondary rounded-circle h-12 w-12"></div>
        <span class="font-weight-bold" style="font-size: 24px;">상품 정보 관리</span>
    </div>
    <hr>
    <div class="container-fluid">
        <main class="container-fluid mt-4">
            <div class="row border rounded" id="main">
                        <section class="product mt-2">
							<section class="products row " style="text-align:center;">
								<c:forEach var="product" items="${allProduct}">
									<article class="mt-3 col-md-2 product-card"  style="transition: box-shadow 0.3s, cursor 0.3s; cursor: pointer;" onmouseover="this.style.boxShadow='0 0 10px rgba(0, 0, 0, 0.3)'" onmouseout="this.style.boxShadow='none'">
										<div onclick="location.href='/myWorkSpace/detaiIitem.do?productno=${product.productno}';">
											<img src="../${product.image}" style="width:100%;height:150px;">
											<div class="mt-2">
												<b>${product.title}</b>
											</div>
										</div>
										<div class="text-secondary mt-2">${product.price}원</div>
										<div class="mt-2">판매자: ${product.user_name}</div>					
										<div class="mt-2">${product.sellstatus}</div>									
										<div class="mt-2"><button data-productno="${product.productno}"
										class="btn btn-secondary delete-button">삭제</button></div>
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
                    <div class="float-end mt-4">
						<button class="btn btn-success" id="manager_Home">홈으로</button>
					</div>
				</main>
            </div>
	</div>
<script>
    $(document).ready(function() {
        $('#manager_Home').click(function(e) {
            e.preventDefault(); // 링크 클릭 동작 취소
            window.location.href = '/myWorkSpace/manager/manager_main.jsp'; // 페이지 이동
        });
        $(".delete-button").click(function(e) {
            e.preventDefault(); // 링크 클릭 동작 취소

            var productno = $(this).data("productno"); // 상품 번호 가져오기
            var confirmation = confirm("정말로 삭제하시겠습니까?");

            if (confirmation) {
                // 확인을 눌렀을 때 서버로 삭제 요청을 보냄
                $.ajax({
                    type: "POST", // 또는 "GET" 등 HTTP 요청 방식 선택
                    url: "/myWorkSpace/managerProductDelete.do", // 삭제 요청을 처리할 서블릿 또는 컨트롤러 URL
                    data: { productno: productno }, // 삭제할 상품 번호 전송
                    success: function(data) {
                        // 삭제 성공 시 새로고침 또는 다른 처리
                        alert("삭제되었습니다.");
                        loadPage('/myWorkSpace/managerProduct.do','main'); // 페이지 새로고침 (또는 새로고침 없이 해당 상품 제거 등의 UI 업데이트)
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        alert("삭제 실패: " + textStatus);
                    }
                });
            }
        });
    });
    
</script>