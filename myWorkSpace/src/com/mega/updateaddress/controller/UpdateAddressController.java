package com.mega.updateaddress.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.address.AddressDTO;
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
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("UserId");
        int productno = Integer.parseInt(req.getParameter("productno"));
        
		String receivername = req.getParameter("receivername");
		String phone = req.getParameter("phone");
		String address1 = req.getParameter("address1");
		String address2 = req.getParameter("address2");
		String postnum = req.getParameter("postnum");
		
		ActionForward forward = new ActionForward();
		AddressDTO adddto = new AddressDTO();
		
		adddto.setUserid(userId);
		adddto.setReceivername(receivername);
		adddto.setPhone(phone);
		adddto.setAddress1(address1);
		adddto.setAddress2(address2);
		adddto.setPostnum(postnum);
		
		UpdateAddressService UpdateAddressService = new UpdateAddressServiceImpl();
		UpdateAddressService.UpdateAddress(adddto);
		
		DetailItemService detailItemService = new DetailItemServiceImpl();
		PayService payService = new PayServiceImpl();
		ProductDTO prodto = detailItemService.getProductInfo(productno);
		AddressDTO updto = UpdateAddressService.getUpdatedAdd(userId);
		req.setAttribute("prodetail", prodto);
		req.setAttribute("user", updto);
		
		forward.setRedirect(false);
		forward.setPath("/pay/updatedpay.jsp");

		return forward;
	}

}
