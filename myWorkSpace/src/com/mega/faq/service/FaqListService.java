package com.mega.faq.service;

import java.util.List;

import com.mega.faq.FaqDTO;

public interface FaqListService {

	List<FaqDTO> getFaqList(int startRow, int endRow);
	public int getTotalRowCount();
	
}