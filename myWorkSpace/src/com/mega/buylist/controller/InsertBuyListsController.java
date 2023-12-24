package com.mega.buylist.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.buylist.service.BuyListService;
import com.mega.buylist.service.impl.BuyListServiceImpl;
import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.product.ProductDAO;
import com.mega.product.ProductDTO;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class InsertBuyListsController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("insertBuyList액션컨트롤러");

		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();
		
		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("UserId");
		UserDAO dao = new UserDAO();
		UserDTO udto = dao.getUserDTO(uid);
		int productno = Integer.parseInt(req.getParameter("productno"));
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = pdao.getProductinfo(productno);
		
		BuyListService buyListService = new BuyListServiceImpl();
		int result = buyListService.insertBuyList(pdto, udto.getUserno());
		if(result>0) {
			System.out.println("buylist insert성공");
		}else {
			System.out.println("buylist insert실패");
		}
		
		forward.setRedirect(true);
		forward.setPath("/myWorkSpace/insertSellList.do?productno="+productno);
		
		
		return forward;
	}

}
