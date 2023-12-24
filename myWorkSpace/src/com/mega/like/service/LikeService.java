package com.mega.like.service;

import java.util.List;

import com.mega.like.LikeDTO;

public interface LikeService {
	List<LikeDTO> getLikeList(int userno);
}
