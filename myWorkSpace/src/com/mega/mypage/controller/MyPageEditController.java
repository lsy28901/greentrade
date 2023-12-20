package com.mega.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.mypage.MyPageDTO;
import com.mega.mypage.service.MyPageService;
import com.mega.mypage.service.impl.MyPageServiceImpl;

public class MyPageEditController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		MyPageService myPageService = new MyPageServiceImpl();
		if (req.getMethod().equals("GET")) {
			MyPageDTO mydto = myPageService.getMyPageInfo();
			req.setAttribute("mydto", mydto);
			forward.setRedirect(false);
			forward.setPath("/myWorkSpace/mypage_main.do");
		} else if (req.getMethod().equals("POST")) {
			String email = req.getParameter("email");
			String user_call = req.getParameter("user_call");
			String address1 = req.getParameter("address1");
			String address2 = req.getParameter("address2");
			MyPageDTO dto = myPageService.getMyPageInfo();
			dto.setEmail(email);
			dto.setUser_call(user_call);
			dto.setAddress1(address1);
			dto.setAddress2(address2);
			myPageService.updateMypage(dto);
		}
		
		return forward;
	}

}
