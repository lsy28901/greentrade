package com.mega.updateaddress.service;

import com.mega.address.AddressDTO;

public interface UpdateAddressService {
	public int UpdateAddress(AddressDTO dto);
	AddressDTO getUpdatedAdd(String userId);
}
