package com.mega.log.service;

import java.util.List;

import com.mega.log.LogDTO;
import com.mega.product.ProductDTO;

public interface BuyLogService {
	List<LogDTO> getBuyLogList(int userno);
	
	void deleteLogs(int productno);
	
	int updateLogs(ProductDTO pdto, int userno);
}
