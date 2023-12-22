package com.mega.faq;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mega.report.ReportDTO;

import common.DBConnPool;



public class FaqDAO extends DBConnPool{

	public List<FaqDTO> getFaqList(){
			
			List<FaqDTO> list = new ArrayList<>();
			
			String query = "select * from faq";
			
			
			try {
				psmt = con.prepareStatement(query);
			
				rs = psmt.executeQuery();
				
				
				
				while(rs.next()) {
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
				close();
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
			}finally {
				close();
			}
			
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
		    }finally {
		    	close();
		    }
		}
	}

