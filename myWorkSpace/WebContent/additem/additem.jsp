<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<main id="additem_main"
	style="width: 960px; height: 100%; margin: 30px auto;">
	<form action="/myWorkSpace/additem.do" id="additemForm" method="post"
		enctype="multipart/form-data">
		<div>
			<!-- 모든 이미지 파일을 허용하는 input 태그 -->
			<input type="file" id="imageInput" name="imageFile"
				style="display: none;" onchange="previewImage(event)"> <label
				for="imageInput"> <img class="add_image"
				alt="add item image" src="../imgfolder/camera.png" id="previewImage">
			</label>

		</div>
		<div class="added_images" id="addedImagesContainer">
			<!-- 선택된 이미지를 표시할 컨테이너 -->
		</div>
		<table>
			<tr>
				<td class="add_td"><input class="additem_input" type="text"
					id="item_name" name="title" placeholder="상품명" required="required"></td>
			</tr>
			<tr>
				<td class="add_td"><input class="additem_input" type="text"
					id="item_price" name="price" placeholder="판매가격" required="required"></td>
			</tr>
			<tr>
				<td class="add_td"><textarea id="item_info"
						name="productDetail" required="required"
						placeholder="&#13상품명&#13하자 여부&#13구매시기&#13사용기간&#13*제품에대한 상세정보를 작성해주세요."></textarea></td>
			</tr>
			<tr>
				<td class="add_td">상품상태</td>
			</tr>
			<tr>
				<td class="add_td">
					<button class="itemtype_btn" type="button"
						style="border: none; border-radius: 5px;"
						onclick="toggleItemType(this, '중고')">중고</button>
					<button class="itemtype_btn" type="button"
						style="border: none; border-radius: 5px;"
						onclick="toggleItemType(this, '새상품')">새상품</button>
				</td>
			</tr>
			<tr>
				<td class="add_td">거래방법</td>
			</tr>
			<tr>
				<td class="add_td" style="align-items: center;"><img
					style="cursor: pointer;" src="../imgfolder/checkbox.png"
					onclick="toggleCheckbox(this)">택배거래 <img
					src="../imgfolder/checkbox.png" style="cursor: pointer;"
					onclick="toggleCheckbox(this)">직거래</td>
			</tr>

			<tr id="locationRow" style="display: none;">
				<td class="add_td">거래희망장소</td>
			</tr>
			<tr id="locationInputRow" style="display: none;">
				<td class="add_td"><input class="additem_input_location"
					name="tradeLocation" type="text" value=" "> <img
					src="../imgfolder/search.png"></td>
			</tr>

			<tr>
				<td class="add_td"><button class="add_submit" type="button" onclick="submitForm()">등록</button></td>
			</tr>

		</table>
		<input type="hidden" id="selectedValues" name="selectedValues" /> <input
			type="hidden" id="selectedType" name="selectedType" />
	</form>
</main>
<script>
	function toggleCheckbox(imgElement) {
		if (imgElement.src.endsWith('checkbox.png')) {
			imgElement.src = '../imgfolder/checkedbox.png';
		} else {
			imgElement.src = '../imgfolder/checkbox.png';
		}
		if (imgElement.nextSibling.nodeValue.trim() === '직거래') {
			if (imgElement.src.endsWith('checkedbox.png')) {
				locationRow.style.display = ''; // 보이게 설정
				locationInputRow.style.display = ''; // 보이게 설정
			} else {
				locationRow.style.display = 'none'; // 숨김 설정
				locationInputRow.style.display = 'none'; // 숨김 설정
			}
		}
	}

	var selectedItemType = ""; // 선택된 상품 상태를 저장할 변수

	function toggleItemType(button, type) {
		var buttons = document.querySelectorAll('.itemtype_btn');
		buttons.forEach(function(btn) {
			btn.style.backgroundColor = ''; // 모든 버튼의 배경색 초기화
		});

		if (button.style.backgroundColor !== '#BFF6B6') {
			button.style.backgroundColor = '#BFF6B6'; // 선택된 버튼의 배경색을 초록색으로 변경
			selectedItemType = type; // 선택된 상품 상태 업데이트
		} else {
			button.style.backgroundColor = ''; // 선택 해제되면 배경색 초기화
			selectedItemType = ""; // 선택된 상품 상태 초기화
		}
	}

	function submitForm() {
		// 여기서 선택된 값을 가져와서 사용할 수 있음
		var selectedValues = document.getElementById('selectedValues');
		selectedValues.value = '';

		var checkboxes = document.querySelectorAll('img');
		checkboxes.forEach(function(checkbox) {
			if (checkbox.src.endsWith('checkedbox.png')) {
				selectedValues.value += checkbox.nextSibling.nodeValue.trim()
						+ ',';
			}
		});
		selectedValues.value = selectedValues.value.replace(/,\s*$/, '');
		var selectedType = selectedItemType;
	
		document.getElementById('selectedType').value = selectedType;

		// 폼을 서버로 제출
		document.getElementById('additemForm').submit();
	}
</script>
<%@ include file="../footer.jsp"%>