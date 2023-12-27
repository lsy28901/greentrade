package com.mega.addfrm.service.impl;

import com.mega.addfrm.service.AddFrmService;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class AddFrmServiceImpl implements AddFrmService {
	UserDAO dao = new UserDAO();
	
	public UserDTO getUserDTO(int userno) {
		UserDTO userdto = dao.getUserDTO(userno);
		return userdto;
	}
}	
