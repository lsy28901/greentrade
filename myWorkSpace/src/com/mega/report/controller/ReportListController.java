package com.mega.report.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mega.report.ReportDTO;
import com.mega.report.service.ReportListService;
import com.mega.report.service.impl.ReportListServiceImpl;


@WebServlet("/reportList.do")
public class ReportListController extends HttpServlet {
    
    private ReportListService reportListService;
    
    @Override
    public void init() throws ServletException {
        // 서블릿 초기화 시 FaqListService를 생성합니다.
        reportListService = new ReportListServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // FAQ 목록을 가져와서 request에 저장합니다.
        List<ReportDTO> reportList = reportListService.getReportList();
        request.setAttribute("reportList", reportList);
        
        // FAQ 목록을 표시할 JSP 페이지로 포워딩합니다.
        request.getRequestDispatcher("/manager/manager_reportList.jsp").forward(request, response);
    }
}
