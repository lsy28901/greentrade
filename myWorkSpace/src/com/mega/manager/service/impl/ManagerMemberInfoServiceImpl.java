package com.mega.manager.service.impl;

import com.mega.manager.ManagerDAO;
import com.mega.manager.ManagerDTO;
import com.mega.manager.service.ManagerMemberInfoService;

public class ManagerMemberInfoServiceImpl implements ManagerMemberInfoService {

	private ManagerDAO dao = new ManagerDAO();
	@Override
	public ManagerDTO getManagerMemberInfo(String user_id) {
		return dao.getManagerMemberInfo(user_id);
	}

}
