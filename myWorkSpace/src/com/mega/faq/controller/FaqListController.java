package com.mega.faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.faq.FaqDTO;
import com.mega.faq.service.FaqListService;
import com.mega.faq.service.impl.FaqListServiceImpl;

@WebServlet("/faqList.do")
public class FaqListController extends HttpServlet {
    
    private FaqListService faqListService;
    
    @Override
    public void init() throws ServletException {
        // 서블릿 초기화 시 FaqListService를 생성합니다.
        faqListService = new FaqListServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // FAQ 목록을 가져와서 request에 저장합니다.
        List<FaqDTO> faqList = faqListService.getFaqList();
        request.setAttribute("faqList", faqList);
        
        // FAQ 목록을 표시할 JSP 페이지로 포워딩합니다.
        request.getRequestDispatcher("/chatting/FAQ_list.jsp").forward(request, response);
    }
}

