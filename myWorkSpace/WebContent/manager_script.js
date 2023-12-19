function loadPage(pageUrl,pageid) {
    $.ajax({
        url: pageUrl,
        success: function(data) {
            // 성공적으로 데이터를 가져오면 메인 영역에 표시
            $('#'+pageid).html(data);
        }
    });
}


// 링크를 클릭할 때 페이지를 로드하도록 이벤트 핸들러 추가
$(document).ready(function() {

    $('#manager_memberList').click(function(e) {
        e.preventDefault(); // 링크 클릭 동작 취소
        loadPage('manager_memberList.jsp','main-content');
    });
    
    $('#manager_memberListMenu').click(function(e) {
        e.preventDefault(); // 링크 클릭 동작 취소
        loadPage('manager_memberList.jsp','main-content');
    });

    $('#manager_reportList').click(function(e) {
        e.preventDefault(); // 링크 클릭 동작 취소
        loadPage('manager_reportList.jsp','main-content');
    });

    $('#manager_reportListMenu').click(function(e) {
        e.preventDefault(); // 링크 클릭 동작 취소
        loadPage('manager_reportList.jsp','main-content');
    });
    
    $('#manager_editMenu').click(function(e) {
        e.preventDefault(); // 링크 클릭 동작 취소
        loadPage('manager_edit.jsp','main-content');
    });
    
    $('#manager_productMenu').click(function(e) {
        e.preventDefault(); // 링크 클릭 동작 취소
        loadPage('manager_product.jsp','main');
    });
    
    
});