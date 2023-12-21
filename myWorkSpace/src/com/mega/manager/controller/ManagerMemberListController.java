package com.mega.manager.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mega.frontcontroller.Action; 
import com.mega.frontcontroller.ActionForward;
import com.mega.manager.ManagerDTO;
import com.mega.manager.service.ManagerMemberListService;
import com.mega.manager.service.impl.ManagerMemberListServiceImpl;

public class ManagerMemberListController implements Action {

    private ManagerMemberListService ManagerMemberListService;

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
    	
    	ManagerMemberListService = new ManagerMemberListServiceImpl();
    	
        // FAQ 목록을 가져와서 request에 저장합니다.
        List<ManagerDTO> managerMemberList = ManagerMemberListService.getManagerMemberList();

        // FAQ 목록을 표시할 JSP 페이지로 포워딩합니다.
        request.setAttribute("managerMemberList", managerMemberList);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false); // 리다이렉트 여부 (false로 설정)
        forward.setPath("/manager/manager_memberList.jsp"); // JSP 페이지 경로

        return forward;
    }
}
