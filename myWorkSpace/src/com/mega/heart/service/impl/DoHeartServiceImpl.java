package com.mega.heart.service.impl;

import com.mega.heart.HeartDAO;
import com.mega.heart.HeartDTO;
import com.mega.heart.service.DoHeartService;

public class DoHeartServiceImpl implements DoHeartService {
	HeartDAO dao = new HeartDAO();
	
	@Override
	public HeartDTO getHeartStatus(int userno, int productno) {
		HeartDTO heartdto = dao.getHeartStatus(userno, productno);
		return heartdto;
	}
	
	@Override
	public int doHeart(HeartDTO dto) {
		int result = dao.doHeart(dto);
		return result;
	}

}
