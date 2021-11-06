<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

/* 세션 및 로컬스토리지 확인 */
function userInfo(type) {
	
	var user_nick = "";
	
	/* login.jsp에서 userInfo 실행할 때 */
	if(type == "P"){
		user_nick = $("#user_nick").val();
		/* mainLayout.jsp에서 실행할 때 */
	} else {
		user_nick = localStorage.getItem("user_nick");
	}
	
	/* span 태그에 값 넣기 */
	$("#span-username").text(user_nick);
	/* 메시지 input id에 값 넣기 */
	$("#chat_user").val(user_nick);
	console.log(user_nick);
	
	if ( user_nick == null || user_nick == "null" ) {
		console.log("true : " + $("#span-username").text() + "입니다");
		showLoginJoin();	
	} else {
		console.log("false : " + $("#span-username").text() + "입니다");
		console.log("로그인 되었습니다.");
		showUserbox();
	}
};	

function btnLogout() {
	<%
		session.removeAttribute("user_nick");
	%>
	localStorage.clear();
	location.reload();
	if ( user_nick == null || user_nick == "null") {
		console.log("session이 삭제되었습니다.");
		console.log(user_nick);
		showLoginJoin();
	} else {
		console.log(<% session.getId(); %>);	
	}
};

function showPopupLogin() {
   var width = "450"; // 가로 길이
   var height = "350"; // 세로 길이
   
   // 팝업 가운데 위치 값
   var left_center = Math.ceil(( window.screen.width - width ) / 2);
    var top_center = Math.ceil(( window.screen.height - height ) / 2); 
   window.open("/login.ds", "로그인", "width="+ width +", height="+ height +", left=" + left_center + ", top="+ top_center);   
};

function showPopupJoin() {
   var width = "450"; // 가로 길이
   var height = "450"; // 세로 길이
   
   // 팝업 가운데 위치 값
   var left_center = Math.ceil(( window.screen.width - width ) / 2);
   var top_center = Math.ceil(( window.screen.height - height ) / 2); 
   window.open("/join.ds", "회원가입", "width="+ width +", height="+ height +", left=" + left_center + ", top="+ top_center);    
};

function showUserbox() {
	$("#login-join-view").hide();
	$("#userbox").show();
}

function showLoginJoin() {
	$("#userbox").hide();
	$("#login-join-view").show();
	console.log("<%= session.getId() %>");	
}

</script>
<div class="background_color">
	<header class="header">
	   <!-- 헤더 왼쪽 -->
	   <div class="header-left">
	      <div class="logo-container">
	         <!-- 로고 이미지 -->
	         <a href="/" class="logo-img"> <img src="/images/logo-img.png"
	            height="50" alt="CO & S" />
	         </a>
	         <!-- 사이트 이름 이미지 -->
	         <a href="/" class="logo-title"> <img
	            src="/images/logo-title.png" height="40" alt="CO & S" />
	         </a>
	      </div>
	      <!-- 메뉴 -->
	      <nav class="navi">
			<a class="navi-menu" href="/exchange/upbit" style="color: black;">시세 / 정보</a>
			<a class="navi-menu" href="/blog" style="color: black;">블로그</a>
	      </nav>
	   </div>
	   <!-- 헤더 오른쪽 -->
	   <div class="header-right w-full">
	      <!-- 로그인 및 회원가입 버튼 -->
	      <div id="login-join" class="login-join h-full flex">
	       <div id="login-join-view" class="login-join-view">
	          <!-- 로그인 버튼 -->
	          <button class="login-btn">
	             <a href="javascript:showPopupLogin()" class="login-popup" style="color: black;">로그인</a>
	          </button>
	          <!-- 회원가입 버튼 -->
	          <button class="join-btn">
	             <a href="javascript:showPopupJoin()" class="join-popup" style="color: black">회원가입</a>
	          </button>
	       </div>
	      </div>
	      <!-- 프로필 사진 및 닉네임 -->
	      <div id="userbox" class="userbox">
	         <div id="userbox-view" class="userbox-view h-full flex">
	            <!-- 프로필 사진 -->
	            <div class="profile-picture">
	               <img src="/images/login-img.jpg" class="img-circle"
	                  alt="profile-img" />
	            </div>
	            <!-- 닉네임 -->
	            <div class="profile-info">
	               <span class="name" id="span-username"></span>
	            </div>
	            <!-- 로그아웃 -->
	            <div class="user-logout" >
					<button id="btn-logout" type="button" onclick="btnLogout();">로그아웃</button>
	            </div>
	         </div>
	      </div>   
	   </div>
	</header>
</div>