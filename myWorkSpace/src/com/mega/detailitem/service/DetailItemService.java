package com.mega.detailitem.service;

import com.mega.product.ProductDTO;
import com.mega.user.UserDTO;

public interface DetailItemService {
	ProductDTO getProductInfo(int productno);
	public void IncViewcount(int productno);
	UserDTO getSellerInfo(int productno);
}
