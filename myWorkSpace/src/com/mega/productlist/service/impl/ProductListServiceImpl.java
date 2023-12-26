package com.mega.productlist.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.mega.product.ProductDAO;
import com.mega.product.ProductDTO;
import com.mega.productlist.service.ProductListService;

public class ProductListServiceImpl implements ProductListService{
	ProductDAO productDAO = new ProductDAO();
	
	@Override
	public List<ProductDTO> getproductlistinfo() {
		List<ProductDTO> list = productDAO.getproductlistinfo();
		return list;
	}

	@Override
	public List<ProductDTO> getproductshareinfo() {
		List<ProductDTO> list = productDAO.getproductshareinfo();
		return list;
	}

	@Override
	public List<ProductDTO> getproductbestinfo() {
		List<ProductDTO> list = productDAO.getproductbestinfo();
		return list;
	}
	
}
