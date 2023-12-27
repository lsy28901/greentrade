<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="addFrm/AddFrm.css" rel="stylesheet">
</head>
<body>
<main>
	<form id="AddFrm" action="/myWorkSpace/updateAddress.do" method="POST">
		<div id="inputContainer">
			<input style="display:none;" name="userno" value="${ user.userno}">
			<input style="display:none;" name="productno" value="${ productno}">
			<input type="text" placeholder="받으실분의 성함" name="user_name">
			<input type="text" placeholder="휴대폰번호 ( - 제외하고 번호만 입력해주세요)" name="user_call">
			<input type="text" placeholder="도로명주소" name="address1">
			<input type="text" placeholder="상세주소" name="address2">
			<input type="text" placeholder="우편번호" name="postnum">
			<input id="submitBtn" type="submit" value="저장">
		</div>
	</form>
</main>
<%@ include file="../footer.jsp"%>
</body>
</html>