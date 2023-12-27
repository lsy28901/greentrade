package com.mega.search.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.product.ProductDTO;
import com.mega.search.service.SearchService;
import com.mega.search.service.impl.SearchServiceImpl;

public class SearchController implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("search 컨트롤러");
		
		int pageNo = request.getParameter("pageNo") != null ? Integer.parseInt(request.getParameter("pageNo")) : 1;
        int pageSize = 12; // 페이지당 게시물 수
        String title = request.getParameter("keyword");
        
        System.out.println(title);
        // 시작과 끝 행 번호 계산
        int startRow = (pageNo - 1) * pageSize + 1;
        int endRow = pageNo * pageSize;
        
		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		SearchService searchService = new SearchServiceImpl();
		
		list = searchService.getProductsByTitle(title, startRow, endRow);
		int totalRows = searchService.getTotalRowCount(title);
		
		request.setAttribute("search", list);
		request.setAttribute("totalRows", totalRows);
		
		forward.setRedirect(false);
		forward.setPath("/search_result.jsp");
		
		return forward;
	}

}
