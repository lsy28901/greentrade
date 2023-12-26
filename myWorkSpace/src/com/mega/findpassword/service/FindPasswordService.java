package com.mega.findpassword.service;

import com.mega.user.UserDTO;

public interface FindPasswordService {
	UserDTO findpasswordDTO(String uid, String uemail);
}
