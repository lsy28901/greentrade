package com.mega.mypage.service.impl;

import com.mega.mypage.MyPageDAO;
import com.mega.mypage.MyPageDTO;
import com.mega.mypage.service.MyPageService;

public class MyPageServiceImpl implements MyPageService{
	MyPageDAO dao = new MyPageDAO();
	@Override
	public MyPageDTO getMyPageInfo() {
		MyPageDTO mydto = dao.getMyPageInfo();
		return mydto;
	}

}
