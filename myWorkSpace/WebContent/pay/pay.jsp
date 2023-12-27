<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pay</title>
<link href="pay/pay.css" rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
			
	var IMP = window.IMP;
	IMP.init("imp31327821");
   
   function requestPay() {
        IMP.request_pay(
          {
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid: "${prodetail.productno}",
            name: "${prodetail.title}",
            amount: "${prodetail.price}",
            buyer_email: "${user.email}",
            buyer_name: "${user.user_name}",
            buyer_tel: "${user.user_call}",
            buyer_addr: "{user.address1}" + "{user.address2}",
            buyer_postcode: "${user.postnum}",
          },
          function (rsp) {
        	  if ( rsp.success ) {
        	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
        	    	jQuery.ajax({
        	    		url: "/myWorkSpace/paySuccess.do", //cross-domain error가 발생하지 않도록 주의해주세요
        	    		type: 'POST',
        	    		dataType: 'json',
        	    		data: {
        		    		imp_uid : rsp.imp_uid
        		    		//기타 필요한 데이터가 있으면 추가 전달
        	    		}
        	    	}).done(function(data) {
        	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
        	    		if ( everythings_fine ) {
        	    			var msg = '결제가 완료되었습니다.';
        	    			msg += '\n고유ID : ' + rsp.imp_uid;
        	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
        	    			msg += '\결제 금액 : ' + rsp.paid_amount;
        	    			msg += '카드 승인번호 : ' + rsp.apply_num;
        	    			
        	    			alert(msg);
        	    		} else {
        	    			//[3] 아직 제대로 결제가 되지 않았습니다.
        	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
        	    		}
        	    	});
        	    } else {
        	        var msg = '결제에 실패하였습니다.\n';
        	        msg += '에러내용 : ' + rsp.error_msg;
        	        
        	        alert(msg);
        	    }
          });
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
      <div id="add">
         <div>
            <p id="Address">배송지명</p>
            <p>${user.user_name }</p>
            <p>${user.user_call }</p>
            <p>${user.address1 }, ${user.address2 } </p>
            <p>우편번호: ${user.postnum }</p>
            
         </div>
         
         <div id="updateAddContainer">
            <div id="updateAdd">
               <button>
                  <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-ypdb8q"><path d="M8 14H14" stroke="#5A616B" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"></path><path d="M13.3882 2.61214L13.3881 2.61214C13.2074 2.43138 12.9928 2.28799 12.7566 2.19017C12.5205 2.09234 12.2673 2.04199 12.0117 2.04199C11.4954 2.04199 11.0003 2.24708 10.6353 2.61214L2.84769 10.3997C2.76759 10.4798 2.71077 10.5802 2.68329 10.6901L2.06029 13.1821C2.00704 13.3951 2.06945 13.6204 2.22468 13.7756C2.37992 13.9308 2.60523 13.9932 2.81821 13.94L5.31023 13.317C5.42013 13.2895 5.52049 13.2327 5.60059 13.1526L13.3881 5.36503C13.5689 5.18428 13.7123 4.96969 13.8101 4.73352C13.9079 4.49734 13.9583 4.24421 13.9583 3.98859C13.9583 3.73296 13.9079 3.47983 13.8101 3.24365C13.7123 3.00748 13.5689 2.79289 13.3882 2.61214Z" stroke="#5A616B" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                  <p><a href="/myWorkSpace/AddFrm.do?userno=${ user.userno}&productno=${prodetail.productno}">배송지 수정</a></p>
               </button>
            </div>
         </div>
      </div>
      
      <div id="mainContent">
         <div id="product_info">
            <div>
               <p>상품정보</p>
            </div>
            
            <div>
               <img id="product_img" src="${prodetail.image}">
            </div>
         </div>
         
         <div id="price_info">
            <div id="priceContainer">
               <div>
                  <p>최종 결제 금액</p>
                  <p>${prodetail.price}</p>
               </div>
               <div>
                  <p>상품금액</p>
                  <p>${prodetail.price}</p>
               </div>
               <div>
                  <p>수수료</p>
                  <p>0원</p>
               </div>
            </div>
         </div>
      </div>
      
       <div id="payBtnContainer">
         <button type="button" id="payBtn" onclick="requestPay()">${prodetail.price}원 결제</button>
      </div>
   </main>
<%@ include file="../footer.jsp"%>
</body>
</html>