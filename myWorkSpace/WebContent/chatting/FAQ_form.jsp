<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ include file="../header.jsp"%>
<main class="container-fluid mt-4 bg-white border" style="min-height: 600px;"> 
    <div class="row">
        <form class="col-md-12" action="/myWorkSpace/faqSave.do" method="post">
            <div>
                <!-- 첫 번째 div -->
                <div class="p-2 rounded">
                    <div class="border rounded d-flex align-items-center mb-4">
                        <div class="bg-secondary rounded-circle h-12 w-12"></div>
                        <input type="text" class="text-center flex-fill" 
                        placeholder="faq제목을 입력하세요" style="font-size: 24px;" name="faqTitle" required/> 
                    </div>
                    <div class="p-2 row">
                        <div class="col-sm-3 text-center border rounded">
                            	작성 날짜 :  <br><span><%= new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %></span>
                        </div>
                        <div class="col-sm"></div>
                        <div class="col-sm"></div>
                        <div class="col-sm-3 text-center border rounded">
                            	카테 고리 :  
                            <input type="text" class="text-center"
                            	placeholder="카테고리를 입력" style="border: none;" name="faqCate" required>
                        </div>
                    </div>
                </div>                
            </div>
            <div class="border rounded">
                <textarea
                style="min-height: 300px; max-height: 600px;
                min-width: 600px; border: none; width: 100%;" name="faqContent" required 
                maxlength="320"></textarea>
            </div>
            <div class="float-end mt-4">
                <button type="submit" class="btn btn-success">
                    	작성 완료
                </button>
            </div>
        </form>
    </div>
</main>
<%@ include file="../footer.jsp"%> 