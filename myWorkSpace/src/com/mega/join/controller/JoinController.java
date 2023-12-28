package com.mega.join.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.join.service.JoinService;
import com.mega.join.service.impl.JoinServiceImpl;
import com.mega.login.service.LoginService;
import com.mega.login.service.impl.LoginServiceImpl;
import com.mega.user.JoinDTO;
import com.mega.user.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class JoinController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 기존 코드에서 필요한 부분을 가져옵니다.
        String uploadPath = req.getServletContext().getRealPath("/uploads");
        int maxFileSize = 10 * 1024 * 1024; // 업로드 파일의 최대 크기를 10MB로 설정
        String encoding = "UTF-8"; // 인코딩 방식을 UTF-8로 설정

        MultipartRequest multi = null;
        try {
            multi = new MultipartRequest(
                    req,
                    uploadPath,
                    maxFileSize, // 첨부파일 최대 용량 설정(bite) / 10KB / 용량 초과 시 예외 발생
                    encoding, // 인코딩 방식 지정
                    new DefaultFileRenamePolicy() // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)
            );
        } catch (IOException e) {
            e.printStackTrace();
        }
        //multi처리
		String userName = multi.getParameter("user_name");
		String userCall = multi.getParameter("user_call");
		String userId = multi.getParameter("user_id");
		String userPwd = multi.getParameter("user_password");
		String userEmail = multi.getParameter("email");
		String userNickname = multi.getParameter("nickname");
		String userImgurl = "uploads\\" + multi.getParameter("imgurl");
		String userStaff = multi.getParameter("staff");
		String userAddress1 = multi.getParameter("address1");
		String userAddress2 = multi.getParameter("address2");
		String userPostnum = multi.getParameter("postnum");
		
		JoinService joinservice = new JoinServiceImpl();//insert부분 객체
		JoinService dupliservice= new JoinServiceImpl();//중복확인 객체
		
		
		JoinDTO dto = new JoinDTO();
		
		dto.setUser_name(userName);
		dto.setUser_call(userCall);
		dto.setUser_id(userId);
		dto.setUser_password(userPwd);
		dto.setEmail(userEmail);
		dto.setNickname(userNickname);
		dto.setImgurl(userImgurl);
		dto.setStaff(userStaff);
		dto.setAddress1(userAddress1);
		dto.setAddress2(userAddress2);
		dto.setPostnum(userPostnum);
		
		//insert전 아이디 중복 확인 부분
		JoinDTO joinDTO = dupliservice.dupliUserDTO(userId);
		//System.out.println(joinDTO.getUser_id());//DB에 저장된 id값 잘 읽어옴
		
		if(joinDTO.getUser_id() != null) {//입력한 id가 DB에 존재,//여기서 자꾸 null
			forward.setRedirect(true);
			forward.setPath("/myWorkSpace/login/join.jsp");//다시 회원가입하게 페이지 이동
		}else {
			//중복이 없으니 insert하는 부분
			//insert부분
			int result = joinservice.insertJoinDTO(dto);//잘 반영됬으면 0이 아님//insert하기위해 확인유무 변수 result
			joinservice.insertAddress(dto);
			if(result!=0){
				forward.setRedirect(true);
				forward.setPath("/myWorkSpace/main.jsp");
			}else{
				forward.setRedirect(true);
				forward.setPath("/myWorkSpace/login/join.jsp");
			}
		}
		
		
		return forward;
	}
	
}