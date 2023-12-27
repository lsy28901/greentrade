package com.mega.address;

import java.sql.SQLException;

import com.mega.user.UserDTO;

import common.DBConnPool;

public class AddressDAO extends DBConnPool {
	
	//배송지 수정하기
		public int UpdateAddress(AddressDTO dto) {
			int result = 0;
			
			String sql = "UPDATE address set receivername = ?, phone = ?, address1 = ?, address2 = ?, postnum = ?"
					   + " WHERE userid = ?";
			
			try {
				psmt = con.prepareStatement(sql);
				
				psmt.setString(1, dto.getReceivername());
				psmt.setString(2, dto.getPhone());
				psmt.setString(3, dto.getAddress1());
				psmt.setString(4, dto.getAddress2());
				psmt.setString(5, dto.getPostnum());
				psmt.setString(6, dto.getUserid());
				
				psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				System.out.println("배송지 업데이트");
				closeRsAndPsmt();
			}

			return result;

		}
		
		//수정된 배송지 불러오기
		public AddressDTO getUpdatedAdd(String userId) {

			AddressDTO dto = new AddressDTO();

			String sql = "select * from address where userid = ? ";

			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, userId);
				rs = psmt.executeQuery();

				if (rs.next()) {
					dto.setReceivername(rs.getString("receivername"));
					dto.setPhone(rs.getString("phone"));
					dto.setAddress1(rs.getString("address1"));
					dto.setAddress2(rs.getString("address2"));
					dto.setPostnum(rs.getString("postnum"));

				}

			} catch (SQLException e) { // TODO Auto-generated catch block
				e.printStackTrace();
			}

			close();

			return dto;

		}
}
