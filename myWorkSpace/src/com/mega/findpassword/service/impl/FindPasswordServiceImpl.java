package com.mega.findpassword.service.impl;

import com.mega.findpassword.service.FindPasswordService;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class FindPasswordServiceImpl implements FindPasswordService{

	UserDAO userDAO = new UserDAO();
	@Override
	public UserDTO findpasswordDTO(String uid) {
		UserDTO dto = userDAO.findpasswordDTO(uid);
		return dto;
	}
	@Override
	public UserDTO updatepasswordDTO(String uid, String upass) {
		UserDTO dto = userDAO.updatepasswordDTO(uid, upass);
		return dto;
	}

}
