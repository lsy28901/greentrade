package com.mega.buylist.service.impl;

import java.util.List;

import com.mega.buylist.BuyListDAO;
import com.mega.buylist.BuyListDTO;
import com.mega.buylist.service.BuyListService;
import com.mega.product.ProductDTO;

public class BuyListServiceImpl implements BuyListService{
	BuyListDAO dao = new BuyListDAO();
	@Override
	public int insertBuyList(ProductDTO pdto, int userno) {
		int result = dao.insertBuyList(pdto, userno);
		return result;
	}
	@Override
	public List<BuyListDTO> getBuyList(int userno) {
		List<BuyListDTO> buyList = dao.getBuyList(userno);
		return buyList;
	}

}
