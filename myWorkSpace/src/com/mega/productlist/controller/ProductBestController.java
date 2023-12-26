package com.mega.productlist.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.product.ProductDTO;
import com.mega.productlist.service.ProductListService;
import com.mega.productlist.service.impl.ProductListServiceImpl;

public class ProductBestController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		System.out.println("productbest 컨트롤러");
		HttpSession session = req.getSession();
		ActionForward forward = new ActionForward();
		
		ProductListService productbestservice = new ProductListServiceImpl();
		List<ProductDTO> productbest = new ArrayList<>();
		productbest = productbestservice.getproductbestinfo();
		System.out.println(productbest);
		
		req.setAttribute("productbest", productbest);
		forward.setRedirect(false);
		forward.setPath("/login/product_best.jsp");
		
		return forward;
	}
	
}
