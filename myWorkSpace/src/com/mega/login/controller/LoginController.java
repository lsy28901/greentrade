package com.mega.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.login.service.LoginService;
import com.mega.login.service.impl.LoginServiceImpl;
import com.mega.user.UserDTO;

public class LoginController implements Action{
	
			
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();
		
		String userId = req.getParameter("user_id");
		String userPwd = req.getParameter("user_pw");
		
		HttpSession session = req.getSession();
		//어플리케이션 객체를 사용해 web.xml에서 디비 정보를 가져옴
		/* String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pwd = application.getInitParameter("OraclePwd"); */
		
		LoginService loginservice = new LoginServiceImpl();
		UserDTO userDTO = loginservice.getUserDTO(userId, userPwd);
		System.out.println(userDTO);
		if(userDTO.getUser_id() != null){
			//로그인성공
			//세션에 로그인한 유저의 아이디를 저장
			session.setAttribute("UserId", userDTO.getUser_id());
			session.setAttribute("UserName", userDTO.getUser_name());
			session.setAttribute("UserStaff", userDTO.getStaff());
			session.setAttribute("UserNo", userDTO.getUserno());
			req.setAttribute("LoginSuccessMsg","로그인 성공");
			
			if(userDTO.getStaff().equals("manager")){
				req.setAttribute("LoginManagerSuccessMsg","관리자 로그인 성공");
				forward.setRedirect(true);
				forward.setPath("/myWorkSpace/manager/manager_main.jsp");
			}else{
				System.out.println("일반 유저 로그인");
				forward.setRedirect(true);
				forward.setPath("/myWorkSpace/main.jsp");
				System.out.println(forward);
			}
		}else{
			//로그인실패
			req.setAttribute("LoginErrMsg","로그인실패");
			forward.setRedirect(true);
			forward.setPath("/myWorkSpace/login/login.jsp");
			
		}
		System.out.println(forward);
		return forward;
	}
	
}
