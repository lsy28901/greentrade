package com.mega.productlist.service;

import java.util.List;

import com.mega.product.ProductDTO;

public interface ProductListService {
	List<ProductDTO> getproductlistinfo();
	List<ProductDTO> getproductshareinfo();
	List<ProductDTO> getproductbestinfo();
}
