package com.mega.updateaddress.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.detailitem.service.DetailItemService;
import com.mega.detailitem.service.impl.DetailItemServiceImpl;
import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.pay.service.PayService;
import com.mega.pay.service.impl.PayServiceImpl;
import com.mega.product.ProductDTO;
import com.mega.updateaddress.service.UpdateAddressService;
import com.mega.updateaddress.service.impl.UpdateAddressServiceImpl;
import com.mega.user.UserDTO;

public class UpdateAddressController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println("UpdateAddressController 호출");
        int userno = Integer.parseInt(req.getParameter("userno"));
        int productno = Integer.parseInt(req.getParameter("productno"));
        
		String user_name = req.getParameter("user_name");
		String user_call = req.getParameter("user_call");
		String address1 = req.getParameter("address1");
		String address2 = req.getParameter("address2");
		String postnum = req.getParameter("postnum");
		
		ActionForward forward = new ActionForward();
		UserDTO dto = new UserDTO();
		
		dto.setUserno(userno);
		dto.setUser_name(user_name);
		dto.setUser_call(user_call);
		dto.setAddress1(address1);
		dto.setAddress2(address2);
		dto.setPostnum(postnum);
		
		UpdateAddressService UpdateAddressService = new UpdateAddressServiceImpl();
		UpdateAddressService.UpdateAddress(dto);
		
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
