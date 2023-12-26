package com.mega.review;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mega.product.ProductDTO;
import com.mega.user.UserDTO;

import common.DBConnPool;

public class ReviewDAO extends DBConnPool{
	
	public int insertReview(ReviewDTO rdto,int userno,UserDTO sellerdto ,ProductDTO pdto) {
		int result = 0;
		int buyListUpdateResult= 0;
		String query = "insert into review values(seq_reviewno.nextval,?,?,sysdate,?, ?,?,?)";
		String buyListUpdateQuery = "update buylist set isreview = 'yes' where productno = ? and buyuserno = ?";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, rdto.getReviewcontent());
			psmt.setInt(2, rdto.getReviewscore());
			psmt.setInt(3, userno);
			psmt.setInt(4,rdto.getSelleruserno());
			psmt.setString(5, sellerdto.getUser_name());
			psmt.setString(6, pdto.getPaymethod());
			result = psmt.executeUpdate();
			
			if(result>0) {
				psmt = con.prepareStatement(buyListUpdateQuery);
				psmt.setInt(1, pdto.getProductno());
				psmt.setInt(2, userno);
				buyListUpdateResult = psmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return buyListUpdateResult;
	}
	
	public List<ReviewDTO> getReviewList(int userno){
		List<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		
		String query = "select * from review where reviewuserno = ?";
		
		try {
			psmt= con.prepareStatement(query);
			psmt.setInt(1, userno);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO rdto = new ReviewDTO();
				rdto.setReviewno(rs.getInt("reviewno"));
				rdto.setReviewcontent(rs.getString("reviewcontent"));
				rdto.setReviewscore(rs.getInt("reviewscore"));
				rdto.setReviewdate(rs.getDate("reviewdate"));
				rdto.setReviewuserno(rs.getInt("reviewuserno"));
				rdto.setSellername(rs.getString("sellername"));
				rdto.setPaymethod(rs.getString("paymethod"));
				reviewList.add(rdto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return reviewList;
	}

}
