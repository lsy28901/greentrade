package com.mega.manager.service.impl;

import com.mega.manager.ManagerDAO;
import com.mega.manager.ManagerDTO;
import com.mega.manager.service.ManagerMemberDeleteService;

public class ManagerMemberDeleteServiceImpl implements ManagerMemberDeleteService {
	
	private ManagerDAO dao = new ManagerDAO();
	
	@Override
	public void deleteMemberInfo(String user_id,int userno) {
		dao.deleteMemberInfo(user_id,userno);
	}

}
