<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 데이터 지우기
	session.removeAttribute("UserId");
	session.removeAttribute("UserName");
	session.invalidate();
	//session.invalidate(); //session전체 삭제
	
	response.sendRedirect("login.jsp");
%>