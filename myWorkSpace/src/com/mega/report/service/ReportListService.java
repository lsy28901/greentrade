package com.mega.report.service;

import java.util.List;

import com.mega.report.ReportDTO;

public interface ReportListService {

	List<ReportDTO> getReportList(int startRow, int endRow);
	public int getTotalRowCount();

}
