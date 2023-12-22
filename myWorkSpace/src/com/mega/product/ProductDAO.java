package com.mega.product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public ProductDTO getProductinfo(int productno) {
		
		ProductDTO dto = new ProductDTO(); 
		
		String query = "select * from product where productno = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1,productno);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setProductno(rs.getInt("productno"));
				dto.setTitle(rs.getString("title"));
				dto.setPrice(rs.getString("price"));
				dto.setImage(rs.getString("image"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	public List<ProductDTO> getRecentAddItem(){
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String query="SELECT * FROM (" + 
				" SELECT p.productno, p.title, p.price, p.image,u.user_name,p.productstatus" + 
				" FROM product p join user_table u on p.userno = u.userno" + 
				" ORDER BY p.adddate DESC" + 
				") WHERE ROWNUM <= 6";
		
		try {
			psmt=con.prepareStatement(query);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ProductDTO pdto = new ProductDTO();
				pdto.setProductno(rs.getInt("productno"));
				pdto.setTitle(rs.getString("title"));
				pdto.setPrice(rs.getString("price"));
				pdto.setProductStatus(rs.getString("productstatus"));
				pdto.setImage(rs.getString("image"));
				pdto.setUser_name(rs.getString("user_name"));
				
				list.add(pdto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	
}
