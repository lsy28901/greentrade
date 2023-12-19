package com.mega.report.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.report.ReportDTO;
import com.mega.report.service.ReportFormService;
import com.mega.report.service.impl.ReportFormServiceImpl;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/reportForm.do")
public class ReportFormCotroller extends HttpServlet {

    private ReportFormService reportFormService = new ReportFormServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // report_form.jsp 페이지로 이동
        request.getRequestDispatcher("manager/report_form.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String uploadPath = "C:\\Users\\USER\\git\\GreenTrade\\myWorkSpace\\WebContent\\uploads";
        int maxFileSize = 10 * 1024 * 1024; // 업로드 파일의 최대 크기를 10MB로 설정
        String encoding = "UTF-8"; // 인코딩 방식을 UTF-8로 설정


        MultipartRequest multi = new MultipartRequest( // MultipartRequest 인스턴스 생성(cos.jar의 라이브러리)
				request, 
				uploadPath,
				maxFileSize, // 첨부파일 최대 용량 설정(bite) / 10KB / 용량 초과 시 예외 발생
				encoding, // 인코딩 방식 지정
				new DefaultFileRenamePolicy() // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)
		);



        // 폼에서 입력된 정보를 가져와서 ReportDTO 객체에 저장
        String reportTitle = multi.getParameter("reportTitle");
        String targetNickname = multi.getParameter("targetNickname");
        String reportImgUrl = multi.getFilesystemName("reportImgUrl");
        String reportContent = multi.getParameter("reportContent");
        if (reportContent.length() > 960) {
            reportContent = reportContent.substring(0, 960);
        }

        // ReportDTO 객체 생성 및 정보 설정
        ReportDTO reportDTO = new ReportDTO();
        reportDTO.setReporttitle(reportTitle);
        reportDTO.setTargetNickname(targetNickname);
        reportDTO.setReportimgurl(reportImgUrl);
        reportDTO.setReportcontent(reportContent);
        
        // 서비스를 통해 신고 저장
        reportFormService.saveReport(reportDTO);

        response.sendRedirect("faqList.do");
    }
}

