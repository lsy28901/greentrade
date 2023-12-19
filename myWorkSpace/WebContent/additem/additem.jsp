<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<main id="additem_main" style="width:960px;height:100%; margin:30px auto;">
	<form id="additemForm">
		<div>
			<!-- 모든 이미지 파일을 허용하는 input 태그 -->
			<input type="file" id="imageInput" style="display: none;"
				onchange="previewImage(event)"> <label for="imageInput">
				<img class="add_image" alt="add item image"
				src="../imgfolder/camera.png" id="previewImage">
			</label>
		</div>
		<div class="added_images" id="addedImagesContainer">
			<!-- 선택된 이미지를 표시할 컨테이너 -->
		</div>
		<table>
			<tr>
				<td class="add_td"><input class="additem_input" type="text"
					placeholder="상품명"></td>
			</tr>
			<tr>
				<td class="add_td"><input class="additem_input" type="text"
					placeholder="판매가격"></td>
			</tr>
			<tr>
				<td class="add_td"><textarea id="item_info"
						placeholder="&#13상품명&#13하자 여부&#13구매시기&#13사용기간&#13*제품에대한 상세정보를 작성해주세요."></textarea></td>
			</tr>
			<tr>
				<td class="add_td">상품상태</td>
			</tr>
			<tr>
				<td class="add_td">
					<button class="itemtype_btn" type="button">중고</button>
					<button class="itemtype_btn" type="button">새상품</button>
				</td>
			</tr>
			<tr>
				<td class="add_td">거래방법</td>
			</tr>
			<tr>
				<td class="add_td"><img src="../imgfolder/checkbox.png">택배거래
					<img src="../imgfolder/checkbox.png">직거래</td>
			</tr>
			<tr>
				<td class="add_td">거래희망장소</td>
			</tr>
			<tr>
				<td class="add_td"><input class="additem_input_location"
					type="text"> <img src="../imgfolder/search.png"></td>
			</tr>
			<tr>
				<td class="add_td"><button class="add_submit" type="submit">등록</button></td>
			</tr>

		</table>
	</form>
</main>
<%@ include file="../footer.jsp"%>