<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
	.popup-login-container {
		padding: 20px;
		display: flex;
		flex-wrap: nowrap;
	}
	
	.popup-login-content {
		width: 100%;
		height: 100%;
		align-items: center;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#login-check").click(function () {
			var paramData = {
				userId: $("#userId").val(),
				userPwd: $("#userPassword").val()
			};
			
			if ( $("#userId").val() == null || $("#userId").val() == "" ) {
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			} else if ( $("#userPassword").val() == null || $("#userPassword").val() == "" ) {
				alert("비밀번호를 입력해주세요.");
				$("#userPassword").focus();
				return false;
			}
			
			$.ajax({
				url: "/login/logininfo.json",
				dataType: "json",
				contentType: "application/json;charset=utf-8;",
				type: "post",
				data: JSON.stringify(paramData),
				success: function (data) {
					console.log(data);
					console.log("data 받기 성공");
					console.log(data["user_nick"]);
					if ( data["user_nick"] != null ) {
						console.log("null이 아님 : " + data["user_nick"]);
						//opener.parent.location.reload();
						localStorage.setItem("user_nick",data["user_nick"]);
						opener.$("#user_nick").val(localStorage.getItem("user_nick"));
						opener.userInfo("P");
						window.close();
						
						/* $.ajax({
							url: "/",
							dataType: "text",
							contentType: "application/json;charset=utf-8;",
							type: "post",
							data: loginData,
							success: function (data) {
								console.log("데이터 루트로 보내기 성공");
								//window.close();
							},
							error: function (request, status, error) {
								console.log(request);
								console.log(status);
								console.log(error);
							}
						}); */
						
					} else {
						alert("아이디 또는 비밀번호가 잘못 입력 되었습니다.\n아이디와 비밀번호를 정확히 입력해 주세요.");
						$("#userId").focus();
					}
				},
				error: function (request, status, error) {
					alert("오류입니다.")
				}
		   	});
		});
	});
</script>
</head>
<body>
	<div class="popup-login-container">
      <div class="popup-login-content ">
         <h2>로그인</h2>      
         <div class="form-group join-user-id flex">
            <div>
               <label class="control-label" for="userId">이메일</label>
               <input class="form-control" type="text" name="userId" id="userId" />
            </div>
         </div>
         <div class="form-group">
            <label class="control-label" for="userPassword">비밀번호</label>
            <input class="form-control" type="password" name="userPassword" id="userPassword" />
         </div>
         <div class="form-group">
            <button class="btn-login" id="login-check">로그인</button>
            <button class="btn-login-cancle" id="login-cancel" onclick="window.close();">취소</button>
         </div>
      
      </div>   
   </div>
</body>
</html>