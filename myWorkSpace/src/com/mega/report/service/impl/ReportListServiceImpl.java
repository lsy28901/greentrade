package com.mega.report.service.impl;

import java.util.List;

import com.mega.report.ReportDAO;
import com.mega.report.ReportDTO;
import com.mega.report.service.ReportListService;

public class ReportListServiceImpl implements ReportListService {

	ReportDAO reportdao = new ReportDAO();
	
	@Override
	public List<ReportDTO> getReportList(int startRow, int endRow) {
		return reportdao.getReportList(startRow,endRow);
	}
	
	@Override
    public int getTotalRowCount() {
        return reportdao.getTotalRowCount();
    }
}
