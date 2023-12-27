package com.mega.findpassword.controller;

import java.util.Properties;
import java.security.SecureRandom;
import java.util.Base64;

//import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.findpassword.service.FindPasswordService;
import com.mega.findpassword.service.impl.FindPasswordServiceImpl;
import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.user.UserDTO;


public class UpdatePasswordController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		
		
		String userId = req.getParameter("user_id");
		String user_newpw = req.getParameter("user_newpw");
		req.setAttribute("Id", userId);
		//String userPwd = req.getParameter("user_email");
		
		FindPasswordService findpasswordservice = new FindPasswordServiceImpl();
		UserDTO userDTO = findpasswordservice.findpasswordDTO(userId);
		
		if (user_newpw != null && !user_newpw.trim().isEmpty()) {
		    //System.out.println("실행됨" + user_newpw);
			
			FindPasswordService updatepasswordservice = new FindPasswordServiceImpl();
			UserDTO updateDTO = updatepasswordservice.updatepasswordDTO(userId, user_newpw);
			
			if (updateDTO != null) {
				// 업데이트가 성공했을 때의 로직을 추가할 수 있음
				System.out.println("Password updated successfully!");
				forward.setRedirect(false);
				forward.setPath("./main.jsp");
			} else {
				// 업데이트가 실패했을 때의 로직을 추가할 수 있음
				System.out.println("Password update failed!");
			}
		    
		} else {
		    System.out.println("조건문 실행 안됨");
		}
		
		 
		
		
		
		
		return forward;
	}
	

   

}
