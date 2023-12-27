package com.mega;
import java.io.IOException;

import java.sql.SQLException;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;


import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONException;
import org.json.JSONObject;

import common.DBConnPool;


@ServerEndpoint("/ChatingServer")
public class ChatServer extends DBConnPool{

    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    
    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        System.out.println("웹 소켓 연결: " + session.getId());	
    }

//    @OnMessage
//    public void onMessage(String message, Session session) throws IOException {
//        System.out.println("메시지 전송: " + session.getId() + ": " + message);
//         
////        int sender = 42;
////        System.out.println(sender);
////      
////        addChatMessage(message,sender);
//        synchronized (clients) {
//            for (Session client : clients) {
//                if (!client.equals(session)) {
//                    client.getBasicRemote().sendText(message);
//                }
//            }
//        }
//    }
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        // JSON 형태의 데이터 파싱
        JSONObject jsonMessage;
		try {
			jsonMessage = new JSONObject(message);
			int userNo = jsonMessage.getInt("userNo");
	        String textMessage = jsonMessage.getString("message");
	        
	        String nickname = getNickname(userNo);
	     // userNo와 메시지를 처리하는 로직 추가
	        System.out.println("userNo: " + userNo);
	        System.out.println("메시지: " + textMessage);
	        addChatMessage(textMessage, userNo);
	        String responseMessage = nickname + ": " + textMessage;
	        // 클라이언트에게 응답 메시지 전송
	        synchronized (clients) {
	            for (Session client : clients) {
	                if (!client.equals(session)) {
	                    client.getBasicRemote().sendText(responseMessage);
	                }
	            }
	        }
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        

    }

    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        System.out.println("웹 소켓 종료: " + session.getId());
    }

    @OnError
    public void onError(Throwable e) {
        System.out.println("에러 발생");
        e.printStackTrace();
    }
    
  //메세지를 데이터베이스에 저장
    public void addChatMessage(String message, int sender) {
        try {
            // 나머지 필드를 설정하여 채팅 메시지를 데이터베이스에 저장합니다.
            String sql = "INSERT INTO chat (chatid,message, timestamp, chatroom,sender) "
            		+ "VALUES (chat_message_seq.NEXTVAL,?, sysdate, 1,?)";
            psmt = con.prepareStatement(sql);
            System.out.println(message);
            System.out.println(sender);
            psmt.setString(1,message);
            psmt.setInt(2, sender);
            
            psmt.executeUpdate();
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
           closeRsAndPsmt();

        }
    }
    
    private String getNickname(int userNo) {
        String nickname = null;
        try {
            // 데이터베이스에서 사용자 번호에 해당하는 닉네임 조회
            String sql = "SELECT nickname FROM user_table_real WHERE userno = ?";
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, userNo);
             rs = psmt.executeQuery();
            if (rs.next()) {
                nickname = rs.getString("nickname");
            }
            rs.close();
            psmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nickname;
    }



}
