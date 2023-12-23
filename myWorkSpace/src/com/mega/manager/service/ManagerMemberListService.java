package com.mega.manager.service;

import java.util.List;

import com.mega.manager.ManagerDTO;


public interface ManagerMemberListService {
	List<ManagerDTO> getManagerMemberList(int startRow,int endRow);
	public int getTotalRowCount();
}
