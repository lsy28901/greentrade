package com.mega.review.service;

import java.util.List;

import com.mega.product.ProductDTO;
import com.mega.review.ReviewDTO;
import com.mega.user.UserDTO;

public interface ReviewService {
	int insertReview(ReviewDTO rdto,int userno,UserDTO sellerdto ,ProductDTO pdto);
	List<ReviewDTO> getReviewList(int userno);
}
