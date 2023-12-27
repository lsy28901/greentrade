package com.mega.findid.service.impl;

import com.mega.findid.service.FindIdService;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class FindIdServiceImpl implements FindIdService {
	
	UserDAO userDAO = new UserDAO();
	
	@Override
	public UserDTO findUserIdDTO(String uemail, String ucall) {
		UserDTO dto = userDAO.findUserIdDTO(uemail, ucall);
		return dto;
	}

}
