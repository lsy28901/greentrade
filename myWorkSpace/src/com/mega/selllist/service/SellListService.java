package com.mega.selllist.service;

import java.util.List;

import com.mega.product.ProductDTO;
import com.mega.selllist.SellListDTO;

public interface SellListService {
	int insertSellList(ProductDTO pdto, int userno);
	List<SellListDTO> getSellList(int userno);
}
