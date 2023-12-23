package com.mega.mypage.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.mypage.service.MyPageService;
import com.mega.mypage.service.impl.MyPageServiceImpl;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class MyPageEditController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		MyPageService myPageService = new MyPageServiceImpl();

		if (req.getMethod().equals("GET")) {
			// GET 방식으로 전송된 경우의 로직은 그대로 유지
			HttpSession session = req.getSession();
			String uid = (String) session.getAttribute("UserId");
			UserDAO dao = new UserDAO();
			UserDTO udto = dao.getUserDTO(uid);
			req.setAttribute("udto", udto);
			forward.setRedirect(false);
			forward.setPath("/mypage/mypage_edit.jsp");
		} else if (req.getMethod().equals("POST")) {
			// POST 방식으로 전송된 경우
			HttpSession session = req.getSession();
			String uid = (String) session.getAttribute("UserId");
			UserDAO dao = new UserDAO();
			UserDTO udto = dao.getUserDTO(uid);

			try {
			    // 파일 아이템을 생성할 파일 아이템 팩토리를 설정합니다.
			    DiskFileItemFactory factory = new DiskFileItemFactory();

			    // 업로드를 처리할 서블릿 파일 업로드 객체를 생성합니다.
			    ServletFileUpload upload = new ServletFileUpload(factory);

			    // HTTP 요청에서 파일 아이템들을 파싱합니다.
			    List<FileItem> items = upload.parseRequest(req);

			    // 파싱된 각 파일 아이템에 대해 루프를 돕니다.
			    for (FileItem item : items) {
			        try {
			            if (item.isFormField()) {
			                // 텍스트 데이터인 경우
			                String fieldName = item.getFieldName();
			                String value = item.getString("UTF-8");

			                switch (fieldName) {
			                    case "email":
			                        udto.setEmail(value);
			                        System.out.println(udto.getEmail());
			                        break;
			                    case "user_call":
			                        udto.setUser_call(value);
			                        System.out.println(udto.getUser_call());
			                        break;
			                    case "address1":
			                        udto.setAddress1(value);
			                        System.out.println(udto.getAddress1());
			                        break;
			                    case "address2":
			                        udto.setAddress2(value);
			                        System.out.println(udto.getAddress2());
			                        break;
			                    // 나머지 필드에 대한 처리 추가
			                }
			            } else {
			                // 파일 데이터인 경우
			                if ("profileImage".equals(item.getFieldName())) {
			                    // 업로드된 파일의 이름을 가져옵니다.
			                    String fileName = item.getName();

			                    // 실제 서버의 경로를 구합니다.
			                    String serverPath = req.getServletContext().getRealPath("/");

			                    // 업로드된 파일의 경로를 포함한 File 객체를 생성합니다.
			                    File uploadedFile = new File(serverPath + File.separator + "uploads", fileName);

			                    // 업로드된 파일을 서버에 저장합니다.
			                    item.write(uploadedFile);

			                    // 파일 경로를 DTO에 저장합니다. 이 경로가 데이터베이스에 저장됩니다.
			                    udto.setImgurl("uploads" + File.separator + fileName);
			                }
			            }
			        } catch (Exception e) {
			            // 파일 업로드 중 예외 발생 시 출력
			            e.printStackTrace();
			        }
			    }
			} catch (Exception e) {
			    // 파일 파싱 중 예외 발생 시 출력
			    e.printStackTrace();
			}

			System.out.println(udto);

			// 데이터베이스 업데이트
			myPageService.updateMypage(udto);

			forward.setRedirect(true);
			forward.setPath("/myWorkSpace/mypageMain.do");
		}

		return forward;
	}

//	@Override
//	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
//		ActionForward forward = new ActionForward();
//		MyPageService myPageService = new MyPageServiceImpl();
//
//		if (req.getMethod().equals("GET")) {
//			System.out.println("get방식 마이페이지수정");
//			HttpSession session = req.getSession();
//			String uid = (String) session.getAttribute("UserId");
//			UserDAO dao = new UserDAO();
//			UserDTO udto = dao.getUserDTO(uid);
//
//			System.out.println(udto);
//			req.setAttribute("udto", udto);
//			forward.setRedirect(false);
//			forward.setPath("/mypage/mypage_edit.jsp");
//
//		} else if (req.getMethod().equals("POST")) {
//			System.out.println("Post방식 마이페이지수정");
//			HttpSession session = req.getSession();
//			String uid = (String) session.getAttribute("UserId");
//			UserDAO dao = new UserDAO();
//			UserDTO udto = dao.getUserDTO(uid);
//			System.out.println(udto);
//			String email = req.getParameter("email");
//			String user_call = req.getParameter("user_call");
//			String address1 = req.getParameter("address1");
//			String address2 = req.getParameter("address2");
//			System.out.println(udto);
//			udto.setEmail(email);
//			udto.setUser_call(user_call);
//			udto.setAddress1(address1);
//			udto.setAddress2(address2);
//			myPageService.updateMypage(udto);
//			forward.setRedirect(true);
//			forward.setPath("/myWorkSpace/mypageMain.do");
//		}
//
//		return forward;
//	}

}
