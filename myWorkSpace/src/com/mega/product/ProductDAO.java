package com.mega.product;

import java.sql.SQLException;

import common.DBConnPool;

public class ProductDAO extends DBConnPool{
	
	
	public int insertItem(ProductDTO dto) {
		int result = 0;
		String query = "insert into product" + 
				" values(seq_productno.nextval,?,?,?,?,?,?,?,'판매중',sysdate," + 
				"null,0, ?,?,?)" ;
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getPrice());
			psmt.setInt(3, dto.getLikenum());
			psmt.setString(4, dto.getProductStatus());
			psmt.setString(5, dto.getProductDetail());
			psmt.setString(6, dto.getPaymethod());
			psmt.setString(7, dto.getTrademethod());
			psmt.setInt(8, dto.getUserno());
			psmt.setString(9, dto.getImage());
			psmt.setString(10, dto.getTradelocation());
			result = psmt.executeUpdate();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
}
