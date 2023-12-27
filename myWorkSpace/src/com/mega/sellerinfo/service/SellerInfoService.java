package com.mega.sellerinfo.service;

import java.util.List;

import com.mega.product.ProductDTO;
import com.mega.user.UserDTO;

public interface SellerInfoService {
	UserDTO sellerInfo(int userno);
	List<ProductDTO> getsellerItemList(int userno);
}
