package com.mega.sellerinfo.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.product.ProductDTO;
import com.mega.sellerinfo.service.SellerInfoService;
import com.mega.sellerinfo.service.impl.SellerInfoServiceImpl;
import com.mega.user.UserDTO;

public class SellerInfoController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("SellerInfo 액션컨트롤러");
		int userno = Integer.parseInt(req.getParameter("userno"));
		UserDTO dto = new UserDTO();
		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();
		
		SellerInfoService sellerInfoService = new SellerInfoServiceImpl();
		dto = sellerInfoService.sellerInfo(userno);
		List<ProductDTO> sellerItemList = sellerInfoService.getsellerItemList(userno);
		
		req.setAttribute("seller", dto);
		req.setAttribute("sellerItemList", sellerItemList);
		
		forward.setRedirect(false);
		forward.setPath("/sellInfo/sellInfo.jsp");
		
		return forward;
	}

}
