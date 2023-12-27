package com.mega.report.service.impl;

import java.util.List;

import com.mega.report.ReportDAO;
import com.mega.report.ReportDTO;
import com.mega.report.service.ReportListByTargetUserNoService;

public class ReportListByTargetUserNoServiceImpl implements ReportListByTargetUserNoService {
	
	ReportDAO dao = new ReportDAO();
	@Override
	public List<ReportDTO> getReportListByTargetUserNo(int userno, int startRow, int endRow) {
		return dao.getReportListByTargetUserNo(userno, startRow, endRow);
	}
	@Override
	public int getTotalRowCount(int userno) {
		// TODO Auto-generated method stub
		return dao.getTotalRowCount(userno);
	}

}
