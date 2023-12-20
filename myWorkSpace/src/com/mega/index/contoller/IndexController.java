package com.mega.index.contoller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.index.service.IndexService;
import com.mega.index.service.impl.IndexServicImpl;
import com.mega.product.ProductDTO;

public class IndexController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("index액션컨트롤러");
		
		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		IndexService indexService = new IndexServicImpl();
		
		list = indexService.getRecentAddItem();
		req.setAttribute("recentProduct", list);
		
		forward.setRedirect(false);
		forward.setPath("/main/index.jsp");
		
		return forward;
	}
	
}
