package com.mega.detailitem.service.impl;

import com.mega.detailitem.service.DetailItemService;
import com.mega.product.ProductDAO;
import com.mega.product.ProductDTO;

public class DetailItemServiceImpl implements DetailItemService {
	ProductDAO dao = new ProductDAO();
	
	@Override
	public ProductDTO getProductInfo(int productno) {
		ProductDTO prodetail = dao.getProductinfo(productno);
		return prodetail;
	}

	@Override
	public void IncViewcount(int productno) {
		dao.IncViewcount(productno);
	}

}
