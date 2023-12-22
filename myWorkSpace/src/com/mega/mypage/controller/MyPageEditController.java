package com.mega.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.mypage.MyPageDTO;
import com.mega.mypage.service.MyPageService;
import com.mega.mypage.service.impl.MyPageServiceImpl;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class MyPageEditController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		MyPageService myPageService = new MyPageServiceImpl();
		
		
		if (req.getMethod().equals("GET")) {
			System.out.println("get방식 마이페이지수정");
			HttpSession session = req.getSession();
			String uid = (String) session.getAttribute("UserId");
			UserDAO dao = new UserDAO();
			UserDTO udto = dao.getUserDTO(uid);
			
			System.out.println(udto);
			req.setAttribute("udto", udto);
			forward.setRedirect(false);
			forward.setPath("/mypage/mypage_edit.jsp");
			
		} else if (req.getMethod().equals("POST")) {
			System.out.println("Post방식 마이페이지수정");
			HttpSession session = req.getSession();
			String uid = (String) session.getAttribute("UserId");
			UserDAO dao = new UserDAO();
			UserDTO udto = dao.getUserDTO(uid);
			System.out.println(udto);
			String email = req.getParameter("email");
			String user_call = req.getParameter("user_call");
			String address1 = req.getParameter("address1");
			String address2 = req.getParameter("address2");
			System.out.println(udto);
			udto.setEmail(email);
			udto.setUser_call(user_call);
			udto.setAddress1(address1);
			udto.setAddress2(address2);
			myPageService.updateMypage(udto);
			forward.setRedirect(true);
			forward.setPath("/myWorkSpace/mypageMain.do");
		}
		
		return forward;
	}

}
