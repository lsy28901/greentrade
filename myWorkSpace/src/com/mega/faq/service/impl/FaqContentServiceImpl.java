package com.mega.faq.service.impl;

import com.mega.faq.FaqDAO;
import com.mega.faq.FaqDTO;
import com.mega.faq.service.FaqContentService;

public class FaqContentServiceImpl implements FaqContentService {

    private FaqDAO faqDAO = new FaqDAO();

    @Override
    public FaqDTO getFaqContent(int faqno) {
        // FAQ 번호를 이용하여 FAQ 컨텐츠를 가져오도록 수정
        return faqDAO.getFaqContent(faqno);
    }
}
