package com.mega.log.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.log.LogDTO;
import com.mega.log.service.BuyLogService;
import com.mega.log.service.SellLogService;
import com.mega.log.service.impl.BuyLogServiceImpl;
import com.mega.log.service.impl.SellLogServiceImpl;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class BuyLogController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("BuyLog액션컨트롤러");

		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();
		
		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("UserId");
		// DB 접근 객체 DAO , 저장- 전송 객체 호출 DTO
		UserDAO dao = new UserDAO();
		UserDTO udto = dao.getUserDTO(uid);
		BuyLogService buyLogService = new BuyLogServiceImpl();
		
		List<LogDTO> buyLogList = new ArrayList<LogDTO>();
		buyLogList = buyLogService.getBuyLogList(udto.getUserno());
		
		req.setAttribute("buyLogList", buyLogList);
		forward.setRedirect(false);
		forward.setPath("/mypage/mypage_buylog.jsp");
		
		return forward;
	}

}
