package com.mega.faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.faq.FaqDTO;
import com.mega.faq.service.FaqListService;
import com.mega.faq.service.impl.FaqListServiceImpl;
import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;

public class FaqListController implements Action {

    private FaqListService faqListService;

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
    	
    	faqListService = new FaqListServiceImpl();
    	
        // FAQ 목록을 가져와서 request에 저장합니다.
        List<FaqDTO> faqList = faqListService.getFaqList();

        // FAQ 목록을 표시할 JSP 페이지로 포워딩합니다.
        request.setAttribute("faqList", faqList);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false); // 리다이렉트 여부 (false로 설정)
        forward.setPath("/chatting/FAQ_list.jsp"); // JSP 페이지 경로

        return forward;
    }
}


