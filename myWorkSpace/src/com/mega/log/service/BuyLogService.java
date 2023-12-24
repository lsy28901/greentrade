package com.mega.log.service;

import java.util.List;

import com.mega.log.LogDTO;

public interface BuyLogService {
	List<LogDTO> getBuyLogList(int userno);
	
	void deleteLogs(int productno);
}
