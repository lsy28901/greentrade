package com.mega.updateaddress.service.impl;

import com.mega.address.AddressDAO;
import com.mega.address.AddressDTO;
import com.mega.updateaddress.service.UpdateAddressService;

public class UpdateAddressServiceImpl implements UpdateAddressService {
	AddressDAO dao = new AddressDAO();
	AddressDTO dto = new AddressDTO();

	@Override
	public int UpdateAddress(AddressDTO dto) {
		int result =0;
		result = dao.UpdateAddress(dto);
		
		return result;
	}

	@Override
	public AddressDTO getUpdatedAdd(String userId) {
		dto = dao.getUpdatedAdd(userId);
		return dto;
	}
}
