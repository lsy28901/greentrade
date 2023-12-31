package com.mega.faq;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mega.report.ReportDTO;

import common.DBConnPool;



public class FaqDAO extends DBConnPool{

	public List<FaqDTO> getFaqList(int startRow, int endRow) {
	    List<FaqDTO> list = new ArrayList<>();
	    
	    // 페이징 쿼리 작성
	    String query = "SELECT * FROM (SELECT ROWNUM AS rnum, t.* FROM (SELECT * FROM faq ORDER BY faqno DESC) t) WHERE rnum BETWEEN ? AND ?";
	    
	    try {
	        psmt = con.prepareStatement(query);
	        psmt.setInt(1, startRow);
	        psmt.setInt(2, endRow);
	        
	        rs = psmt.executeQuery();
	        
	        while (rs.next()) {
	            FaqDTO dto = new FaqDTO();
	            
	            dto.setFaqno(rs.getInt("faqno"));
	            dto.setFaqtitle(rs.getString("faqtitle"));
	            dto.setFaqcontent(rs.getString("faqcontent"));
	            dto.setFaqdate(rs.getDate("faqdate"));
	            dto.setFaqcate(rs.getString("faqcate"));
	            
	            list.add(dto);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }finally {
			closeRsAndPsmt();
        }
	    
	    
	    return list;
	}

	
		public FaqDTO getFaqContent(int faqno) {
			FaqDTO content = null;
			String query="select * from FAQ where faqno=?";
			try {
				psmt = con.prepareStatement(query);
				psmt.setInt(1, faqno);
				
				rs = psmt.executeQuery();
				if(rs.next()) {
					content = new FaqDTO();
					content.setFaqno(rs.getInt("faqno"));
					content.setFaqtitle(rs.getString("faqtitle"));
					content.setFaqcontent(rs.getString("faqcontent"));
					content.setFaqdate(rs.getDate("faqdate"));
					content.setFaqcate(rs.getString("faqcate"));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			close();
			
			return content;
		}
		
		public void saveFaq(FaqDTO dto) {
		    String query = "insert into faq values("+
		    		"faq_sequence.NEXTVAL,?,?,sysdate,?)";
		    
		    try {
		        psmt = con.prepareStatement(query);
		        psmt.setString(1, dto.getFaqtitle());
		        psmt.setString(2, dto.getFaqcontent());
		        psmt.setString(3, dto.getFaqcate());
		        psmt.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    close();

		}
		
		public int getTotalRowCount() {
		    int totalRowCount = 0;

		    String query = "SELECT COUNT(*) FROM faq";

		    try {
		        psmt = con.prepareStatement(query);
		        rs = psmt.executeQuery();

		        if (rs.next()) {
		            totalRowCount = rs.getInt(1);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    
		    close();

		    return totalRowCount;
		}
		
	}



