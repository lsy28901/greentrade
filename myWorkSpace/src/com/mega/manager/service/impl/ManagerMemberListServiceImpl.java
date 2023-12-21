package com.mega.manager.service.impl;

import java.util.List;

import com.mega.manager.ManagerDAO;
import com.mega.manager.ManagerDTO;
import com.mega.manager.service.ManagerMemberListService;

public class ManagerMemberListServiceImpl implements ManagerMemberListService {

	ManagerDAO dao = new ManagerDAO();
	@Override
	public List<ManagerDTO> getManagerMemberList() {
		return dao.getManagerMemberList();
	}

} 
