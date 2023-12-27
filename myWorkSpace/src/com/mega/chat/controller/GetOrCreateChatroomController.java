package com.mega.chat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.chat.ChatDTO;
import com.mega.chat.service.GetOrCreateChatroomService;
import com.mega.chat.service.impl.GetOrCreateChatroomServiceImpl;


public class GetOrCreateChatroomController implements Action {

    private GetOrCreateChatroomService GetOrCreateChatroomService = new GetOrCreateChatroomServiceImpl();

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        }


        HttpSession session = request.getSession();
        int buyer = (int) session.getAttribute("UserNo");
        int sellproduct = Integer.parseInt(request.getParameter("productno"));
        System.out.println("buyer :"+buyer);
        System.out.println("sellproduct :"+sellproduct);
        // ChatDTO 객체 생성 및 정보 설정
        ChatDTO ChatDTO = new ChatDTO();
        ChatDTO.setBuyer(buyer);
        ChatDTO.setSellproduct(sellproduct);

        // 서비스를 통해 신고 저장 (세션에서 가져온 reporterid를 사용)
        GetOrCreateChatroomService.getOrCreateChatroom(buyer, sellproduct);
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/myWorkSpace/chatting/chatting.jsp?UserNo="+buyer); 

        return forward;
    }
}
