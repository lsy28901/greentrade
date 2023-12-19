package com.mega.report.service.impl;

import com.mega.report.ReportDAO;
import com.mega.report.ReportDTO;
import com.mega.report.service.ReportContentService;

public class ReportContentServiceImpl implements ReportContentService {

	private ReportDAO reportDAO = new ReportDAO();

    @Override
    public ReportDTO getReportContent(int reportid) {
        // FAQ 번호를 이용하여 FAQ 컨텐츠를 가져오도록 수정
        return reportDAO.getReportContent(reportid);
    }
}
