package com.mega.heart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.heart.HeartDTO;
import com.mega.heart.service.CancleHeartService;
import com.mega.heart.service.impl.CancleHeartServiceImpl;

public class CancleHeartController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("CancleHeartController 호출");
		
		int productno = Integer.parseInt(req.getParameter("productno"));
		int userno = Integer.parseInt(req.getParameter("userno"));
		int likestat = Integer.parseInt(req.getParameter("likestat"));
		
		System.out.println(userno);
		System.out.println(productno);
		
		HeartDTO hdto = new HeartDTO();
		hdto.setProductno(productno);
		hdto.setUserno(userno);
		hdto.setLikestat(likestat);
		
		ActionForward forward = new ActionForward();
		CancleHeartService CancleHeartService = new CancleHeartServiceImpl();
		CancleHeartService.CancleHeart(hdto);
		forward.setRedirect(false);
		forward.setPath("/detailItem/detailitem.jsp");
		return forward;
	}

}
