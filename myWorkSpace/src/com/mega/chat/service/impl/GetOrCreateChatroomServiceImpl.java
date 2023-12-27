package com.mega.chat.service.impl;

import com.mega.chat.ChatDAO;
import com.mega.chat.service.GetOrCreateChatroomService;

public class GetOrCreateChatroomServiceImpl implements GetOrCreateChatroomService {

	ChatDAO dao = new ChatDAO();
	@Override
	public int getOrCreateChatroom(int buyer, int sellproduct) {
		return dao.getOrCreateChatroom(buyer, sellproduct);
	}

}
