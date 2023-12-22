package com.mega.login.service.impl;

import com.mega.login.service.LoginService;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class LoginServiceImpl implements LoginService{

	UserDAO userDAO = new UserDAO();
	
	@Override
	public UserDTO getUserDTO(String uid, String upass) {
		
		UserDTO dto = userDAO.getUserDTO(uid, upass);
		return dto;
	}
	
}
