package com.mega.findpassword.controller;

import java.util.Properties;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mega.findpassword.service.FindPasswordService;
import com.mega.findpassword.service.impl.FindPasswordServiceImpl;
import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;


public class FindPasswordController implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		
		 String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
	        String user = "ktko@naver.com"; // 패스워드
	        String password = "password"; 

	        // SMTP 서버 정보를 설정한다.
	        Properties props = new Properties();
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.port", 587);
	        props.put("mail.smtp.auth", "true");
	        
			/*
			 * Session mailsession = Session.getDefaultInstance(props, new
			 * javax.mail.Authenticator() { protected PasswordAuthentication
			 * getPasswordAuthentication() { return new PasswordAuthentication(user,
			 * password); } });
			 * 
			 * try { MimeMessage message = new MimeMessage(session); message.setFrom(new
			 * InternetAddress(user)); message.addRecipient(Message.RecipientType.TO, new
			 * InternetAddress("ktko@ktko.com"));
			 * 
			 * // 메일 제목 message.setSubject("KTKO SMTP TEST1111");
			 * 
			 * // 메일 내용 message.setText("KTKO Success!!");
			 * 
			 * // send the message Transport.send(message);
			 * System.out.println("Success Message Send");
			 * 
			 * } catch (MessagingException e) { e.printStackTrace(); }
			 */
		
		String userId = req.getParameter("user_id");
		String userPwd = req.getParameter("user_email");
		
		FindPasswordService findpasswordservice = new FindPasswordServiceImpl();
		
		return forward;
	}

}
