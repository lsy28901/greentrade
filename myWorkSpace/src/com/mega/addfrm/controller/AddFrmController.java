package com.mega.addfrm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.addfrm.service.AddFrmService;
import com.mega.addfrm.service.impl.AddFrmServiceImpl;
import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.user.UserDTO;

public class AddFrmController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("AddFrmController 호출");
        int userno = Integer.parseInt(req.getParameter("userno"));
        int productno = Integer.parseInt(req.getParameter("productno"));
		
		ActionForward forward = new ActionForward();
		AddFrmService AddFrmService = new AddFrmServiceImpl();
		UserDTO udto = AddFrmService.getUserDTO(userno);
		
		req.setAttribute("user", udto);
		req.setAttribute("productno", productno);
		
		forward.setRedirect(false);
		forward.setPath("/addFrm/AddFrm.jsp");

		return forward;
	}

}
