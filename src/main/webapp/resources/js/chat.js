// 보내는 사람
var mainSender = "";	// 본인
var toSender = "";		// 다른 사용자 

window.onload = function() {
	openSocket();	// 페이지 이동시 오픈소켓 로드
	// $("#output_message").hide();
}

// DB에 ChatLog 넣기위한 함수
function input_message() {
	// DB insert 값 저장
	var paramData = {
		userNick: $("#chat_user").val(),
		content: document.getElementById("messageinput").value
	};

	$.ajax({
		url: "/insertChatLog.json",
		dataType: "json",
		contentType: "application/json;charset=utf-8;",
		type: "post",
		data: JSON.stringify(paramData),
		success: function(result) {
			/*console.log(result);
			console.log("성공!");
			console.log(paramData);*/
		},
		error: function(status, request, error) {
			console.log(status);
			console.log(request);
			console.log(error);
			// 로그인이 돼있지 않으면 Error 출력.
			alert("로그인 후 이용해주세요.");
		}
	});
};

// DB ChatLog 화면에 출력하기 위한 함수
function output_message() {
	// params 받기 위한 임의 데이터
	var paramData = {
		data: "success"
	}
	$.ajax({
		url: "/selectChatLog.json",
		dataType: "json",
		contentType: "application/json;charset=utf-8;",
		type: "post",
		data: JSON.stringify(paramData),
		success: function(result) {
			/*console.log(result);
			console.log(result.result.length);*/

			// DB에서 채팅로그를 가져와서 화면에 출력
			for (var i = 0; i < result.result.length; i++) {
				$("#output_message").append('<div style="width: auto; padding: 3px; color: aqua;">' + result.result[i].USER_NICKNAME + '</div>');			// DB 닉네임
				$("#output_message").append('<div style="color:white; margin-bottom: 10px;">' + "&nbsp;&nbsp;" + result.result[i].CHAT_MESSAGE + '</div>'); // DB 메세지
			}
			$("#output_message").scrollTop($("#output_message").prop('scrollHeight'));
		},
		error: function(request, status, error) {
			console.log(request);
			console.log(status);
			console.log(error);
		}
	})
}

// 숨겨져있는 채팅창 보여주기 (OnClick)
function show_chat() {
	$("#output_message").show();
}

/* 실시간 채팅을 위한 웹 소켓 시작 */
var ws;
var messages = document.getElementById("output_messages");

// 소켓 Open
function openSocket() {
	// 웹소켓 접속시 DB ChatLog 화면에 출력
	output_message();

	//웹소켓 객체 만드는 코드
	ws = new WebSocket("ws://localhost:8080/");

	// 입장
	ws.onopen = function(event) {
		if (event.data === undefined) {
			return;
		}
		// 대화방 입장 이벤트 send
		ws.send(event.data);
		// 대화방 입장 이벤트 로그 확인
		/*console.log(event.data);*/
	};
	// 메세지
	ws.onmessage = function(event) {
		/*console.log(event.data);*/
		// event.data[sender, message]를 나눠서 저장
		// sender
		var senderData = event.data.substring(9, event.data.indexOf("&nbsp;"));
		// messages
		var messagesData = event.data.substring(event.data.indexOf("&nbsp;"));

		/*		// 보낸사람 값 확인
				console.log("senderData = " + senderData);
				// 메세지 값 확인
				console.log("messagesData = " + messagesData);*/

		// 메인 센더 = input type:text id: user 값 (text에 담겨져있는 NICKNAME)
		mainSender = document.getElementById("chat_user").value;
		// 투 센더 = 받아 온 sender 값
		toSender = senderData;
		// 본인이 보낸것과, 남이 보낸것 구분 & 대화방입장 멘트
		// 본인 닉네임과, 받은 닉네임이 같고 | 메세지에 "대화방"이 포함되어 있다면 본인 닉네임과, 메세지 출력.
		if (mainSender == toSender && messagesData.indexOf("대화방") == -1) {
			$("#output_message").append('<div style="width: auto; padding: 3px; color: aqua;">' + mainSender + '<b style="color: pink;"> ☚ </b></div>');
			$("#output_message").append('<div style="color:white;">' + messagesData + '</div>');
			// 본인 닉네임과, 받은 닉네임이 다르고 | 메세지에 "대화방"이 포함되어 있다면 받은 닉네임과, 메세지 출력.
		} else if (mainSender != toSender && messagesData.indexOf("대화방") == -1) {
			$("#output_message").append('<div style="width: auto; padding: 3px; color: aqua;">' + toSender + '</div>');
			$("#output_message").append('<div style="color:white;">' + messagesData + '</div>');
			// 메세지에 "대화방"단어가 포함되있다면 아래처럼 출력.
		} else if (messagesData.indexOf("대화방") != -1) {
			console.log("대화방 입장 메세지");
			$("#output_message").append('<div style="color:pink; font-weight: bold; margin-bottom: 30px;">' + event.data + '</div>');
		}

		var scrT = $("#output_message").scrollTop();
		console.log("스크롤 위치 값 = " + Math.floor(scrT));	// 스크롤 위치 값 
		var windowT = $("#output_message").innerHeight();
		console.log("div 창크기 = " + Math.floor(windowT));			// div 창크기
		var scrH = $("#output_message").prop('scrollHeight');
		console.log("스크롤 전체 값 = " + scrH); 				// 스크롤 전체 값
		console.log("-----------------------");

		// 스크롤 이 끝에 도달했을때 실행되는 이벤트 (style바뀌면 수동적으로 수정.)
		// 스크롤 전체값이 div창크기 + 스크롤 위치 값보다 작거나 같으면 스크롤을 제일 아래로 내림.
		if (scrH <= Math.floor(scrT) + windowT + 100 || scrH <= Math.floor(scrT) + windowT + 101) {
			$("#output_message").scrollTop($("#output_message").prop('scrollHeight'));
			// 스크롤 전체값이 div창크기 + 스크롤 위치 값보다 크면 스크롤을 가만히 나둠.
		} else if (scrH > Math.floor(scrT) + windowT + 100) {
			console.log("nothing");
		}
	};

	// 나가기
	ws.onclose = function(event) {
		console.log("대화 종료");
	}
}

// 메세지 보내기
function send() {
	// 메세지 텍스트 박스 오브젝트 취득
	var message = document.getElementById("messageinput").value + "," + document.getElementById("chat_user").value;
	// text창에 아무것도 입력이 안돼있으면 보내지않음.
	if (document.getElementById("messageinput").value == "") {
		// console.log("null");
		alter("채팅창이 비어있습니다.");
		// text창에 입력되어있으면, message를 보냄
	} else {
		// 웹소켓(ws)으로 보냄
		ws.send(message);
		// message 값 초기화
		message = "";
		// 메세지 보내고 난 후 text 비우기
		document.getElementById("messageinput").value = "";
	}
	// 메세지박스에 행동이 일어난 후 텍스트박스 포커스.
	document.getElementById("messageinput").focus();
}
// Enter 키로 메세지 보내기2
function send_Enter() {
	if (event.keyCode == 13) {
		// Enter로 채팅 보낼때 DB에 저장
		input_message();
		send();
	}
}
// 소켓 Close
function closeSocket() {
	ws.close();
}
/* // div추가 양식
function writeResponse(text){
	messages.innerHTML += '<div style="color:white">' + text + '</div>';

}
/* // 파라미터 값 불러옴(확인용)
function getParameterByName(name) {
	console.log(name)

	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search);
	return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
} */