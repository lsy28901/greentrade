package com.mega.findpassword.service.impl;

import com.mega.findpassword.service.FindPasswordService;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class FindPasswordServiceImpl implements FindPasswordService{

	UserDAO userDAO = new UserDAO();
	@Override
	public UserDTO findpasswordDTO(String uid, String uemail) {
		UserDTO dto = userDAO.findpasswordDTO(uid, uemail);
		return dto;
	}

}
