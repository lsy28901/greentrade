package com.mega.log.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.mega.log.LogDAO;
import com.mega.log.LogDTO;
import com.mega.log.service.BuyLogService;
import com.mega.product.ProductDTO;

public class BuyLogServiceImpl implements BuyLogService {
	LogDAO dao = new LogDAO();
	@Override
	public List<LogDTO> getBuyLogList(int userno) {
		List<LogDTO> buyLogList = new ArrayList<LogDTO>();
		buyLogList = dao.getBuyLogList(userno);
		return buyLogList;
	}
	@Override
	public void deleteLogs(int productno) {
		dao.deleteLogs(productno);
	}
	@Override
	public int updateLogs(ProductDTO pdto, int userno) {
		int result = dao.updateLogs(pdto, userno);
		return result;
	}

}
