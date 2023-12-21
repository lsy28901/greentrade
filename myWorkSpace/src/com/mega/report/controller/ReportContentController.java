package com.mega.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.report.ReportDTO;
import com.mega.report.service.ReportContentService;
import com.mega.report.service.impl.ReportContentServiceImpl;

public class ReportContentController implements Action {

    private ReportContentService reportContentService;


    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
    	reportContentService = new ReportContentServiceImpl();

        // 요청에서 report id를 가져옵니다.
        int reportid = Integer.parseInt(request.getParameter("reportid"));

        // ReportContentService를 사용하여 report id에 해당하는 데이터를 조회합니다.
        ReportDTO reportContent = reportContentService.getReportContent(reportid);

        // 조회된 데이터를 request에 저장합니다.
        request.setAttribute("reportContent", reportContent);

        // 조회된 데이터를 표시할 JSP 페이지로 포워딩합니다.
        ActionForward forward = new ActionForward();
        forward.setRedirect(false); // 리다이렉트 여부 (false로 설정)
        forward.setPath("/manager/manager_reportContent.jsp"); // JSP 페이지 경로

        return forward;
    }
}

