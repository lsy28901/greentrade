package com.mega.faq.service.impl;

import com.mega.faq.FaqDAO;
import com.mega.faq.FaqDTO;
import com.mega.faq.service.FaqSaveService;

public class FaqSaveServiceImpl implements FaqSaveService {

	FaqDAO dao = new FaqDAO();
	@Override
	public void saveFaq(FaqDTO dto) {
		dao.saveFaq(dto);
	}

}
