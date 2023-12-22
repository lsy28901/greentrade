<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="com.mega.user.JoinDTO" %>
	<%@ page import ="com.mega.user.UserDAO" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userName = request.getParameter("user_name");
	String userCall = request.getParameter("user_call");
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_password");
	String userEmail = request.getParameter("email");
	String userNickname = request.getParameter("nickname");
	String userImgurl = request.getParameter("imgurl");
	String userStaff = request.getParameter("staff");
	String userAddress1 = request.getParameter("address1");
	String userAddress2 = request.getParameter("address2");
	String userPostnum = request.getParameter("postnum");
	
	UserDAO dao = new UserDAO();
	JoinDTO dto = new JoinDTO();
	
	dto.setUser_name(userName);
	dto.setUser_call(userCall);
	dto.setUser_id(userId);
	dto.setUser_password(userPwd);
	dto.setEmail(userEmail);
	dto.setNickname(userNickname);
	dto.setImgurl(userImgurl);
	dto.setStaff(userStaff);
	dto.setAddress1(userAddress1);
	dto.setAddress2(userAddress2);
	dto.setPostnum(userPostnum);
	
	int result = dao.insertJoinDTO(dto);//잘 반영됬으면 0이 아님
	
	if(result!=0){
		request.getRequestDispatcher("../main.jsp").forward(request,response);
	}else{
		response.sendRedirect("join.jsp");
	}
	
%>