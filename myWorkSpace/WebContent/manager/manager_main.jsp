<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
	<div class="container-fluid">
        <main class="container-fluid mt-4">
            <div class="row" id="main">
                <section class="col-md-9">
                    <div id="main-content" class="border p-4 rounded bg-white" style="min-height: 600px;">
                        <div class="mb-4">
                            <div class="d-flex align-items-center mb-4">
                                <div class="bg-secondary rounded-circle h-12 w-12"></div>
                                <span class="font-weight-bold" style="font-size: 24px;">관리자</span>
                            </div>
                            <hr>
                            <div class="row row-cols-1 row-cols-md-3 g-4">
                                <div class="col">
                                    <a href="#" class="p-4 border rounded text-center bg-light d-block text-decoration-none" id="manager_memberList">
                                        	회원정보 관리
                                    </a>
                                </div>
                                <div class="col">
                                    <a href="#" class="p-4 border rounded text-center bg-light d-block text-decoration-none" id="manager_reportList">
                                        	신고 내역
                                    </a>
                                </div>
                                <div class="col">
                                    <a href="<%= request.getContextPath() %>/faqList.do" class="p-4 border rounded text-center bg-light d-block text-decoration-none">
                                        	FAQ
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <aside class="col-md-3">
                    <div class="border p-4 rounded bg-white text-center" style="min-height: 600px; height:100%;'">
                        <nav>
                            <ul class="nav flex-column">
                                <li class="nav-item mb-2"><a href="#" class="nav-link text-success border rounded p-2" id="manager_memberListMenu">회원정보 관리</a></li>
                                <li class="nav-item mb-2"><a href="#" class="nav-link text-success border rounded p-2" id="manager_reportListMenu">신고 내역</a></li>
                                <li class="nav-item mb-2"><a href="#" class="nav-link text-success border rounded p-2" id="manager_editMenu" >정보 수정</a></li>
                                <li class="nav-item mb-2"><a href="<%= request.getContextPath() %>/faqList.do" class="nav-link text-success border rounded p-2" >FAQ</a></li>
                                <li class="nav-item mb-2"><a href="#" class="nav-link text-success border rounded p-2" id="manager_productMenu">상품 관리</a></li>
                            </ul>
                        </nav>
                    </div>
                </aside>
            </div>
        </main>
	</div>
<%@ include file="../footer.jsp"%>