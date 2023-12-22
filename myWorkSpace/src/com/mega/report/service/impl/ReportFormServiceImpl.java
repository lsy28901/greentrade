package com.mega.report.service.impl;

import com.mega.report.ReportDAO;
import com.mega.report.ReportDTO;
import com.mega.report.service.ReportFormService;

public class ReportFormServiceImpl implements ReportFormService {

	ReportDAO reportdao = new ReportDAO();
	@Override
	public void saveReport(ReportDTO reportDTO, int reporterid) {
	    reportdao.saveReport(reportDTO, reporterid);
	}


}
