package com.mega;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


import common.DBConnPool;


@ServerEndpoint("/ChatingServer")
public class ChatServer extends DBConnPool{

    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    
    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        System.out.println("웹 소켓 연결: " + session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        System.out.println("메시지 전송: " + session.getId() + ": " + message);
        int sender = 42;
        addChatMessage(message,sender);
        synchronized (clients) {
            for (Session client : clients) {
                if (!client.equals(session)) {
                    client.getBasicRemote().sendText(message);
                }
            }
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
            psmt.setString(1,message);
            psmt.setInt(2, sender);
            
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    // buyerId와 sellerId로 chatroom의 외래 키 값을 가져오는 메서드
    private int getOrCreateChatroom(int senderId, int receiverId) {
        try {
            // 이미 생성된 채팅방이 있는지 확인
            String sql = "SELECT chatroom FROM chatroom WHERE (buyer = 42 AND seller = 51) OR (buyer = 51 AND seller = 42)";
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, senderId);
            psmt.setInt(2, receiverId);
            psmt.setInt(3, receiverId);
            psmt.setInt(4, senderId);
            rs = psmt.executeQuery();

            if (rs.next()) {
                // 이미 생성된 채팅방이 있으면 해당 채팅방 ID를 반환
                return rs.getInt("chatroom");
            } else {
                // 새로운 채팅방을 생성하고 ID를 반환
                sql = "INSERT INTO chatroom (chatroom,buyer, seller) VALUES (chat_room_seq.NEXTVAL,42, 51)";
                psmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                psmt.setInt(1, senderId);
                psmt.setInt(2, receiverId);
                psmt.executeUpdate();

                // 생성된 채팅방의 ID를 가져옴
                rs = psmt.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }


}

