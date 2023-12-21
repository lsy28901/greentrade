package com.mega.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.faq.FaqDTO;
import com.mega.faq.service.FaqContentService;
import com.mega.faq.service.impl.FaqContentServiceImpl;
import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;

public class FaqContentController implements Action {

    private FaqContentService faqContentService;

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
        // 서블릿 초기화 시 FaqContentService를 생성합니다.
        faqContentService = new FaqContentServiceImpl();

        // 요청에서 FAQ 번호를 가져옵니다.
        int faqno = Integer.parseInt(request.getParameter("faqno"));

        // FAQ 번호를 사용하여 FAQ 컨텐츠를 가져옵니다.
        FaqDTO faqContent = faqContentService.getFaqContent(faqno);

        // FAQ 내용을 표시할 JSP 페이지로 포워딩합니다.
        request.setAttribute("faqContent", faqContent);
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(false); // 리다이렉트 여부 (false로 설정)
        forward.setPath("/chatting/FAQ_content.jsp"); // JSP 페이지 경로
        
        return forward;
    }
}


