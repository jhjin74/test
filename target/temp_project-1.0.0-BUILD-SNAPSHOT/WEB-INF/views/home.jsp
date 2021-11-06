<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Co & S</title>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <link rel="stylesheet" type="text/css" href="css/theme.css" />
    
</head>
<body>
    <div class="co-n-s">
        <header class="header">
            <!-- 헤더 왼쪽 -->
            <div class="header-left">
                <div class="logo-container">
                    <!-- 로고 이미지 -->
                    <a href="../" class="logo-img">
                        <img src="images/logo-img.png" height="50" alt="CO & S" />
                    </a>
                    <!-- 사이트 이름 이미지 -->
                    <a href="../" class="logo-title">
                        <img src="images/logo-title.png" height="40" alt="CO & S" />
                    </a>
                </div>
                <!-- 메뉴 -->
                <nav class="navi">
                	<a class="navi-menu" style="color: black;" onclick="onChange()">코인</a>
                    <a class="navi-menu" href="/" style="color: black;">거래소</a>
                    <a class="navi-menu" href="/" style="color: black;">시세 / 정보</a>
                    <a class="navi-menu" href="/" style="color: black;">코엔에스</a>
                    <a class="navi-menu" href="/" style="color: black;">공지사항</a>
                </nav>
            </div>
            <!-- 헤더 오른쪽 -->
            <div class="header-right w-full">
                <!-- 프로필 사진 및 닉네임 -->
                <div id="userbox" class="userbox h-full flex">
                    <!-- 프로필 사진 -->
                    <div class="profile-picture">
                        <img src="images/login-img.jpg" class="img-circle" alt="profile-img" />
                    </div>
                    <!-- 닉네임 -->
                    <div class="profile-info" alt="profile-name">
                        <span class="name">John Doe Junior</span>
                    </div>
                </div>
                <!-- 로그인 및 회원가입 버튼 -->
                <div class="login-join">
                    <!-- 로그인 버튼 -->
                    <button class="login-btn">
                        <a class="login-pop" style="color: black;">로그인</span>
                    </button>
                    <!-- 회원가입 버튼 -->
                    <button class="join-btn">
                        <a class="join-pop" style="color:black">회원가입</span>
                    </button>
                </div>
            </div>
        </header>
        <!-- 바디 전체 -->
        <div class="flex-auto flex h-full">
            <!-- 사이드 제외 바디 전체1 -->
            <div class="flex-auto relative">
                <!-- 사이드 제외 바디 전체2 -->
                <div class="flex-auto flex w-full">
                    <!-- main content 부분 -->
                    <div class="relative w-full">
                        <main id="viewport-content">
                            <div class="flex-auto relative">
                                <div id="main-content" class="main-contents">
                                    <main class="pt-5 px-10 self-center w-full sm:w-auto">

                                    </main>
                                </div>
                            </div>
                        </main>
                    </div>
                    <!-- side content 부분 -->
                    <div id="side-content" class="side-contest">
                        <div class="side-contents-panel">
                            <div class="flex flex-col h-full">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 사이드 컨텐츠 메뉴바 -->
            <div class="flex-none">
                <div class="side-menubar">
                    <ul class="flex-none">
                        <!-- 알림 -->
                        <li>
                            <button type="button" class="side-menu-btn tooltip">
                                <i class="fas fa-bell"></i>
                                <span class="tooltiptext tooltip-left">알림</span>
                            </button>
                        </li>
                        <!-- 쪽지 -->
                        <li>
                            <button type="button" class="side-menu-btn tooltip">
                                <i class="fas fa-envelope"></i>
                                <span class="tooltiptext tooltip-left">쪽지</span>
                            </button>
                        </li>
                        <!-- 채팅 -->
                        <li>
                            <button type="button" class="side-menu-btn tooltip">
                                <i class="fas fa-comment-dots"></i>
                                <span class="tooltiptext tooltip-left">채팅</span>
                            </button>
                        </li>
                        <!-- 업비트 -->
                        <li>
                            <button type="button" class="side-menu-btn tooltip">
                                <img class="img-coin" src="images/upbit.png"></i>
                                <span class="tooltiptext tooltip-left">업비트</span>
                            </button>
                        </li>
                        <!-- 빗썸 -->
                        <li>
                            <button type="button" class="side-menu-btn tooltip">
                                <img class="img-coin" src="images/bithumb.png"></i>
                                <span class="tooltiptext tooltip-left">빗썸</span>
                            </button>
                        </li>
                        <!-- 원코인 -->
                        <li>
                            <button type="button" class="side-menu-btn tooltip">
                                <img class="img-coin" src="images/onecoin.jpg"></i>
                                <span class="tooltiptext tooltip-left">원코인</span>
                            </button>
                        </li>
                        <!-- 설정 -->
                        <li>
                            <button type="button" class="side-menu-btn tooltip">
                                <i class="fas fa-cog"></i>
                                <span class="tooltiptext tooltip-left">설정</span>
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
	function onChange() {
		
	}
</script>
</html>
