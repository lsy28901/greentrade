<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.mega.user.UserDTO" %>
<%@ page import ="com.mega.user.UserDAO" %>
<%
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");
	
	//어플리케이션 객체를 사용해 web.xml에서 디비 정보를 가져옴
	/* String driver = application.getInitParameter("OracleDriver");
	String url = application.getInitParameter("OracleURL");
	String id = application.getInitParameter("OracleId");
	String pwd = application.getInitParameter("OraclePwd"); */
	
	UserDAO dao = new UserDAO();
	UserDTO userDTO = dao.getUserDTO(userId, userPwd);
	
	if(userDTO.getUser_id() != null){
		//로그인성공
		//세션에 로그인한 유저의 아이디를 저장
		session.setAttribute("UserId", userDTO.getUser_id());
		session.setAttribute("UserName", userDTO.getUser_name());
		session.setAttribute("UserStaff", userDTO.getStaff());
		request.setAttribute("LoginSuccessMsg","로그인 성공");
		request.getRequestDispatcher("login.jsp").forward(request,response);
	}else{
		//로그인실패
		request.setAttribute("LoginErrMsg","로그인실패");
		request.getRequestDispatcher("login.jsp").forward(request,response);
	}
%>
