package com.mega.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mega.addfrm.controller.AddFrmController;
import com.mega.additem.controller.AddItemController;
import com.mega.buylist.controller.BuyListController;
import com.mega.buylist.controller.InsertBuyListsController;
import com.mega.chat.controller.GetOrCreateChatroomController;
import com.mega.detailitem.controller.DetailItemController;
import com.mega.faq.controller.FaqContentController;
import com.mega.faq.controller.FaqListController;
import com.mega.faq.controller.FaqSaveController;
import com.mega.heart.controller.CancleHeartController;
import com.mega.heart.controller.DoHeartController;
import com.mega.index.contoller.IndexController;
import com.mega.join.controller.JoinController;
import com.mega.like.controller.LikeController;
import com.mega.log.controller.BuyLogController;
import com.mega.log.controller.DeleteLogsController;
import com.mega.log.controller.DeleteSellItemController;
import com.mega.log.controller.PaySuccessController;
import com.mega.log.controller.SellLogController;
import com.mega.login.controller.LoginController;
import com.mega.manager.controller.ManagerMemberDeleteController;
import com.mega.manager.controller.ManagerMemberInfoController;
import com.mega.manager.controller.ManagerMemberListController;
import com.mega.manager.controller.ManagerProductController;
import com.mega.manager.controller.ManagerProductDeleteController;
import com.mega.mypage.controller.MyPageController;
import com.mega.mypage.controller.MyPageEditController;
import com.mega.pay.controller.PayController;
import com.mega.productlist.controller.ProductBestController;
import com.mega.productlist.controller.ProductListController;
import com.mega.productlist.controller.ProductShareController;
import com.mega.report.controller.ReportContentController;
import com.mega.report.controller.ReportFormController;
import com.mega.report.controller.ReportListController;
import com.mega.review.controller.GetReviewListController;
import com.mega.review.controller.InsertReviewController;
import com.mega.search.controller.SearchController;
import com.mega.selllist.controller.InsertSellListController;
import com.mega.selllist.controller.SellListController;
import com.mega.updateaddress.controller.UpdateAddressController;

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
		req.setCharacterEncoding("utf-8");
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
		else if (requestURI.equals("/myWorkSpace/managerProduct.do")) {
	    	forward = new ManagerProductController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/managerProductDelete.do")) {
	    	forward = new ManagerProductDeleteController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/detaiIitem.do")) {
	    	forward = new DetailItemController().execute(req, resp);
		}
		else if (requestURI.equals("/myWorkSpace/login.do")) {
	    	forward = new LoginController().execute(req, resp);
        }

		else if (requestURI.equals("/myWorkSpace/mypageEdit.do")) {
			forward = new MyPageEditController().execute(req, resp);
		}

		else if (requestURI.equals("/myWorkSpace/join.do")) {
	    	forward = new JoinController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/mypageSelllog.do")) {
	    	forward = new SellLogController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/delleteSellItem.do")) {
	    	forward = new DeleteSellItemController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/getLikeList.do")) {
	    	forward = new LikeController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/mypageBuylog.do")) {
	    	forward = new BuyLogController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/deleteLogs.do")) {
	    	forward = new DeleteLogsController().execute(req, resp);
        }
		
		else if (requestURI.equals("/myWorkSpace/insertbuyList.do")) {
	    	forward = new InsertBuyListsController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/insertSellList.do")) {
	    	forward = new InsertSellListController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/getBuyList.do")) {
	    	forward = new BuyListController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/getSellList.do")) {
	    	forward = new SellListController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/insertReview.do")) {
	    	forward = new InsertReviewController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/getReviewList.do")) {
	    	forward = new GetReviewListController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/doheart.do")) {
	    	forward = new DoHeartController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/cancleheart.do")) {
	    	forward = new CancleHeartController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/paySuccess.do")) {
	    	forward = new PaySuccessController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/search.do")) {
	    	forward = new SearchController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/productList.do")) {
	    	forward = new ProductListController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/productShare.do")) {
	    	forward = new ProductShareController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/productBest.do")) {
	    	forward = new ProductBestController().execute(req, resp);
        }else if (requestURI.equals("/myWorkSpace/chat.do")) {
	    	forward = new GetOrCreateChatroomController().execute(req, resp);
        }
		else if (requestURI.equals("/myWorkSpace/pay.do")) {
	    	forward = new PayController().execute(req,resp);
        }
		else if (requestURI.equals("/myWorkSpace/AddFrm.do")) {
	    	forward = new AddFrmController().execute(req,resp);
        }
		else if (requestURI.equals("/myWorkSpace/updateAddress.do")) {
	    	forward = new UpdateAddressController().execute(req,resp);
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
