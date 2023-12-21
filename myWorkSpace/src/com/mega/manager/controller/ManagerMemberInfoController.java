package com.mega.manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.manager.ManagerDTO;
import com.mega.manager.service.ManagerMemberInfoService;
import com.mega.manager.service.impl.ManagerMemberInfoServiceImpl;
 
public class ManagerMemberInfoController implements Action {

    private ManagerMemberInfoService ManagerMemberInfoService;

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
    	
    	String user_id = request.getParameter("user_id");
    	
    	ManagerMemberInfoService = new ManagerMemberInfoServiceImpl();
    	
        // FAQ 목록을 가져와서 request에 저장합니다.
       ManagerDTO managerMemberInfo = ManagerMemberInfoService.getManagerMemberInfo(user_id);

        // FAQ 목록을 표시할 JSP 페이지로 포워딩합니다.
        request.setAttribute("managerMemberInfo", managerMemberInfo);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false); // 리다이렉트 여부 (false로 설정)
        forward.setPath("/manager/manager_memberInfo.jsp"); // JSP 페이지 경로

        return forward;
    }
    
 
}
