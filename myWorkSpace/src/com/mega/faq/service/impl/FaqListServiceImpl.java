package com.mega.faq.service.impl;

import java.util.List;

import com.mega.faq.FaqDAO;
import com.mega.faq.FaqDTO;
import com.mega.faq.service.FaqListService;

public class FaqListServiceImpl implements FaqListService {
	FaqDAO Faqdao = new FaqDAO();
	
	@Override
	public List<FaqDTO> getFaqList() {
		return Faqdao.getFaqList();
	}

}
