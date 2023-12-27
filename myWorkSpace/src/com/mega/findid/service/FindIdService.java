package com.mega.findid.service;

import com.mega.user.UserDTO;

public interface FindIdService {
	UserDTO findUserIdDTO(String uemail, String ucall);
}
