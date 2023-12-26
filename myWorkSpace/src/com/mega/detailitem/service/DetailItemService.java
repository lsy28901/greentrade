package com.mega.detailitem.service;

import com.mega.product.ProductDTO;

public interface DetailItemService {
	ProductDTO getProductInfo(int productno);
	public void IncViewcount(int productno);
}
