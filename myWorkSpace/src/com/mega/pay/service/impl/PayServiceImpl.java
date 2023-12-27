package com.mega.pay.service.impl;

import com.mega.pay.service.PayService;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class PayServiceImpl implements PayService {
	UserDAO dao = new UserDAO();
	
	@Override
	public UserDTO getUserAdd(int userno) {
		UserDTO userAdd = dao.getUserAdd(userno);
		return userAdd;
	}
	
}
