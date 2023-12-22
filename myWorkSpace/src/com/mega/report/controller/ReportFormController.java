package com.mega.report.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; // HttpSession 추가

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.report.ReportDTO;
import com.mega.report.service.ReportFormService;
import com.mega.report.service.impl.ReportFormServiceImpl;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReportFormController implements Action {

    private ReportFormService reportFormService = new ReportFormServiceImpl();

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 기존 코드에서 필요한 부분을 가져옵니다.
        String uploadPath = request.getServletContext().getRealPath("/uploads");
        int maxFileSize = 10 * 1024 * 1024; // 업로드 파일의 최대 크기를 10MB로 설정
        String encoding = "UTF-8"; // 인코딩 방식을 UTF-8로 설정

        MultipartRequest multi = null;
        try {
            multi = new MultipartRequest(
                    request,
                    uploadPath,
                    maxFileSize, // 첨부파일 최대 용량 설정(bite) / 10KB / 용량 초과 시 예외 발생
                    encoding, // 인코딩 방식 지정
                    new DefaultFileRenamePolicy() // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)
            );
        } catch (IOException e) {
            e.printStackTrace();
        }

        // 폼에서 입력된 정보를 가져와서 ReportDTO 객체에 저장
        String reportTitle = multi.getParameter("reportTitle");
        String targetNickname = multi.getParameter("targetNickname");
        String reportImgUrl = multi.getFilesystemName("reportImgUrl");
        String reportContent = multi.getParameter("reportContent");
        if (reportContent.length() > 960) {
            reportContent = reportContent.substring(0, 960);
        }

        // 세션에서 userno를 가져옵니다.
        HttpSession session = request.getSession();
        int reporterid = (int) session.getAttribute("UserNo");

        // ReportDTO 객체 생성 및 정보 설정
        ReportDTO reportDTO = new ReportDTO();
        reportDTO.setReporttitle(reportTitle);
        reportDTO.setTargetNickname(targetNickname);
        reportDTO.setReportimgurl(reportImgUrl);
        reportDTO.setReportcontent(reportContent);

        // 서비스를 통해 신고 저장 (세션에서 가져온 reporterid를 사용)
        reportFormService.saveReport(reportDTO, reporterid);
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("faqList.do"); 

        return forward;
    }
}


