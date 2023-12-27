package com.mega.pay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import com.mega.detailitem.service.DetailItemService;
import com.mega.detailitem.service.impl.DetailItemServiceImpl;
import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.pay.service.PayService;
import com.mega.pay.service.impl.PayServiceImpl;
import com.mega.product.ProductDTO;
import com.mega.user.UserDTO;

public class PayController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println("PayController 호출");
        int productno = Integer.parseInt(req.getParameter("productno"));
        int userno = Integer.parseInt(req.getParameter("userno"));
        //HttpSession session = req.getSession();
		
		ActionForward forward = new ActionForward();
		DetailItemService detailItemService = new DetailItemServiceImpl();
		PayService payService = new PayServiceImpl();
		ProductDTO prodto = detailItemService.getProductInfo(productno);
		UserDTO udto = payService.getUserAdd(userno);
		
		req.setAttribute("prodetail", prodto);
		req.setAttribute("user", udto);
		
		forward.setRedirect(false);
		forward.setPath("/pay/pay.jsp");

		return forward;
	}

}
