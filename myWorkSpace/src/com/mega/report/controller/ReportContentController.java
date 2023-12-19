package com.mega.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mega.report.ReportDTO;
import com.mega.report.service.ReportContentService;
import com.mega.report.service.impl.ReportContentServiceImpl;



@WebServlet("/reportContent.do")
public class ReportContentController extends HttpServlet {
    
    private ReportContentService ReportContentService;
    
    @Override
    public void init() throws ServletException {
        // 서블릿 초기화 시 FaqContentService를 생성합니다.
        ReportContentService = new ReportContentServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 요청에서 report id를 가져옵니다.
        int reportid = Integer.parseInt(request.getParameter("reportid"));

        
        ReportDTO reportContent = ReportContentService.getReportContent(reportid);

        
        request.setAttribute("reportContent", reportContent);
        request.getRequestDispatcher("/manager/manager_reportContent.jsp").forward(request, response);
    }
}