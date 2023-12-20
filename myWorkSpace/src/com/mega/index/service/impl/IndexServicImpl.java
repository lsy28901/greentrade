package com.mega.index.service.impl;

import java.util.List;

import com.mega.index.service.IndexService;
import com.mega.product.ProductDAO;
import com.mega.product.ProductDTO;

public class IndexServicImpl implements IndexService{
	ProductDAO dao = new ProductDAO();
	@Override
	public List<ProductDTO> getRecentAddItem() {
		List<ProductDTO> list = dao.getRecentAddItem();
		return list;
	}

}
