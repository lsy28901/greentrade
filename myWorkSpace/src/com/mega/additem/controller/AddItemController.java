package com.mega.additem.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.mega.additem.service.AddItemService;
import com.mega.additem.service.impl.AddItemServiceImpl;
import com.mega.frontcontroller.Action;
import com.mega.frontcontroller.ActionForward;
import com.mega.product.ProductDTO;
import com.mega.user.UserDAO;
import com.mega.user.UserDTO;

public class AddItemController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("additem액션컨트롤러");
		//테스트
		// 페이지 경로 설정 함수 호출
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("UserId");
		// DB 접근 객체 DAO , 저장- 전송 객체 호출 DTO
		UserDAO dao = new UserDAO();
		UserDTO udto = dao.getUserDTO(uid);
		
		ProductDTO pdto = handleFileUpload(req);
		pdto.setUserno(udto.getUserno());
		
		AddItemService AddItemService = new AddItemServiceImpl();

		pdto.setLikenum(0); // 찜 수
		
		AddItemService.inserItem(pdto);

		forward.setRedirect(true);
		forward.setPath("/myWorkSpace/index.do");

		return forward;
	}

	private ProductDTO handleFileUpload(HttpServletRequest request) {
		// 새로운 ProductDTO 객체를 생성합니다.
		ProductDTO dto = new ProductDTO();

		try {
			// 파일 아이템을 생성할 파일 아이템 팩토리를 설정합니다.
			DiskFileItemFactory factory = new DiskFileItemFactory();

			// 업로드를 처리할 서블릿 파일 업로드 객체를 생성합니다.
			ServletFileUpload upload = new ServletFileUpload(factory);

			// HTTP 요청에서 파일 아이템들을 파싱합니다.
			List<FileItem> items = upload.parseRequest(request);

			// 파싱된 각 파일 아이템에 대해 루프를 돕니다.
			for (FileItem item : items) {
				if (item.isFormField()) {
					// 텍스트 데이터인 경우
					String fieldName = item.getFieldName();
					String value = item.getString("UTF-8");

					switch (fieldName) {
					case "title":
						dto.setTitle(value);
						break;
					case "price":
						dto.setPrice(value);
						break;
					case "productDetail":
						dto.setProductDetail(value);
						break;
					case "selectedType":
						dto.setProductStatus(value);
						break;
					case "selectedPayMethod":
						dto.setPaymethod(value);
						break;
					case "selectedValues":
						dto.setTrademethod(value);
						break;
					case "tradeLocation":
						dto.setTradelocation(value);
						break;
					// 나머지 필드에 대한 처리 추가
					}
				} else {
					// 파일 데이터인 경우
					if ("imageFile".equals(item.getFieldName())) {
						// 업로드된 파일의 원래 이름을 가져옵니다.
						String originalFileName = item.getName();

						// 파일 이름에서 확장자를 추출합니다.
						String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

						// 새로운 파일 이름을 생성합니다. (현재 시간 기반)
						String newFileName = System.currentTimeMillis() + fileExtension;
						
						// 실제 서버의 경로를 구합니다.
						String serverPath = request.getServletContext().getRealPath("/");

						// 업로드된 파일의 경로를 포함한 File 객체를 생성합니다.
						File uploadedFile = new File(serverPath + File.separator + "uploads", newFileName);

						// 업로드된 파일을 서버에 저장합니다.
						item.write(uploadedFile);

						// 파일 경로를 DTO에 저장합니다. 이 경로가 데이터베이스에 저장됩니다.
						dto.setImage("uploads" + File.separator + newFileName);
					}
				}
			}
		} catch (Exception e) {
			// 예외가 발생한 경우 콘솔에 에러 메시지를 출력합니다.
			e.printStackTrace();
		}

		// 업로드가 완료된 DTO 객체를 반환합니다.
		return dto;
	}

}
