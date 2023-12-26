package com.mega.review.controller;

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

public class InsertReviewController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		ReviewService reviewService = new ReviewServiceImpl();

		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("UserId");
		UserDAO dao = new UserDAO();
		UserDTO udto = dao.getUserDTO(uid);
		// 상품정보를 불러옵니다.
		String productnoString = req.getParameter("productno");
		int productno = Integer.parseInt(productnoString);
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = pdao.getProductinfo(productno);

		// 내 회원번호입니다.
		int myuserno = udto.getUserno();
		// 판매자 회원번호입니다. 판매자회원정보를 불러옵니다.
		int selluserno = pdto.getUserno();
		UserDAO udao = new UserDAO();
		UserDTO selluserdto = udao.getUserDTO(selluserno);

		if (req.getMethod().equals("GET")) {
			System.out.println("get리뷰폼");
			req.setAttribute("sellusername", selluserdto.getUser_name());
			req.setAttribute("trademethod", pdto.getPaymethod());
			req.setAttribute("reviewusername", udto.getUser_name());
			req.setAttribute("productno", productno);
			forward.setRedirect(false);
			forward.setPath("/mypage/mypage_reviewForm.jsp");
		} else if (req.getMethod().equals("POST")) {
			System.out.println("post리뷰폼");
			int reviewscore = Integer.parseInt(req.getParameter("reviewscore"));
			String reviewcontent = req.getParameter("reviewcontent");

			ReviewDTO rdto = new ReviewDTO();
			rdto.setReviewuserno(udto.getUserno());
			rdto.setReviewscore(reviewscore);
			rdto.setReviewcontent(reviewcontent);

			reviewService.insertReview(rdto, myuserno, selluserdto, pdto);

			forward.setRedirect(true);
			forward.setPath("/myWorkSpace/getReviewList.do");
		}

		return forward;
	}

}
