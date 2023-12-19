package com.mega.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.additem.controller.AddItemController;

@WebServlet("*.do")
public class GreenTradeFC extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		ActionForward forward = null;

		if (requestURI.equals("/greentrade/additem.do")) {
			forward = new AddItemController().execute(req, resp);
		}
		
		
		
		// 페이지 이동 일괄처리
		if (forward != null) {
			if (forward.isRedirect()) {
				// isRedirect = true = redirect 페이지 이동 방식
				resp.sendRedirect(forward.getPath());
			} else {
				// 아니라면 forward 페이지 이동 방식
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}

	}
}
