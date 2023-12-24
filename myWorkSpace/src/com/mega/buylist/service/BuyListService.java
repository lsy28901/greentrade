package com.mega.buylist.service;

import java.util.List;

import com.mega.buylist.BuyListDTO;
import com.mega.product.ProductDTO;

public interface BuyListService {
	int insertBuyList(ProductDTO pdto, int userno);
	List<BuyListDTO> getBuyList(int userno);
}
