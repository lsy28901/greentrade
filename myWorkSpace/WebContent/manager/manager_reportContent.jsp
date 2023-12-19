<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
        <main class="container-fluid mt-4 bg-white border" style="min-height: 600px;"> 
            <div class="row">
                <section class="col-md-12">
                    <div >
                        <!-- 첫 번째 div -->
                        <div class="p-2 rounded ">
                            <div class="border rounded d-flex align-items-center mb-4">
                                <div class="bg-secondary rounded-circle h-12 w-12"></div>
                                <span class=" text-center flex-fill" style="font-size: 24px; background-color:#D5F4DF">${reportContent.reporttitle }</span>
                            </div>
                            <div class="p-2 row">
                                <div class="col-sm-4 text-center border rounded">신고 날짜 : ${reportContent.reportdate }</div>
                                <div class="col-sm "></div>
                                <div class="col-sm "></div>
                                <div class="col-sm-4 text-center border rounded">신고 대상 : ${reportContent.targetid }</div>
                            </div>
                        </div>                
                    </div>
                    <div class="border rounded" style="min-height: 400px; min-width: 600px;">
                        	${reportContent.reportcontent}
                    </div>
                    <div class="float-end mt-4">
                        <button type="submit" class="btn btn-success">
                            	신고 등록
                        </button>
                    </div>
                </section>
            </div>
        </main>

<%@ include file="../footer.jsp"%>