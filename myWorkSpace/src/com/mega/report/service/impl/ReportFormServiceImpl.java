package com.mega.report.service.impl;

import com.mega.report.ReportDAO;
import com.mega.report.ReportDTO;
import com.mega.report.service.ReportFormService;

public class ReportFormServiceImpl implements ReportFormService {

	ReportDAO reportdao = new ReportDAO();
	public void saveReport(ReportDTO dto) {
		
		reportdao.saveReport(dto);
	}

}
