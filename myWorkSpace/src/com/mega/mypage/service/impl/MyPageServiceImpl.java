package com.mega.mypage.service.impl;

import com.mega.mypage.MyPageDAO;
import com.mega.mypage.MyPageDTO;
import com.mega.mypage.service.MyPageService;
import com.mega.user.UserDTO;

public class MyPageServiceImpl implements MyPageService{
	MyPageDAO dao = new MyPageDAO();
	@Override
	public MyPageDTO getMyPageInfo(int userno) {
		MyPageDTO mydto = dao.getMyPageInfo(userno);
		return mydto;
	}
	@Override
	public void updateMypage(UserDTO dto) {
		dao.updateMypage(dto);
	}

}
