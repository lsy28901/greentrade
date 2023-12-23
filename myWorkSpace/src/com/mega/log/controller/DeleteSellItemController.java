package com.mega.log.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.log.service.SellLogService;
import com.mega.log.service.impl.SellLogServiceImpl;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class DeleteSellItemController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("DeleteSellItem액션컨트롤러");

		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();

		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("UserId");
		// DB 접근 객체 DAO , 저장- 전송 객체 호출 DTO
		UserDAO dao = new UserDAO();
		UserDTO udto = dao.getUserDTO(uid);
		int productno = Integer.parseInt(req.getParameter("productno"));
		int userno = udto.getUserno();
		System.out.println(productno+" "+userno);
		SellLogService sellLogService = new SellLogServiceImpl();
		sellLogService.deleteSellItem(productno, userno);
		
		forward.setRedirect(false);
		forward.setPath("mypageSelllog.do");
		return forward;
	}

}
