function loadPage(pageUrl,pageid) {
    $.ajax({
        url: pageUrl,
        success: function(data) {
            // 성공적으로 데이터를 가져오면 메인 영역에 표시
            $('#'+pageid).html(data);
        }
    });
}

//파라미터의 이름을 받아와서 저장
function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}



