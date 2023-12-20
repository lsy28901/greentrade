package com.mega.mypage;

import java.sql.SQLException;

import common.DBConnPool;

public class MyPageDAO extends DBConnPool{
	public MyPageDTO getMyPageInfo(){
		MyPageDTO mydto = new MyPageDTO();
		
		String query ="select u.userno,u.imgurl,u.user_name,u.user_call,u.email,u.address1,u.address2"
				+ ",(select count(bl.buylistno) from buylist bl"
				+ " where u.userno = bl.buyuserno group by bl.buylistno) as buylistcount "
				+ ",(select count(sl.selllistno) from selllist sl"
				+ " where u.userno = sl.selluserno group by sl.selllistno) as selllistcount "
				
				+ " from user_table u left join buylist bl on u.userno= bl.buyuserno "
				+ " left join selllist sl on u.userno= sl.selluserno "
				
				+ " where u.userno = 1";
		
		
		try {
			psmt=con.prepareStatement(query);
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
		}
		
		
		return mydto;
	}
}
