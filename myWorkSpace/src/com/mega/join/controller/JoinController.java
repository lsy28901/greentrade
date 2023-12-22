package com.mega.join.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.join.service.JoinService;
import com.mega.join.service.impl.JoinServiceImpl;
import com.mega.user.JoinDTO;

public class JoinController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String userName = req.getParameter("user_name");
		String userCall = req.getParameter("user_call");
		String userId = req.getParameter("user_id");
		String userPwd = req.getParameter("user_password");
		String userEmail = req.getParameter("email");
		String userNickname = req.getParameter("nickname");
		String userImgurl = req.getParameter("imgurl");
		String userStaff = req.getParameter("staff");
		String userAddress1 = req.getParameter("address1");
		String userAddress2 = req.getParameter("address2");
		String userPostnum = req.getParameter("postnum");
		
		JoinService joinservice = new JoinServiceImpl();
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
		
		int result = joinservice.insertJoinDTO(dto);//잘 반영됬으면 0이 아님
		
		if(result!=0){
			forward.setRedirect(true);
			forward.setPath("/myWorkSpace/main.jsp");
		}else{
			forward.setRedirect(true);
			forward.setPath("/myWorkSpace/login/join.jsp");
		}
		return forward;
	}
	
}