package com.mega.faq.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.faq.FaqDTO;
import com.mega.faq.service.FaqSaveService;
import com.mega.faq.service.impl.FaqSaveServiceImpl;
import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;


public class FaqSaveController implements Action {

    private FaqSaveService faqSaveService = new FaqSaveServiceImpl();

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 폼에서 입력된 정보를 가져와서 FaqDTO 객체에 저장
        String faqTitle = request.getParameter("faqTitle");
        String faqContent = request.getParameter("faqContent");
        String faqCate = request.getParameter("faqCate");

        // FaqDTO 객체 생성 및 정보 설정
        FaqDTO faqDTO = new FaqDTO();
        faqDTO.setFaqtitle(faqTitle);
        faqDTO.setFaqcontent(faqContent);
        faqDTO.setFaqcate(faqCate);

        // 서비스를 통해 FAQ 저장
        faqSaveService.saveFaq(faqDTO);

        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/myWorkSpace/manager/manager_main.jsp"); 

        return forward;
    }

}
