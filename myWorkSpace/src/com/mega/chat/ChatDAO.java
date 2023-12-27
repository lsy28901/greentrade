package com.mega.chat;

import java.sql.SQLException;
import java.sql.Statement;

import common.DBConnPool;

public class ChatDAO extends DBConnPool{
	// buyerId와 sellerId로 chatroom의 외래 키 값을 가져오는 메서드
    public int getOrCreateChatroom(int buyer, int sellproduct) {
        try {
        	
            // 이미 생성된 채팅방이 있는지 확인
            String sql = "SELECT chatroom FROM chatroom WHERE buyer = ? AND sellproduct = ?";
            psmt = con.prepareStatement(sql);
            psmt.setInt(1,buyer);
            psmt.setInt(2,sellproduct);
            rs = psmt.executeQuery();

            if (rs.next()) {
                // 이미 생성된 채팅방이 있으면 해당 채팅방 ID를 반환
                return rs.getInt("chatroom");
            } else {
                // 새로운 채팅방을 생성하고 ID를 반환
                sql = "INSERT INTO chatroom (chatroom,buyer, sellproduct) VALUES (chat_room_seq.NEXTVAL,?, ?)";
                psmt = con.prepareStatement(sql);
                psmt.setInt(1,buyer);
                psmt.setInt(2,sellproduct);
                psmt.executeUpdate();

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}
