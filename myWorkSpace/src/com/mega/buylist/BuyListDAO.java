package com.mega.buylist;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mega.product.ProductDTO;

import common.DBConnPool;

public class BuyListDAO extends DBConnPool{
	public int insertBuyList(ProductDTO pdto, int userno) {
		int result = 0;
		
		String query = "insert into buylist" + 
				" values (seq_buylistno.nextval,sysdate,'no',?,?,?)";
		
		try {
			psmt=con.prepareStatement(query);
			psmt.setInt(1, pdto.getProductno());
			psmt.setInt(2, userno);
			psmt.setInt(3, pdto.getUserno());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			close();
		}
		
		
		return result;
	}
	
	public List<BuyListDTO> getBuyList(int userno){
		List<BuyListDTO> buyList = new ArrayList();
		
		String query ="SELECT *" + 
				" FROM (" + 
				" SELECT bl.buylistdate,bl.isreview,p.image,p.productno, p.title, p.price, p.paymethod,us.user_name as buyusername"
				+ " , ROWNUM AS rnum" + 
				" ,(select user_name from  user_table_real  where userno= bl.selluserno) as sellername" + 
				" FROM buylist bl" + 
				" JOIN product p ON bl.productno = p.productno" + 
				" JOIN user_table_real us ON bl.buyuserno = us.userno" + 
				" WHERE bl.buyuserno = ?" + 
				" ORDER BY bl.buylistdate DESC" + 
				")" ;
		
		try {
			psmt=con.prepareStatement(query);
			psmt.setInt(1, userno);
			rs= psmt.executeQuery();
			
			while(rs.next()) {
				BuyListDTO bdto = new BuyListDTO();
				bdto.setBuylistdate(rs.getDate("buylistdate"));
				bdto.setTitle(rs.getString("title"));
				bdto.setImage(rs.getString("image"));
				bdto.setPrice(rs.getString("price"));
				bdto.setPaymethod(rs.getString("paymethod"));
				bdto.setUser_name(rs.getString("sellername"));
				bdto.setProductno(rs.getInt("productno"));
				bdto.setIsreview(rs.getString("isreview"));
				
				buyList.add(bdto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return buyList;
	}
}
