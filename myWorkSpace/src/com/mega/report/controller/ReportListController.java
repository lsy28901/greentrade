package com.mega.report.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.report.ReportDTO;
import com.mega.report.service.ReportListService;
import com.mega.report.service.impl.ReportListServiceImpl;
import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;

public class ReportListController implements Action {

    private ReportListService reportListService;

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        // 서블릿 초기화 시 ReportListService를 생성합니다.
        reportListService = new ReportListServiceImpl();

        // Report 목록을 가져와서 request에 저장합니다.
        List<ReportDTO> reportList = reportListService.getReportList();
        request.setAttribute("reportList", reportList);

        // Report 목록을 표시할 JSP 페이지로 포워딩합니다.
        ActionForward forward = new ActionForward();
        forward.setRedirect(false); // 리다이렉트 여부 (false로 설정)
        forward.setPath("/manager/manager_reportList.jsp"); // JSP 페이지 경로

        return forward;
    }
}
