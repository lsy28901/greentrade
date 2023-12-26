package com.mega.detailitem.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.product.ProductDTO;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;
import com.mega.heart.HeartDTO;
import com.mega.detailitem.service.DetailItemService;
import com.mega.detailitem.service.impl.DetailItemServiceImpl;
import com.mega.heart.service.DoHeartService;
import com.mega.heart.service.impl.DoHeartServiceImpl;

public class DetailItemController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println("detailItemController 호출");
        int productno = Integer.parseInt(req.getParameter("productno"));
        String userno = req.getParameter("userno");
        HttpSession session = req.getSession();
        String uid = (String) session.getAttribute("UserId");
        UserDAO dao = new UserDAO();
		UserDTO udto = dao.getUserDTO(uid);
		
		ActionForward forward = new ActionForward();
		DetailItemService detailItemService = new DetailItemServiceImpl();
		DoHeartService heartService = new DoHeartServiceImpl();
		ProductDTO prodto = detailItemService.getProductInfo(productno);
		HeartDTO heartdto = heartService.getHeartStatus(udto.getUserno(), prodto.getProductno());
		req.setAttribute("prodetail", prodto);
		req.setAttribute("heartstat", heartdto);
		System.out.println(udto.getUserno());
		System.out.println(prodto.getProductno());
		System.out.println(prodto.getTradelocation());
		
		forward.setRedirect(false);
		forward.setPath("/detailItem/detailitem.jsp");
		

		return forward;
	}

}
