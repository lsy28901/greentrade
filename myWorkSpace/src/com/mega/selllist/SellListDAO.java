package com.mega.selllist;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mega.buylist.BuyListDTO;
import com.mega.product.ProductDTO;

import common.DBConnPool;

public class SellListDAO extends DBConnPool{
	public int insertSellList(ProductDTO pdto, int userno) {
		int result = 0;
		
		String query = "insert into selllist" + 
				" values (seq_buylistno.nextval,sysdate,?,?,?)";
		
		try {
			psmt=con.prepareStatement(query);
			psmt.setInt(1, pdto.getProductno());
			psmt.setInt(2, userno);
			psmt.setInt(3, pdto.getUserno());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close();
		}
		
		
		return result;
	}
	
	public List<SellListDTO> getSellList(int userno){
		List<SellListDTO> sellList = new ArrayList();
		
		String query ="SELECT *  FROM (" + 
				" SELECT sl.selllistdate,p.image,p.productno, p.title, p.price, p.paymethod,us.user_name as sellusername" + 
				", ROWNUM AS rnum " + 
				",(select user_name from  user_table_real  where userno= sl.buyuserno) as buyername " + 
				" FROM selllist sl " + 
				" JOIN product p ON sl.productno = p.productno " + 
				" JOIN user_table_real us ON sl.selluserno = us.userno " + 
				" WHERE sl.selluserno = ?" + 
				" ORDER BY sl.selllistdate DESC" + 
				" )";
		
		try {
			psmt=con.prepareStatement(query);
			psmt.setInt(1, userno);
			rs= psmt.executeQuery();
			
			while(rs.next()) {
				SellListDTO sdto = new SellListDTO();
				sdto.setSelllistdate(rs.getDate("selllistdate"));
				sdto.setTitle(rs.getString("title"));
				sdto.setImage(rs.getString("image"));
				sdto.setPrice(rs.getString("price"));
				sdto.setPaymethod(rs.getString("paymethod"));
				sdto.setUser_name(rs.getString("buyername"));
				sdto.setProductno(rs.getInt("productno"));
				
				sellList.add(sdto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return sellList;
	}
}
