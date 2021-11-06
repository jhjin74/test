<%@page import="javax.mail.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>Co & S</title>
	<!-- main js -->
	<script src="/js/comm.js"></script>
	
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- main css -->
    <link rel="stylesheet" type="text/css" href="/css/theme.css" />
    <style>
    	.side-test {
    		background: red;
    	}
    </style>
    <script>
		$(document).ready(function () {
			var user_nick = $("#user_nick").val();
			console.log(user_nick);
			userInfo("M");
			
						
		});
    </script>
</head>
<body>
	<input type="hidden" id="user_nick" value="" />
	<div class="co-n-s h-full">
		<tiles:insertAttribute name="header" />
		<!-- 바디 전체 -->
		<div class="flex-auto flex h-full">
			<!-- main content 부분 -->
			<div class="relative w-full">
				<main id="viewport-content">
					<tiles:insertAttribute name="body" />
				</main>
			</div>
			<!-- 사이드 컨텐츠 메뉴바 -->
			<tiles:insertAttribute name="side-content" />
		</div>
	</div>
</body>
</html>