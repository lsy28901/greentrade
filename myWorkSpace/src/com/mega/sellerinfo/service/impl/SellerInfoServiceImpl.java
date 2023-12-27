package com.mega.sellerinfo.service.impl;

import java.util.List;

import com.mega.product.ProductDAO;
import com.mega.product.ProductDTO;
import com.mega.sellerinfo.service.SellerInfoService;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class SellerInfoServiceImpl implements SellerInfoService {
	UserDAO dao = new UserDAO();
	ProductDAO pdao = new ProductDAO();
	
	@Override
	public UserDTO sellerInfo(int userno) {
		
		UserDTO dto = new UserDTO();
		dto = dao.sellerInfo(userno);
		
		return dto;
	}

	@Override
	public List<ProductDTO> getsellerItemList(int userno) {
		List<ProductDTO> sellerItemlist = pdao.getsellerItemList(userno);
		return sellerItemlist;
	}
	
}
