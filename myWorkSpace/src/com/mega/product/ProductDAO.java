package com.mega.product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mega.log.LogDTO;

import common.DBConnPool;

public class ProductDAO extends DBConnPool{
	
	
	public int insertItem(ProductDTO dto) {
		int result = 0;
		String insertItemQuery = "insert into product" + 
				" values(seq_productno.nextval,?,?,?,?,?,?,?,'판매중',sysdate," + 
				"null,0, ?,?,?)" ;
		
		 String logsQuery = "insert into logs " +
		            "values(seq_tradeno.nextval,sysdate,null,'판매',?,'거래중',?,null,?)";
		
		try {
			psmt = con.prepareStatement(insertItemQuery, new String[]{"productno"});
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
			
			  if (result > 0) {
		            rs = psmt.getGeneratedKeys();
		            if (rs.next()) {
		                int productno = rs.getInt(1);

		                // Insert into logs table using the retrieved productno
		                psmt = con.prepareStatement(logsQuery);
		                psmt.setString(1, dto.getTrademethod());
		                psmt.setInt(2, productno);
		                psmt.setInt(3, dto.getUserno());
		                result = psmt.executeUpdate();
		            }
		        }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
	        close();
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
				dto.setPaymethod(rs.getString("paymethod"));
				dto.setUserno(rs.getInt("userno"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		close();
		return dto;
	}
	public List<ProductDTO> getRecentAddItem(){
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String query="SELECT * FROM (" + 
				" SELECT p.productno, p.title, p.price, p.image,u.user_name,p.productstatus,p.trademethod,p.adddate,p.paymethod" + 
				" FROM product p join user_table_real u on p.userno = u.userno" +
				" where p.sellstatus = '판매중' " +
				" ORDER BY p.adddate DESC" + 
				") WHERE ROWNUM <= 8  ";
		
		try {
			psmt=con.prepareStatement(query);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ProductDTO pdto = new ProductDTO();
				pdto.setProductno(rs.getInt("productno"));
				pdto.setTitle(rs.getString("title"));
				pdto.setPrice(rs.getString("price"));
				pdto.setProductStatus(rs.getString("productstatus"));
				pdto.setTrademethod(rs.getString("trademethod"));
				pdto.setAdddate(rs.getDate("adddate"));
				pdto.setPaymethod(rs.getString("paymethod"));
				pdto.setImage(rs.getString("image"));
				pdto.setUser_name(rs.getString("user_name"));
				
				list.add(pdto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		close();
		return list;
	}
	
	// 상품 목록 전부 가져오기(한페이지에 12개씩을 가져온다) - 김찬희
	public List<ProductDTO> getAllProducts(int startRow, int endRow) {
	    List<ProductDTO> list = new ArrayList<ProductDTO>();
	    String query = "SELECT * FROM ("
	                 + "  SELECT ROWNUM AS rnum, p.*, u.user_name"
	                 + "  FROM ("
	                 + "    SELECT productno, title, price, productstatus, image, userno, sellstatus FROM product"
	                 + "  ) p"
	                 + "  LEFT JOIN user_table_real u ON p.userno = u.userno"
	                 + "  WHERE ROWNUM <= ?"
	                 + ") WHERE rnum >= ?";
	    
	    try {
	        psmt = con.prepareStatement(query);
	        psmt.setInt(1, endRow);
	        psmt.setInt(2, startRow);
	        rs = psmt.executeQuery();
	        while (rs.next()) {
	            ProductDTO pdto = new ProductDTO();
	            pdto.setProductno(rs.getInt("productno"));
	            pdto.setTitle(rs.getString("title"));
	            pdto.setPrice(rs.getString("price"));
	            pdto.setProductStatus(rs.getString("productstatus"));
	            pdto.setImage(rs.getString("image"));
	            pdto.setUser_name(rs.getString("user_name"));
	            pdto.setSellstatus(rs.getString("sellstatus"));
	            
	            list.add(pdto);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }
	    
	    return list;
	}

	//상품 관리에서 상품을 삭제 - 김찬희
	public void managerProductDelete(int productno) {
	    String query = "DELETE FROM product WHERE productno = ?";
	    
	    try {
	        // SQL 쿼리 준비
	        psmt = con.prepareStatement(query);
	        psmt.setInt(1, productno);
	        
	        // 쿼리 실행
	        psmt.executeUpdate();
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	    	close();
	    }
	}

	//상품 목록 페이지용 페이지 세는 메서드 - 김찬희
	public int getTotalRowCount() {
	    int totalRowCount = 0;

	    String query = "SELECT COUNT(*) FROM product";

	    try {
	        psmt = con.prepareStatement(query);
	        rs = psmt.executeQuery();

	        if (rs.next()) {
	            totalRowCount = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        
	    }

	    return totalRowCount;
	}
	
	
}
