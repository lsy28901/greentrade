package com.mega.log.service;

import java.util.List;

import com.mega.log.LogDTO;
import com.mega.product.ProductDTO;

public interface SellLogService {
	List<LogDTO> getSellLogList(int userno);
	void deleteSellItem(int productno,int userno) ;
}
