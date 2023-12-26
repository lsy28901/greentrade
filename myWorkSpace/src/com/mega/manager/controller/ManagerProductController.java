package com.mega.manager.controller;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;

import com.mega.manager.service.ManagerProductService;
import com.mega.manager.service.impl.ManagerProductServiceImpl;
import com.mega.product.ProductDTO;


public class ManagerProductController implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("managerProduct액션컨트롤러");
		
		int pageNo = request.getParameter("pageNo") != null ? Integer.parseInt(request.getParameter("pageNo")) : 1;
        int pageSize = 12; // 페이지당 게시물 수
        
        // 시작과 끝 행 번호 계산
        int startRow = (pageNo - 1) * pageSize + 1;
        int endRow = pageNo * pageSize;
        
		// 페이지 경로 설정 함수 호출
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		ManagerProductService managerProductService = new ManagerProductServiceImpl();
		list = managerProductService.getAllProducts(startRow,endRow);
		int totalRows = managerProductService.getTotalRowCount();
		
		request.setAttribute("allProduct", list);
		request.setAttribute("totalRows", totalRows);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/manager/manager_product.jsp");
		
		return forward;
	}

}
