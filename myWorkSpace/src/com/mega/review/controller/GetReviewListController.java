package com.mega.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.product.ProductDAO;
import com.mega.product.ProductDTO;
import com.mega.review.ReviewDTO;
import com.mega.review.service.ReviewService;
import com.mega.review.service.impl.ReviewServiceImpl;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class GetReviewListController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("get리뷰리스트컨트롤러");
		ActionForward forward = new ActionForward();
		ReviewService reviewService = new ReviewServiceImpl();
		
		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("UserId");
		UserDAO dao = new UserDAO();
		UserDTO udto = dao.getUserDTO(uid);
		
		List<ReviewDTO> reviewList = reviewService.getReviewList(udto.getUserno());
		
		req.setAttribute("reviewList", reviewList);

		
		forward.setRedirect(false);
		forward.setPath("/mypage/mypage_reviewList.jsp");
		
		return forward;
	}

}
