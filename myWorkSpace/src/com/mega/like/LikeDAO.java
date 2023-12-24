package com.mega.like;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;

public class LikeDAO extends DBConnPool{
	
	public List<LikeDTO> getLikeList(int userno){
		List<LikeDTO> likeList = new ArrayList<LikeDTO>();
		
		String query="SELECT l.likeno, l.likedate,"
				+ "l.userno, l.likestat, p.productno,  p.title, p.price , p.image, u.user_name, p.productstatus" + 
				" FROM  product p" + 
				" JOIN  heart l  ON p.productno = l.productno" + 
				" join user_table_real u on p.userno = u.userno" + 
				" where l.userno=?" +
				" order by l.likedate desc";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, userno);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				LikeDTO likedto = new LikeDTO();
				likedto.setLikeno(rs.getInt("likeno"));
				likedto.setLikedate(rs.getDate("likedate"));
				likedto.setLikestat(rs.getInt("likestat"));
				likedto.setUserno(rs.getInt("userno"));
				likedto.setProductno(rs.getInt("productno"));
				likedto.setTitle(rs.getString("title"));
				likedto.setPrice(rs.getString("price"));
				likedto.setImage(rs.getString("image"));
				likedto.setUser_name(rs.getString("user_name"));
				likedto.setProductstatus(rs.getString("productstatus"));
				likeList.add(likedto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return likeList;
	}
}
