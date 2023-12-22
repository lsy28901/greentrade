package com.mega.login.service;

import com.mega.user.UserDTO;

public interface LoginService {
	UserDTO getUserDTO(String uid, String upass); 
}
