package com.mega.manager.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.manager.service.ManagerMemberDeleteService;
import com.mega.manager.service.impl.ManagerMemberDeleteServiceImpl;

public class ManagerMemberDeleteController implements Action {
	private ManagerMemberDeleteService ManagerMemberDeleteService;

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
    	int userno = Integer.parseInt(request.getParameter("userno"));
    	String user_id = request.getParameter("user_id");
    	
    	ManagerMemberDeleteService = new ManagerMemberDeleteServiceImpl();

    	ManagerMemberDeleteService.deleteMemberInfo(user_id,userno);
    	
    	ActionForward forward = new ActionForward();
        forward.setRedirect(false); // 페이지 이동 방식 (forward)
        forward.setPath("/myWorkSpace/managerMemberList.do");
        return forward;
    }
    
 
}
