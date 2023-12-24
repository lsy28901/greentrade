package com.mega.like.service.impl;

import java.util.List;

import com.mega.like.LikeDAO;
import com.mega.like.LikeDTO;
import com.mega.like.service.LikeService;

public class LikeServiceImpl implements LikeService{
	LikeDAO dao = new LikeDAO();
	@Override
	public List<LikeDTO> getLikeList(int userno) {
		List<LikeDTO> likeList = dao.getLikeList(userno);
		return likeList;
	}

}
