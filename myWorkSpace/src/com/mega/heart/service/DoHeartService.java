package com.mega.heart.service;

import com.mega.heart.HeartDTO;

public interface DoHeartService {
	HeartDTO getHeartStatus(int userno, int productno);
	
	int doHeart(HeartDTO dto);
}
