package com.mega.heart.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.heart.HeartDTO;
import com.mega.heart.service.DoHeartService;
import com.mega.heart.service.impl.DoHeartServiceImpl;

public class DoHeartController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("DoHeartController 호출");
		
		int productno = Integer.parseInt(req.getParameter("productno"));
		int userno = Integer.parseInt(req.getParameter("userno"));
		int likestat = Integer.parseInt(req.getParameter("likestat"));
		
		System.out.println(productno);
		System.out.println(userno);
		
		HeartDTO hdto = new HeartDTO();
		hdto.setProductno(productno);
		hdto.setUserno(userno);
		hdto.setLikestat(likestat);
		
		ActionForward forward = new ActionForward();
		DoHeartService HeartService = new DoHeartServiceImpl();
		HeartService.doHeart(hdto);
		forward.setRedirect(false);
		forward.setPath("/detailItem/detailitem.jsp");
		return forward;
	}

}
