package com.mega.findid.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.findid.service.FindIdService;
import com.mega.findid.service.impl.FindIdServiceImpl;
import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.login.service.LoginService;
import com.mega.login.service.impl.LoginServiceImpl;
import com.mega.user.UserDTO;

public class FindIdController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		
		String email = req.getParameter("email");
		String user_call = req.getParameter("user_call");
		
		FindIdService findidservice = new FindIdServiceImpl();
		UserDTO userDTO = findidservice.findUserIdDTO(email, user_call);
		
		System.out.println(userDTO);
		if(userDTO.getEmail() != null){
			
				req.setAttribute("userId",userDTO.getUser_id());
				forward.setRedirect(false);
				forward.setPath("/login/find_id.jsp");
			
		}else{
			//로그인실패
//			req.setAttribute("LoginErrMsg","로그인실패");
//			forward.setRedirect(true);
//			forward.setPath("/login/login.jsp");
			
		}
		
		return forward;
	}

}
