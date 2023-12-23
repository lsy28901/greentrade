package com.mega.mypage;

import java.sql.SQLException;

import com.mega.user.UserDTO;

import common.DBConnPool;

public class MyPageDAO extends DBConnPool{
	
	//마이페이지 메인 정보가져오기
	public MyPageDTO getMyPageInfo(int userno){
		MyPageDTO mydto = new MyPageDTO();
		
		String query ="select u.userno,u.user_id,u.imgurl,u.user_name,u.user_call,u.email,u.address1,u.address2"
				+ ",(select count(bl.buylistno) from buylist bl"
				+ " where u.userno = bl.buyuserno group by bl.buylistno) as buylistcount "
				+ ",(select count(sl.selllistno) from selllist sl"
				+ " where u.userno = sl.selluserno group by sl.selllistno) as selllistcount "
				
				+ " from user_table_real u left join buylist bl on u.userno= bl.buyuserno "
				+ " left join selllist sl on u.userno= sl.selluserno "
				
				+ " where u.userno = ?";
		
		
		try {
			psmt=con.prepareStatement(query);
			psmt.setInt(1, userno);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				mydto.setUserno(rs.getInt("userno"));
				mydto.setImgurl(rs.getString("imgurl"));
				mydto.setUser_name(rs.getString("user_name"));
				mydto.setUser_call(rs.getString("user_call"));
				mydto.setEmail(rs.getString("email"));
				mydto.setAddress1(rs.getString("address1"));
				mydto.setAddress2(rs.getString("address2"));
				mydto.setBuylistcount(rs.getInt("buylistcount"));
				mydto.setSelllistcount(rs.getInt("selllistcount"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return mydto;
	}
	
	//마이페이지 정보수정
	public void updateMypage(UserDTO dto) {
		String query = "update user_table_real "
						+ " set email=?, user_call=?, address1=?, address2=? , imgurl=? "
						+ " where userno=?";
		
		try {
			psmt= con.prepareStatement(query);
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getUser_call());
			psmt.setString(3, dto.getAddress1());
			psmt.setString(4, dto.getAddress2());
			psmt.setString(5, dto.getImgurl());
			psmt.setInt(6, dto.getUserno());
			
			psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
	}
	
}
