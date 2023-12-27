package com.mega.report.service;

import java.util.List;

import com.mega.report.ReportDTO;

public interface ReportListByTargetUserNoService {
	public List<ReportDTO> getReportListByTargetUserNo(int userno, int startRow, int endRow);
	public int getTotalRowCount(int userno);
}
