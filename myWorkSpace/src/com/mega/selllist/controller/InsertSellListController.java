package com.mega.selllist.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.product.ProductDAO;
import com.mega.product.ProductDTO;
import com.mega.selllist.service.SellListService;
import com.mega.selllist.service.impl.SellListServiceImpl;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class InsertSellListController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("insertSellList액션컨트롤러");

		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();

		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("UserId");
		UserDAO dao = new UserDAO();
		UserDTO udto = dao.getUserDTO(uid);
		int productno = Integer.parseInt(req.getParameter("productno"));
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = pdao.getProductinfo(productno);

		SellListService sellListService = new SellListServiceImpl();
		int result = sellListService.insertSellList(pdto, udto.getUserno());
		if (result > 0) {
			System.out.println("selllist insert성공");
		} else {
			System.out.println("selllist insert실패");
		}
//		req.setAttribute("productno", productno);

		forward.setRedirect(true);
		forward.setPath("/myWorkSpace/mypageBuylog.do");

		return forward;
	}

}
