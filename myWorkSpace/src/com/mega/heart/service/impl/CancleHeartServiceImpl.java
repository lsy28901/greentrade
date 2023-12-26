package com.mega.heart.service.impl;

import com.mega.heart.HeartDAO;
import com.mega.heart.HeartDTO;
import com.mega.heart.service.CancleHeartService;

public class CancleHeartServiceImpl implements CancleHeartService {
	HeartDAO dao = new HeartDAO();

	@Override
	public int CancleHeart(HeartDTO dto) {
		int result = dao.CancleHeart(dto);
		return result;
	}
	
	
}
