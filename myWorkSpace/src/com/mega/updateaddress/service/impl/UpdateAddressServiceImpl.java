package com.mega.updateaddress.service.impl;

import com.mega.updateaddress.service.UpdateAddressService;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class UpdateAddressServiceImpl implements UpdateAddressService {
	UserDAO dao = new UserDAO();
	UserDTO dto = new UserDTO();

	@Override
	public int UpdateAddress(UserDTO dto) {
		int result =0;
		result = dao.UpdateAddress(dto);
		
		return result;
	}
}
