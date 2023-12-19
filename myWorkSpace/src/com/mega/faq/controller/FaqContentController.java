package com.mega.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.faq.FaqDTO;
import com.mega.faq.service.FaqContentService;
import com.mega.faq.service.impl.FaqContentServiceImpl;

@WebServlet("/faqContent.do")
public class FaqContentController extends HttpServlet {
    
    private FaqContentService faqContentService;
    
    @Override
    public void init() throws ServletException {
        // 서블릿 초기화 시 FaqContentService를 생성합니다.
        faqContentService = new FaqContentServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 요청에서 FAQ 번호를 가져옵니다.
        int faqno = Integer.parseInt(request.getParameter("faqno"));

        // FAQ 번호를 사용하여 FAQ 컨텐츠를 가져옵니다.
        FaqDTO faqContent = faqContentService.getFaqContent(faqno);

        // FAQ 내용을 표시할 JSP 페이지로 포워딩합니다.
        request.setAttribute("faqContent", faqContent);
        request.getRequestDispatcher("/chatting/FAQ_content.jsp").forward(request, response);
    }
}

