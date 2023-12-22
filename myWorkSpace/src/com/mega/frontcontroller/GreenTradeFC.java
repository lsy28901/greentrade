package com.mega.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.additem.controller.AddItemController;
import com.mega.detailitem.controller.DetailItemController;
import com.mega.faq.controller.FaqContentController;
import com.mega.faq.controller.FaqListController;
import com.mega.faq.controller.FaqSaveController;
import com.mega.index.contoller.IndexController;
import com.mega.manager.controller.ManagerMemberDeleteController;
import com.mega.manager.controller.ManagerMemberInfoController;
import com.mega.manager.controller.ManagerMemberListController;
import com.mega.mypage.controller.MyPageController;
import com.mega.report.controller.ReportContentController;
import com.mega.report.controller.ReportFormController;
import com.mega.report.controller.ReportListController;

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

		if (requestURI.equals("/myWorkSpace/additem.do")) {
			forward = new AddItemController().execute(req, resp);
		}
		else if (requestURI.equals("/myWorkSpace/index.do")) {
			forward = new IndexController().execute(req, resp);
		}
		else if (requestURI.equals("/myWorkSpace/mypageMain.do")) {
			forward = new MyPageController().execute(req, resp);
		}
		else if (requestURI.equals("/myWorkSpace/faqContent.do")) {
	        forward = new FaqContentController().execute(req, resp);
	    }
		else if (requestURI.equals("/myWorkSpace/faqList.do")) {
	        forward = new FaqListController().execute(req, resp);
	    }
		else if (requestURI.equals("/myWorkSpace/faqSave.do")) {
	    	forward = new FaqSaveController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/reportContent.do")) {
	        forward = new ReportContentController().execute(req, resp);
	    }
		else if (requestURI.equals("/myWorkSpace/reportList.do")) {
	        forward = new ReportListController().execute(req, resp);
	    }
		else if (requestURI.equals("/myWorkSpace/reportForm.do")) {
	    	forward = new ReportFormController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/managerMemberList.do")) {
	    	forward = new ManagerMemberListController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/managerMemberInfo.do")) {
	    	forward = new ManagerMemberInfoController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/managerMemberDelete.do")) {
	    	forward = new ManagerMemberDeleteController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/detaiIitem.do")) {
	    	forward = new DetailItemController().execute(req, resp);
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
