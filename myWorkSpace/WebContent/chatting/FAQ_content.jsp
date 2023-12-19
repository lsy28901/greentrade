<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
  hr {
    width: 80%;
    margin: 0 auto;
  }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body class="bg-light">
    <div class="container-fluid" align="center">
        <main class="container mt-4" id="main">
            <div class="row">
                <section class="col-md-12" >
                    <div align="center" class="border p-4 rounded bg-white" style="min-height: 600px;">
                        <div>
                            <div class="d-flex align-items-center mb-4">
                                <div class="bg-secondary rounded-circle h-12 w-12"></div>
                                <span class=" text-center flex-fill" style="font-size: 24px;">자주 묻는 질문</span>
                            </div>
                            <hr>
                            <div class="border rounded d-flex align-items-center mt-4" style="width:80%">
	                    		<div class="bg-secondary rounded-circle h-12 w-12"></div>
	                            <span class=" text-center flex-fill" style="font-size: 24px; background-color:#D5F4DF"> ${faqContent.faqtitle}</span>
                       		</div>
                       		<div class="border rounded mb-2 mt-2 pd-4"style="min-height: 400px; width:80%;">
                        		 ${faqContent.faqcontent}
                    		</div>
                    		<div class="float-right">
		                    <button type="submit" class="btn btn-success back_FAQ_list">
		                        	목록으로
		                    </button>
	                	</div>
                        </div>
                    </div>     
                </section>
            </div>
        </main>
	</div>
<%@ include file="../footer.jsp"%>
<script>
    $(document).ready(function() {
        $('.back_FAQ_list').click(function(e) {
            e.preventDefault(); // 버튼 클릭 동작 취소
            window.location.href = 'faqList.do'; // 페이지 이동
        });
    });
</script>