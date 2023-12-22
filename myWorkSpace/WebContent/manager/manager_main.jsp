<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	String msg = (String)request.getAttribute("LoginManagerSuccessMsg");//로그인 성공 확인
	if(msg!=null){
%>
<script>alert("<%=msg%>");</script>
<%
	}
%>
<script>
//링크를 클릭할 때 페이지를 로드하도록 이벤트 핸들러 추가
$(function() {
	var parameter = getParameterByName("parameter");
	if (parameter === "backReportList") {
        loadPage('/myWorkSpace/reportList.do','main-content');
    }
	
	
    $('#manager_memberList').click(function(e) {
        e.preventDefault(); // 링크 클릭 동작 취소
        loadPage('/myWorkSpace/managerMemberList.do','main-content');
    });
    
    $('#manager_memberListMenu').click(function(e) {
        e.preventDefault(); // 링크 클릭 동작 취소
        loadPage('/myWorkSpace/managerMemberList.do','main-content');
    });

    $('#manager_reportList').click(function(e) {
        e.preventDefault(); // 링크 클릭 동작 취소
        loadPage('/myWorkSpace/reportList.do','main-content');
    });

    $('#manager_reportListMenu').click(function(e) {
    	loadPage('/myWorkSpace/reportList.do','main-content')
        e.preventDefault(); // 링크 클릭 동작 취소
    });
    
    $('#manager_editMenu').click(function(e) {
        e.preventDefault(); // 링크 클릭 동작 취소
        loadPage('/myWorkSpace/manager/manager_edit.jsp','main-content');
    });
    
    $('#manager_productMenu').click(function(e) {
        e.preventDefault(); // 링크 클릭 동작 취소
        loadPage('/myWorkSpace/manager/manager_product.jsp','main');
    });
    
    
});
</script>
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
                                    <div id="manager_memberList" class="p-4 border rounded text-center bg-light d-block text-decoration-none">
                                        	회원정보 관리
                                    </div>
                                </div>
                                <div class="col">
                                    <div id="manager_reportList" class="p-4 border rounded text-center bg-light d-block text-decoration-none" >
                                        	신고 내역
                                    </div>
                                </div>
                                <div class="col">
                                    <a href="/myWorkSpace/chatting/FAQ_form.jsp" class="p-4 border rounded text-center bg-light d-block text-decoration-none">
                                        	FAQ 작성하기
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
                                <li class="nav-item mb-2"><div id="manager_memberListMenu" class="nav-link text-success border rounded p-2" >회원정보 관리</div></li>
                                <li class="nav-item mb-2"><div id="manager_reportListMenu" class="nav-link text-success border rounded p-2" >신고 내역</div></li>
                                <li class="nav-item mb-2"><div id="manager_editMenu" class="nav-link text-success border rounded p-2">정보 수정</div></li>
                                <li class="nav-item mb-2"><a href="<%= request.getContextPath() %>/faqList.do" class="nav-link text-success border rounded p-2" >FAQ</a></li>
                                <li class="nav-item mb-2"><div id="manager_productMenu" class="nav-link text-success border rounded p-2" >상품 관리</div></li>
                            </ul>
                        </nav>
                    </div>
                </aside>
            </div>
        </main>
	</div>
<%@ include file="../footer.jsp"%>