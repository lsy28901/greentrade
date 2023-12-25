package com.mega.manager.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.manager.service.ManagerProductDeleteService;
import com.mega.manager.service.impl.ManagerProductDeleteServiceImpl;


public class ManagerProductDeleteController implements Action {
	private ManagerProductDeleteService ManagerProductDeleteService;

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
    	
    	int productno = Integer.parseInt(request.getParameter("productno"));
    	
    	ManagerProductDeleteService = new ManagerProductDeleteServiceImpl();

    	ManagerProductDeleteService.managerProductDelete(productno);
    	
        return null;
    }
    
 
}
