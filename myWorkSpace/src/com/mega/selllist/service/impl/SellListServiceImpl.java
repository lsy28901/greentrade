package com.mega.selllist.service.impl;

import java.util.List;

import com.mega.product.ProductDTO;
import com.mega.selllist.SellListDAO;
import com.mega.selllist.SellListDTO;
import com.mega.selllist.service.SellListService;

public class SellListServiceImpl implements SellListService{
	SellListDAO dao = new SellListDAO();
	@Override
	public int insertSellList(ProductDTO pdto, int userno) {
		int result = dao.insertSellList(pdto, userno);
		return result;
	}
	@Override
	public List<SellListDTO> getSellList(int userno) {
		List<SellListDTO> sellList = dao.getSellList(userno);
		return sellList;
	}

}
