package com.mega.heart;

import java.sql.SQLException;

import common.DBConnPool;

public class HeartDAO extends DBConnPool {
	
	public HeartDTO getHeartStatus(int userno, int productno) {
		
		HeartDTO dto = new HeartDTO();
		
		String query = "select * from heart where userno = ? and productno = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1,userno);
			psmt.setInt(2,productno);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setLikestat(rs.getInt("likestat"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return dto;
	}
	
	public int doHeart(HeartDTO dto) {
		int result =0;
		
		String query = "INSERT INTO heart (likeno, likedate, likestat, userno, productno)"
					 + " SELECT like_no_seq.nextval, sysdate, 1, ?, ?"
					 + " FROM dual"
					 + " WHERE NOT EXISTS ("
					 + " SELECT 1"
					 + " FROM heart"
					 + " WHERE likestat = 1 AND userno = ? AND productno = ?)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1,dto.getUserno());
			psmt.setInt(2,dto.getProductno());
			psmt.setInt(3,dto.getUserno());
			psmt.setInt(4,dto.getProductno());
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		System.out.println("Inserte성공");
		return result;
	}
	
	public int CancleHeart(HeartDTO dto) {
		int result =0;
		
		//likestat 0이면 1 / 1이면 0 으로 바꾸는 쿼리문
		String query = "DELETE heart where productno = ? and userno = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1,dto.getProductno());
			psmt.setInt(2,dto.getUserno());
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		System.out.println("DELETE성공");
		return result;
	}
}
