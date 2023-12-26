package com.mega.manager.service.impl;

import com.mega.manager.service.ManagerProductDeleteService;
import com.mega.product.ProductDAO;

public class ManagerProductDeleteServiceImpl implements ManagerProductDeleteService {

	ProductDAO dao = new ProductDAO();
	@Override
	public void managerProductDelete(int productno) {
		dao.managerProductDelete(productno);
	}

}
