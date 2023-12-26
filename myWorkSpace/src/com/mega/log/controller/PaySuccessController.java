package com.mega.log.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.log.service.BuyLogService;
import com.mega.log.service.impl.BuyLogServiceImpl;
import com.mega.product.ProductDAO;
import com.mega.product.ProductDTO;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class PaySuccessController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("PaySuccess액션컨트롤러");

		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();
		
		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("UserId");
		int productno = Integer.parseInt(req.getParameter("productno"));
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = pdao.getProductinfo(productno);
		// DB 접근 객체 DAO , 저장- 전송 객체 호출 DTO
		UserDAO dao = new UserDAO();
		UserDTO udto = dao.getUserDTO(uid);
		BuyLogService buyLogService = new BuyLogServiceImpl();
		
		buyLogService.updateLogs(pdto, udto.getUserno());
		req.setAttribute("productno", pdto.getProductno());
		forward.setPath("/myWorkSpace/index.do");
		
		return forward;
	}

}
