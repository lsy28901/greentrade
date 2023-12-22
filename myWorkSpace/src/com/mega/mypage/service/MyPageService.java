package com.mega.mypage.service;

import com.mega.mypage.MyPageDTO;
import com.mega.user.UserDTO;

public interface MyPageService {
	MyPageDTO getMyPageInfo(int userno);
	void updateMypage(UserDTO dto);
}
