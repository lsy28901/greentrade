package com.mega.search.service.impl;


import java.util.List;

import com.mega.product.ProductDAO;
import com.mega.product.ProductDTO;
import com.mega.search.service.SearchService;

public class SearchServiceImpl implements SearchService {

	ProductDAO dao = new ProductDAO();
	@Override
	public List<ProductDTO> getProductsByTitle(String title, int startRow, int endRow) {
		return dao.getProductsByTitle(title, startRow, endRow);
	}

	@Override
    public int getTotalRowCount(String title) {
        return dao.getTotalRowCount(title);
    }

}
