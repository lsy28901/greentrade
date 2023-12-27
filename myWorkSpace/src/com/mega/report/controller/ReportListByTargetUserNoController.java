package com.mega.report.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.report.ReportDTO;
import com.mega.report.service.ReportListByTargetUserNoService;
import com.mega.report.service.impl.ReportListByTargetUserNoServiceImpl;
import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;

public class ReportListByTargetUserNoController implements Action {

    private ReportListByTargetUserNoService reportListByTargetUserNoService;

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        // 서블릿 초기화 시 ReportListService를 생성합니다.
    	reportListByTargetUserNoService = new ReportListByTargetUserNoServiceImpl();
        
        int pageNo = request.getParameter("pageNo") != null ? Integer.parseInt(request.getParameter("pageNo")) : 1;
        int pageSize = 10; // 페이지당 게시물 수
        
        // 시작과 끝 행 번호 계산
        int startRow = (pageNo - 1) * pageSize + 1;
        int endRow = pageNo * pageSize;
        
        int userno = Integer.parseInt(request.getParameter("userno"));
        
        // Report 목록을 가져와서 request에 저장합니다.
        List<ReportDTO> reportList = reportListByTargetUserNoService.getReportListByTargetUserNo(userno, startRow, endRow);
        int totalRows = reportListByTargetUserNoService.getTotalRowCount(userno);
        
        request.setAttribute("reportList", reportList);
        request.setAttribute("totalRows", totalRows);
        
        
        // Report 목록을 표시할 JSP 페이지로 포워딩합니다.
        ActionForward forward = new ActionForward();
        forward.setRedirect(false); // 리다이렉트 여부 (false로 설정)
        forward.setPath("/manager/manager_reportList.jsp"); // JSP 페이지 경로

        return forward;
    }
}
