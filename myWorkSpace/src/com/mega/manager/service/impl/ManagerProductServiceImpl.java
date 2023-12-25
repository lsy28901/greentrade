package com.mega.manager.service.impl;

import java.util.List;

import com.mega.manager.service.ManagerProductService;
import com.mega.product.ProductDAO;
import com.mega.product.ProductDTO;

public class ManagerProductServiceImpl implements ManagerProductService {

	ProductDAO dao = new ProductDAO();
	@Override
	public List<ProductDTO> getAllProducts(int startRow,int endRow) {
		List<ProductDTO> list = dao.getAllProducts(startRow,endRow);
		return list;
	}
	
	@Override
    public int getTotalRowCount() {
        return dao.getTotalRowCount();
    }

}
