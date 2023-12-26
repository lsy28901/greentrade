package com.mega.report;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;

public class ReportDAO extends DBConnPool{
	public ReportDTO getReportContent(int reportid) {
		ReportDTO content = null;
		String query = "SELECT r.*, u1.nickname AS reporter_nickname, u2.nickname AS target_nickname " +
	               "FROM report r " +
	               "JOIN user_table_real u1 ON r.reporterid = u1.userno " +
	               "JOIN user_table_real u2 ON r.targetid = u2.userno " +
	               "WHERE r.reportid = ?"; 
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, reportid);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				content = new ReportDTO();
				content.setReportid(rs.getInt("reportid"));
		        content.setReporterid(rs.getInt("reporterid"));
		        content.setReporterNickname(rs.getString("reporter_nickname"));
		        content.setTargetid(rs.getInt("targetid"));
		        content.setTargetNickname(rs.getString("target_nickname"));
		        content.setReportdate(rs.getDate("reportdate"));
		        content.setReportimgurl(rs.getString("reportimgurl")); 
		        content.setReportcontent(rs.getString("reportcontent"));
		        content.setReporttitle(rs.getString("reporttitle"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return content;
	}

	public List<ReportDTO> getReportList(int startRow, int endRow) {
		List<ReportDTO> list = new ArrayList<>();
		
		String query = "SELECT * FROM (SELECT ROWNUM AS rnum, rr.* FROM ( " +
	               "SELECT r.*, u1.nickname AS reporter_nickname, u2.nickname AS target_nickname " +
	               "FROM report r " +
	               "JOIN user_table_real u1 ON r.reporterid = u1.userno " +
	               "JOIN user_table_real u2 ON r.targetid = u2.userno " +
	               "ORDER BY r.reportid DESC" + 
	               ") rr) WHERE rnum BETWEEN ? AND ?";


		try {
		    psmt = con.prepareStatement(query);
		    psmt.setInt(1, startRow);
	        psmt.setInt(2, endRow);
		    
		    rs = psmt.executeQuery();
	
		    while (rs.next()) {
		        ReportDTO dto = new ReportDTO();
	
		        dto.setReportid(rs.getInt("reportid"));
		        dto.setReporterid(rs.getInt("reporterid"));
		        dto.setReporterNickname(rs.getString("reporter_nickname"));
		        dto.setTargetid(rs.getInt("targetid"));
		        dto.setTargetNickname(rs.getString("target_nickname"));
		        dto.setReportdate(rs.getDate("reportdate"));
		        dto.setReportimgurl(rs.getString("reportimgurl")); 
		        dto.setReportcontent(rs.getString("reportcontent"));
		        dto.setReporttitle(rs.getString("reporttitle"));
	
		        list.add(dto);
		    }
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
			closeRsAndPsmt();
        }
		
		return list;
	}
	
	public void saveReport(ReportDTO dto,int reporterid) {
	    String query = "INSERT INTO report (reportid, reporterid, targetid, reportdate, reportimgurl, reportcontent, reporttitle) " +
	                   "VALUES (report_seq.NEXTVAL, ?, (SELECT userno FROM user_table_real WHERE nickname = ?),sysdate, ?, ?, ?)";
	    
	    try {
	        psmt = con.prepareStatement(query);
	        psmt.setInt(1, reporterid);
	        psmt.setString(2, dto.getTargetNickname());
	        psmt.setString(3, dto.getReportimgurl());
	        psmt.setString(4, dto.getReportcontent());
	        psmt.setString(5, dto.getReporttitle());
	        psmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }finally {
	    	close();
	    }
	}
	
	public int getTotalRowCount() {
	    int totalRowCount = 0;

	    String query = "SELECT COUNT(*) FROM report";

	    try {
	        psmt = con.prepareStatement(query);
	        rs = psmt.executeQuery();

	        if (rs.next()) {
	            totalRowCount = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }

	    return totalRowCount;
	}

}
