<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script>
	function handleImageSelection() {
		var input = document.getElementById('imageInput');
		var previewImage = document.getElementById('previewImage');
		var addedImagesContainer = document
				.getElementById('addedImagesContainer');
		var selectedFileName = document.getElementById('selectedFileName');

		addedImagesContainer.innerHTML = '';
		selectedFileName.innerHTML = '';

		var reader = new FileReader();
		reader.onload = function(e) {
			// 선택한 이미지를 addedImagesContainer에 추가
			var selectedImage = document.createElement('img');
			selectedImage.src = e.target.result;
			selectedImage.className = 'added_image';
			addedImagesContainer.appendChild(selectedImage);

			// 선택한 파일 이름을 표시
			selectedFileName.innerHTML = '' + input.files[0].name;
		};

		reader.readAsDataURL(input.files[0]);

		// addedImagesContainer를 보이도록 설정 (만약 숨겨져 있다면)
		addedImagesContainer.style.display = 'block';
	}

	function toggleCheckbox(imgElement) {
		if (imgElement.src.endsWith('checkbox.png')) {
			imgElement.src = '../imgfolder/checkedbox.png';
		} else {
			imgElement.src = '../imgfolder/checkbox.png';
		}

		// locationRow와 locationInputRow 변수 정의
		var locationRow = document.getElementById('locationRow');
		var locationInputRow = document.getElementById('locationInputRow');

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

	var selectedPayMethod = ""; // 선택된 결제/나눔 값을 저장할 변수

// 	function togglePayMethod(button, method) {
// 		var buttons = document.querySelectorAll('.paymethod_btn');
// 		buttons.forEach(function(btn) {
// 			btn.style.backgroundColor = ''; // 모든 버튼의 배경색 초기화
// 		});

// 		if (button.style.backgroundColor !== '#BFF6B6') {
// 			button.style.backgroundColor = '#BFF6B6'; // 선택된 버튼의 배경색을 초록색으로 변경
// 			selectedPayMethod = method; // 선택된 결제/나눔 값 업데이트
// 		} else {
// 			button.style.backgroundColor = ''; // 선택 해제되면 배경색 초기화
// 			selectedPayMethod = ""; // 선택된 결제/나눔 값 초기화
// 		}
		

// 	}
	function togglePayMethod(button, method) {
	    var buttons = document.querySelectorAll('.paymethod_btn');
	    buttons.forEach(function (btn) {
	        btn.style.backgroundColor = ''; // 모든 버튼의 배경색 초기화
	    });

	    var itemPriceRow = document.getElementById('itemPriceRow');
	    var itemPriceInput = document.getElementById('item_price');

	    if (button.style.backgroundColor !== '#BFF6B6') {
	        button.style.backgroundColor = '#BFF6B6'; // 선택된 버튼의 배경색을 초록색으로 변경
	        selectedPayMethod = method; // 선택된 결제/나눔 값 업데이트

	        if (selectedPayMethod === '나눔') {
	            // 나눔이 선택되면 itemPriceRow를 숨기고 값을 0으로 설정
	            itemPriceRow.style.display = 'none';
	            itemPriceInput.value = '0';
	        } else {
	            // 결제가 선택되면 itemPriceRow를 보이게 하고 값을 초기화
	            itemPriceRow.style.display = '';
	            itemPriceInput.value = '';
	        }
	    } else {
	        button.style.backgroundColor = ''; // 선택 해제되면 배경색 초기화
	        selectedPayMethod = ""; // 선택된 결제/나눔 값 초기화
	        itemPriceRow.style.display = ''; // itemPriceRow를 보이게 설정
	        itemPriceInput.value = '';
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

		var selectedPayMethodField = document
				.getElementById('selectedPayMethod');
		selectedPayMethodField.value = selectedPayMethod;

		// 폼을 서버로 제출
		document.getElementById('additemForm').submit();
	}
	
</script>

<main id="additem_main"
	style="width: 960px; height: 100%; margin: 30px auto;">
	<form action="/myWorkSpace/additem.do" id="additemForm" method="post"
		enctype="multipart/form-data">
		<div>
			<!-- 모든 이미지 파일을 허용하는 input 태그 -->
			<input type="file" id="imageInput" name="imageFile"
				style="display: none;" onchange="handleImageSelection()"> <label
				for="imageInput">사진 선택 <img class="add_image mb-2"
				alt="add item image" src="../imgfolder/camera.png" id="previewImage">
			</label>

		</div>
		<div class="added_images" id="addedImagesContainer">
			<!-- 선택된 이미지를 표시할 컨테이너 -->
		</div>
		<div id="selectedFileName"></div>
		<!-- 선택된 파일 이름을 표시할 곳 추가 -->
		<table>
			<tr>
				<td class="add_td"><input class="additem_input" type="text"
					id="item_name" name="title" placeholder="상품명" required="required"></td>
			</tr>
			<tr>
				<td class="add_td">결제방법</td>
			</tr>
			<tr>
				<td class="add_td">
					<button class="paymethod_btn" type="button"
						style="border: none; border-radius: 5px; margin-right: 10px;"
						onclick="togglePayMethod(this, '결제')">결제</button>
					<button class="paymethod_btn" type="button"
						style="border: none; border-radius: 5px; margin-right: 10px;"
						onclick="togglePayMethod(this, '나눔')">나눔</button>
				</td>
			</tr>
			<tr id="itemPriceRow">
				<td class="add_td"><input class="additem_input" type="text"
					id="item_price" name="price" placeholder="판매가격" required="required">
				</td>
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
			
<!-- 			<tr id="locationInputRow" style="display: none;"> -->
<!-- 				<td class="add_td"><input class="additem_input_location" -->
<!-- 					name="tradeLocation" type="text" value=" "> <img -->
<!-- 					src="../imgfolder/search.png"></td> -->
<!-- 			</tr> -->
			
			 <tr id="locationInputRow" style="display: none;">
                <td class="add_td">
                <input class="additem_input_location"
                    name="tradeLocation" type="text" value=" "> <img
                    src="../imgfolder/search.png"  style="cursor: pointer;" >
                    
                </td>
                    
            </tr>
            

			<tr>
				<td class="add_td"><button class="add_submit" type="button"
						onclick="submitForm()">등록</button></td>
			</tr>

		</table>
		<input type="hidden" id="selectedValues" name="selectedValues" /> <input
			type="hidden" id="selectedType" name="selectedType" /> <input
			type="hidden" id="selectedPayMethod" name="selectedPayMethod" />
	</form>
</main>



<%@ include file="../footer.jsp"%>