package com.mega.join.service;

import com.mega.user.JoinDTO;
import com.mega.user.UserDTO;

public interface JoinService {
	int insertJoinDTO(JoinDTO add);
	JoinDTO dupliUserDTO(String uid);
}

