package com.mega.buylist.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.buylist.BuyListDTO;
import com.mega.buylist.service.BuyListService;
import com.mega.buylist.service.impl.BuyListServiceImpl;
import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class BuyListController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("getBuyList액션컨트롤러");

		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();
		
		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("UserId");
		UserDAO dao = new UserDAO();
		UserDTO udto = dao.getUserDTO(uid);
		
		BuyListService buyListService = new BuyListServiceImpl();
		List<BuyListDTO> buyList = buyListService.getBuyList(udto.getUserno());
		
		req.setAttribute("buyList", buyList);
		
		forward.setRedirect(false);
		forward.setPath("/mypage/mypage_buylist.jsp");
		
		return forward;
	}

}
