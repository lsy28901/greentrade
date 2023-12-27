package com.mega.join.service.impl;

import com.mega.join.service.JoinService;
import com.mega.user.JoinDTO;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class JoinServiceImpl implements JoinService{
	UserDAO userDAO = new UserDAO();
	@Override
	public int insertJoinDTO(JoinDTO add) {
		int result=0;
		result = userDAO.insertJoinDTO(add);
		return result;
	}
	
	@Override
	public JoinDTO dupliUserDTO(String uid) {
		JoinDTO dto = userDAO.dupliUserDTO(uid);
		return dto;
	}

	@Override
	public int insertAddress(JoinDTO add) {
		int result2 = 0;
		result2 = userDAO.insertAddress(add);
		return result2;
	}
	
}
