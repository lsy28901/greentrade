<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
    <h1>WebSocket Chat</h1>
    <div id="chat-window" style="border: 1px solid #ccc; width: 300px; height: 300px; padding: 10px; overflow-y: scroll;"></div>
    <input type="text" id="message" placeholder="Type a message...">
    <button id="send-button">Send</button>
<%@ include file="../footer.jsp"%>
    <script>
		const socket = new WebSocket("ws://localhost:8000/myWorkSpace/ChatingServer");
		const userNo = <%= request.getParameter("UserNo") %>;
		
		socket.onopen = function (event) {
		    // 웹 소켓 연결이 열릴 때 처리
		    appendMessage("Connected to the server");
		};
		
		socket.onmessage = function (event) {
		    // 수신된 웹 소켓 메시지 처리
		    const message = event.data;
		    appendMessage("Received: " + message);
		};
		
		socket.onclose = function (event) {
		    // 웹 소켓 연결이 닫힐 때 처리
		    appendMessage("Connection closed");
		};
		
		// 메시지 보내기
		function sendMessage() {
		    const messageInput = document.getElementById("message");
		    const message = messageInput.value;
		    if (message.trim() !== "") { // 빈 메시지는 보내지 않음
		        socket.send(message);
		        appendMessage("나: " + message);
		        messageInput.value = ""; // 메시지 입력 필드 지우기
		    }
		}
		
		// 화면에 메시지 추가
		function appendMessage(message) {
		    const chatWindow = document.getElementById("chat-window");
		    const messageElement = document.createElement("p");
		    messageElement.textContent = message;
		    chatWindow.appendChild(messageElement);
		}
		
		// Send 버튼 클릭 시 sendMessage 함수 호출
		const sendButton = document.getElementById("send-button");
		sendButton.addEventListener("click", sendMessage);
		
		// Enter 키 누를 때 sendMessage 함수 호출
		const messageInput = document.getElementById("message");
		messageInput.addEventListener("keydown", function (event) {
		    if (event.key === "Enter") {
		        sendMessage();
		    }
		});
	</script>


