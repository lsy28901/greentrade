package com.mega.selllist.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.selllist.SellListDTO;
import com.mega.selllist.service.SellListService;
import com.mega.selllist.service.impl.SellListServiceImpl;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class SellListController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("getSellList액션컨트롤러");

		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();
		
		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("UserId");
		UserDAO dao = new UserDAO();
		UserDTO udto = dao.getUserDTO(uid);
		
		SellListService sellListService = new SellListServiceImpl();
		List<SellListDTO> sellList = sellListService.getSellList(udto.getUserno());
		
		req.setAttribute("sellList", sellList);
		
		forward.setRedirect(false);
		forward.setPath("/mypage/mypage_selllist.jsp");
		
		return forward;
	}
	
}
