package com.mega.additem.service.impl;

import com.mega.additem.service.AddItemService;
import com.mega.product.ProductDAO;
import com.mega.product.ProductDTO;

public class AddItemServiceImpl implements AddItemService{
	ProductDAO productDAO = new ProductDAO();
	@Override
	public int inserItem(ProductDTO dto ) {
		// TODO Auto-generated method stub
		int result = productDAO.insertItem(dto);
		return result;
	}

}
