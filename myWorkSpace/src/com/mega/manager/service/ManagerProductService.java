package com.mega.manager.service;

import java.util.List;

import com.mega.product.ProductDTO;

public interface ManagerProductService {
	List<ProductDTO> getAllProducts(int startRow, int endRow);
	public int getTotalRowCount();
}
