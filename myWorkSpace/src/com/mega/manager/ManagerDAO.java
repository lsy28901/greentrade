package com.mega.manager;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mega.manager.ManagerDTO;

import common.DBConnPool;

public class ManagerDAO extends DBConnPool{
	public List<ManagerDTO> getManagerMemberList() {
		List<ManagerDTO> list = new ArrayList<>();
		
		String query = "SELECT u.userno, u.user_name, u.user_id," + 
				"COUNT(r.targetid) AS targetid_count " + 
				"FROM user_table u " + 
				"LEFT JOIN report r ON u.userno = r.targetid " + 
				"WHERE u.staff = 'user' " +
				"GROUP BY u.userno, u.user_name, u.user_id";

		try {
		    psmt = con.prepareStatement(query);
		    rs = psmt.executeQuery();
	
		    while (rs.next()) {
		        ManagerDTO dto = new ManagerDTO();
	
		        dto.setUserno(rs.getInt("userno"));
		        dto.setUser_name(rs.getString("user_name"));
		        dto.setUser_id(rs.getString("user_id"));
		        dto.setTargetid_count(rs.getInt("targetid_count"));
		        
	
		        list.add(dto);
		    }
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
			
		}

		return list;
	}
	
	public ManagerDTO getManagerMemberInfo(String user_id) {
		ManagerDTO dto = null;
		String query="SELECT userno, user_id, user_password, email, user_call, address1, address2, imgurl " +
				"FROM user_table " +
				"WHERE user_id = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, user_id);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new ManagerDTO();
				dto.setUserno(rs.getInt("userno"));
			    dto.setUser_id(rs.getString("user_id"));
			    dto.setUser_password(rs.getString("user_password"));
			    dto.setEmail(rs.getString("email"));
			    dto.setUser_call(rs.getString("user_call"));
			    dto.setAddress1(rs.getString("address1"));
			    dto.setAddress2(rs.getString("address2"));
			    dto.setImgurl(rs.getString("imgurl"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
		return dto;
	}
	
	public void deleteMemberInfo(String user_id) {
	    String query = "DELETE FROM user_table WHERE user_id = ?";
	    
	    try {
	        // SQL 쿼리 준비
	        psmt = con.prepareStatement(query);
	        psmt.setString(1, user_id);
	        
	        // 쿼리 실행
	        psmt.executeUpdate();
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        
	    }
	}

	
}