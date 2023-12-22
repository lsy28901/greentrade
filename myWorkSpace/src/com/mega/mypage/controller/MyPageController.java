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

public class MyPageController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("UserId");
		
		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();
		MyPageService myPageService = new MyPageServiceImpl();
		UserDAO dao = new UserDAO();
		UserDTO udto = dao.getUserDTO(uid);
		MyPageDTO mydto = myPageService.getMyPageInfo(udto.getUserno());
		
		req.setAttribute("mydto", mydto);
		forward.setRedirect(false);
		forward.setPath("/mypage/mypage_main.jsp");
		
		return forward;
	}

}
