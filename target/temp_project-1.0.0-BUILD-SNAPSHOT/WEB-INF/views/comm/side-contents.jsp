<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/js/chat.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
html, body {
	margin: 0;
	height: 100%;
	overflow: hidden;
}

.flex-auto {
	flex: 1 1 auto !important;
}

.flex {
	display: flex !important;
}

.container {
	width: 400px;
	height: 100%;
	margin: 0 auto;
}

/* side-content */
.side-content {
	width: 360px;
	background-color: white;
}

.tab-content.current {
	display: inherit;
}

.tab-content {
	display: none;
	padding: 15px;
}

/* side-content tab */
.side-tabmenu {
	width: 40px;
	background-color: aliceblue;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

.side-menu-btn {
	height: 39px;
	width: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	transition: all .2s;
	background-color: aliceblue;
	outline-color: var(- -COLOR-cta) !important;
	position: relative;
	border: none;
}

.tooltip .tooltiptext {
	visibility: hidden;
	width: 60px;
	background-color: black;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 5px 0;
	position: absolute;
	z-index: 1;
}

.tooltip:hover .tooltiptext {
	visibility: visible;
}

.tooltip .tooltip-left {
	top: 2.5px;
	right: 115%;
}

.tooltip .tooltip-left::after {
	top: 50%;
	left: 120%;
	margin-top: -5px;
	border-color: transparent transparent transparent black;
}

.img-coin {
	width: 20px;
	height: 20px;
}

/*    chat css */
#chat {
	
}

.messageinput {
	width: 340px;
	height: 50px;
	position: fiexd;
	bottom: 20px
}

.chat_button {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	margin-left: 5px;
}

.chat_messages {
	display: none;
	border: 1px solid black;
	width: 340px;
	height: 100%;
	overflow-y: scroll;
	background-color: #282828;
	padding: 10px;
}

.chatting_menu {
	
}

.chat_input-menu {
	width: 340px;
	border-left: 1px solid black;
	border-right: 1px solid black;
	border-bottom: 1px solid black;
}
</style>
<div class="container flex flex-auto">
	<div class="side-content">
		<div id="push" class="tab-content current">---- ---- --------
			---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ----
			-------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ----
			---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ----
			---- ----</div>
		<div id="message" class="tab-content">---- ---- ★------ ----
			---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ----
			-------- ---- ---- ---- ★-- ---- ---- ------★ ---- ---- ---- ----
			---- ---- -------- ---- ---- ---- ---- ---- ---- ★------ ---- ----
			---- ----</div>

		<div id="chat" class="tab-content" style="width: 100%; height: 100%;">
			<div id="chatting_menu" class="chatting_menu"
				style="width: 100%; height: 80%;">
				<!-- 메시지 출력 나오는 부분 -->
				<div id="output_message" class="chat_messages"></div>
				<!-- 채팅창 및 버튼 -->
				<div class="chat_input-menu">
					<input type="text" id="chat_user" class="user" value=""
						style="display: none;"> <input type="text"
						id="messageinput" class="messageinput"
						onkeydown="JavaScript:send_Enter();">
					<!-- <button type="button" id="input_message" class="chat_button" onclick="input_message();">
                  <i class="fas fa-paper-plane"></i>
               </button> -->
				</div>
			</div>
		</div>

	</div>
	<div id="upbit" class="tab-content">---- ★-- -------- ---- ----
		---- -★- ---- ---- -------- ---- -★- ---- ---- ---- ---- -------- ----
		---- ---- ---- ---- --★ -------- ★-- ---- ---- ---- ---- ---- --------
		---- ---- --★ ---- ---- ---- -------- ---- ---- ---- --★</div>
	<div id="bithumb" class="tab-content">
		<div class="hello">
			<p>굿굿굿굿</p>
		</div>
	</div>
	<div id="onecoin" class="tab-content">---- ★-- -------- ---- ----
		---- -★- ---- ---- -------- ---- -★- ---- ---- ---- ---- -------- ----
		---- ---- ---- ---- --★ -------- ★-- ---- ---- ---- ---- ---- --------
		---- ---- --★ ---- ---- ---- -------- ---- ---- ---- --★</div>
	<div id="setting" class="tab-content">---- ★-- -------- ---- ----
		---- -★- ---- ---- -------- ---- -★- ---- ---- ---- ---- -------- ----
		---- ---- ---- ---- --★ -------- ★-- ---- ---- ---- ---- ---- --------
		---- ---- --★ ---- ---- ---- -------- ---- ---- ---- --★</div>
</div>
<div class="side-tabmenu">
	<ul class="tabs">
		<li class="tab-link current" data-tab="push">
			<button type="button" class="side-menu-btn tooltip">
				<i class="fas fa-bell"></i> <span class="tooltiptext tooltip-left">알림</span>
			</button>
		</li>
		<li class="tab-link current" data-tab="message">
			<button type="button" class="side-menu-btn tooltip">
				<i class="fas fa-envelope"></i> <span
					class="tooltiptext tooltip-left">쪽지</span>
			</button>
		</li>
		<li class="tab-link current" data-tab="chat">
			<button type="button" class="side-menu-btn tooltip" id="chat_btn"
				onclick="show_chat()">
				<i class="fas fa-comment-dots"></i> <span
					class="tooltiptext tooltip-left">채팅</span>
			</button>
		</li>
		<li class="tab-link current" data-tab="upbit">
			<button type="button" class="side-menu-btn tooltip">
				<img class="img-coin" src="/images/upbit.png" /> <span
					class="tooltiptext tooltip-left">업비트</span>
			</button>
		</li>
		<li class="tab-link current" data-tab="bithumb">
			<button type="button" class="side-menu-btn tooltip">
				<img class="img-coin" src="/images/bithumb.png" /> <span
					class="tooltiptext tooltip-left">빗썸</span>
			</button>
		</li>
		<li class="tab-link current" data-tab="onecoin">
			<button type="button" class="side-menu-btn tooltip">
				<img class="img-coin" src="/images/onecoin.jpg" /> <span
					class="tooltiptext tooltip-left">원코인</span>
			</button>
		</li>
		<li class="tab-link current tooltip" data-tab="setting">
			<button type="button" class="side-menu-btn tooltip">
				<i class="fas fa-cog"></i> <span class="tooltiptext tooltip-left">설정</span>
			</button>
		</li>
	</ul>
</div>
<script>
    $(document).ready(function(){
        $('ul.tabs li').click(function(){
            var tab_id = $(this).attr('data-tab');

            $('ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');

            $(this).addClass('current');
            $("#"+tab_id).addClass('current');
        });
    });
</script>