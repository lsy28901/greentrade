package com.mega.log.service.impl;

import java.util.List;

import com.mega.log.LogDAO;
import com.mega.log.LogDTO;
import com.mega.log.service.SellLogService;
import com.mega.product.ProductDTO;

public class SellLogServiceImpl implements SellLogService{
	LogDAO dao = new LogDAO();
	@Override
	public List<LogDTO> getSellLogList(int userno) {
		List<LogDTO> selllogList = dao.getSellLogList(userno);
		return selllogList;
	}
	@Override
	public void deleteSellItem(int productno,int userno) {
		dao.deleteSellItem(productno,userno);
	}

}
