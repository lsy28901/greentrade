package com.mega.detailitem.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.product.ProductDTO;
import com.mega.detailitem.service.DetailItemService;
import com.mega.detailitem.service.impl.DetailItemServiceImpl;

public class DetailItemController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("detailItemController 호출");
        int productno = Integer.parseInt(req.getParameter("productno"));


		ActionForward forward = new ActionForward();
		DetailItemService detailItemService = new DetailItemServiceImpl();
		ProductDTO prodto = detailItemService.getProductInfo(productno);
		req.setAttribute("prodetail", prodto);
		forward.setRedirect(false);
		forward.setPath("/detailItem/detailitem.jsp");
		
		return forward;
	}

}
