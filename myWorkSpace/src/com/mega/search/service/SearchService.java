package com.mega.search.service;


import java.util.List;

import com.mega.product.ProductDTO;

public interface SearchService {
	public List<ProductDTO> getProductsByTitle(String title, int startRow, int endRow);
	public int getTotalRowCount(String title);
}
