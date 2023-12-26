package com.mega.review.service.impl;

import java.util.List;

import com.mega.product.ProductDTO;
import com.mega.review.ReviewDAO;
import com.mega.review.ReviewDTO;
import com.mega.review.service.ReviewService;
import com.mega.user.UserDTO;

public class ReviewServiceImpl implements ReviewService{
	ReviewDAO dao = new ReviewDAO();
	@Override
	public int insertReview(ReviewDTO rdto,int userno,UserDTO sellerdto ,ProductDTO pdto) {
		int result = 0;
		result = dao.insertReview(rdto, userno,sellerdto,pdto);
		return result;
	}
	@Override
	public List<ReviewDTO> getReviewList(int userno) {
		List<ReviewDTO> reviewList = dao.getReviewList(userno);
		return reviewList;
	}

}
