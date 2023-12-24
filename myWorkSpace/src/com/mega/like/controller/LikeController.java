package com.mega.like.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.like.LikeDTO;
import com.mega.like.service.LikeService;
import com.mega.like.service.impl.LikeServiceImpl;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class LikeController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("찜목록 불러오기 액션컨트롤러");
		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("UserId");
		// DB 접근 객체 DAO , 저장- 전송 객체 호출 DTO
		UserDAO dao = new UserDAO();
		UserDTO udto = dao.getUserDTO(uid);
		LikeService likeService = new LikeServiceImpl();
		
		List<LikeDTO> likeList = likeService.getLikeList(udto.getUserno());
		
		req.setAttribute("likeList", likeList);
		
		forward.setRedirect(false);
		forward.setPath("/mypage/mypage_like.jsp");
		return forward;
	}

}
