<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail item</title>
<link href="/myWorkSpace/detailItem/detailitem.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	function toggleLike() {
	    var productno = ${prodetail.productno};
	    var userno = ${UserNo};
	    var likestat = ${heartstat.getLikestat()};
		console.log(productno);
		console.log(userno);
		console.log(likestat);
		
		//찜한 상태가 아닐때
		if(likestat == 0) {
			$.ajax({
		        type: "POST",
		        url: "/myWorkSpace/doheart.do",
		        data: {productno: productno, userno: userno, likestat:likestat},
		        success: function (response) {
					window.location.reload();
		        },
		        error: function (error) {
		            // Ajax 요청에 실패했을 때의 처리
		            console.error("Ajax request failed:", error);
		        }
	   		 });
			
		}
		else { // 찜한 상태일때
			$.ajax({
		        type: "POST",
		        url: "/myWorkSpace/cancleheart.do",
		        data: {productno: productno, userno: userno, likestat:likestat},
		        success: function (response) {
					window.location.reload();
		        },
		        error: function (error) {
		            // Ajax 요청에 실패했을 때의 처리
		            console.error("Ajax request failed:", error);
		        }
	   		 });
			
		}
}

</script>
</head>
<style>
.container {
	margin: 0;
}

.bg-green {
	background-color: #BFF6B6;
}

.text-black {
	color: black;
}

.bg-black {
	background-color: black;
}
</style>
</head>
<body>
	<main>
		<div id="Product_container">
			<div id="Product_info1_container">
				<img id="Product_img" src="${prodetail.image}">
			</div>
			
			<div id="Product_info2_container">
				<div>
					<h2 style="padding:10px;">${prodetail.title}</h2>
					<h2 style="padding:10px;">${prodetail.price}원</h2>
				</div>
				<hr>
				
				<div id="info2_detail">
					<div style="padding:10px;">
						<button id="likeBtn" onclick="toggleLike()">찜하기
							<c:if test="${heartstat.getLikestat() eq 0 }"> <!-- 찜한 상품이 아닐때 -->
								<svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd"><path d="M12 21.593c-5.63-5.539-11-10.297-11-14.402 0-3.791 3.068-5.191 5.281-5.191 1.312 0 4.151.501 5.719 4.457 1.59-3.968 4.464-4.447 5.726-4.447 2.54 0 5.274 1.621 5.274 5.181 0 4.069-5.136 8.625-11 14.402m5.726-20.583c-2.203 0-4.446 1.042-5.726 3.238-1.285-2.206-3.522-3.248-5.719-3.248-3.183 0-6.281 2.187-6.281 6.191 0 4.661 5.571 9.429 12 15.809 6.43-6.38 12-11.148 12-15.809 0-4.011-3.095-6.181-6.274-6.181"/></svg>
							</c:if>
							<c:if test="${heartstat.getLikestat() eq 1 }"> <!-- 찜한 상품일때-->
								<svg id="redheart" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M12 4.435c-1.989-5.399-12-4.597-12 3.568 0 4.068 3.06 9.481 12 14.997 8.94-5.516 12-10.929 12-14.997 0-8.118-10-8.999-12-3.568z"/></svg>
							</c:if>
						</button>
						<span><a id="go_MarketPrice" href="../marketPrice/MarketPrice.jsp">상품 시세 조회하러 가기</a></span><br><br>
						<span>상품상태</span><br>
						<span>${prodetail.productStatus}</span>
					</div>
					<div id="info2_img">
						<img>
					</div>
				</div>
				
				<div id="button_Container">
					<button id="chatBtn"><button id="chatBtn" >
					<a href="/myWorkSpace/chat.do?productno=${prodetail.productno}">
					채팅하기</button>
					<button id="tradeBtn"><a href="/myWorkSpace/pay/pay.jsp?productno=${prodetail.productno}">거래하기</a></button>
				</div>
			</div>
		</div>
		<hr>
		
		<div id="seller_container">
			<div id="Product_ment">
				<span>상품설명</span>
				<p>${prodetail.productDetail}</p>
			</div>
			
			<div id="Seller_info">
				<span>판매자 정보</span>
				<p>${sellerInfo.nickname}</p>
				<span>그린스코어</span>
				<p>${sellerInfo.greenscore}</p>
				<a href="/myWorkSpace/sellinfo.do?userno=${sellerInfo.userno}">${sellerInfo.nickname}님의 정보 더보기</a>
			</div>
		</div>
		<hr>

		<c:if test="${ prodetail.trademethod eq '직거래'}">
			<div>
				<span>${ prodetail.tradelocation }</span>
				<div id="map">
					
				</div>
			</div>
		</c:if>
	</main>
<%@ include file="../footer.jsp"%>
</body>
</html>