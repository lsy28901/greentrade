package com.mega.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.review.ReviewDTO;
import com.mega.review.service.ReviewService;
import com.mega.review.service.impl.ReviewServiceImpl;
import com.mega.sellerinfo.service.SellerInfoService;
import com.mega.sellerinfo.service.impl.SellerInfoServiceImpl;
import com.mega.user.UserDTO;

public class GetSellerReviewController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("getsellerReview 컨트롤러");
		ActionForward forward = new ActionForward();
		ReviewService reviewService = new ReviewServiceImpl();
		
		int userno2 = Integer.parseInt(req.getParameter("userno"));
		UserDTO dto = new UserDTO();
		String userno = req.getParameter("userno");
		
		List<ReviewDTO> sellerreviewList = reviewService.getSellerReview(userno);
		SellerInfoService sellerInfoService = new SellerInfoServiceImpl();
		dto = sellerInfoService.sellerInfo(userno2);
		
		req.setAttribute("sellerreviewList", sellerreviewList);
		req.setAttribute("seller", dto);
		
		forward.setRedirect(false);
		forward.setPath("/mypage/sellInfoReview.jsp");
		
		return forward;
	}

}
