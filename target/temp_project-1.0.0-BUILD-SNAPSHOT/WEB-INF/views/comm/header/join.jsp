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
   
   .join-user-id {
      display: flex;
      flex-flow:  
   }
</style>
<script type="text/javascript">
   $(document).ready(function() {
		var count = 0;
		/* // id(이메일) 규칙 */
		
		// 유효성 체크 - 아이디 중복성 체크
		$("#userIdCheck").click(function() {
			var user_id = $("#userId").val();
			var user_pwd = $("#userPassword").val();
			var user_pwdch = $("#userPasswordCheck").val();
			var user_nick = $("#userNickname").val();
			// 이메일 유효성 확인 정규식
			var emailRule = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			
			// 이메일 유효성 검사
			if ( !emailRule.test(user_id) ) {
				alert("이메일 양식에 맞춰 작성해주시기 바랍니다.");
				return false;
			}
			
			var data = {
				userId: $("#userId").val()
			};
			
			$.ajax({
				url: "/join/idcheck.json",
				dataType: "json",
				contentType: "application/json;charset=utf-8;",
				type: "post",
				data: JSON.stringify(data),
				success: function (data) {
					console.log(data["result"]);
					count++;
					
					if ( data["result"] == 1 ) {
						alert("중복된 아이디입니다.");
						return false;
					} else {
						alert("사용가능한 아이디입니다.");
					}
				},
				error: function () {
					alert("에러입니다.");
				}
			});
		});
		
		/* // 회원가입 확인 버튼 클릭 시	 */
		$("#join-check").click(function() {
			if ( count = 0 ) {
				alert("아이디 중복확인을 해주세요.");
				return false;
			}
			var paramData = {
					userId: $("#userId").val(),
					userPwd: $("#userPassword").val(),
					userNick: $("#userNickname").val()
			};
			
			// 아이디 공백일 경우
			if ( $("#userId").val() == null || $("#userId").val() == "" ) {
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			} else if ( $("#userPassword").val() == null || $("#userPassword").val() == "" ) {
				alert("비밀번호를 입력해주세요.");
				$("#userPassword").focus();
				return false;
			} else if ( $("#userPasswordCheck").val() == null || $("#userPasswordCheck").val() == "" ) {
				alert("비밀번호를 입력해주세요.");
				$("#userPasswordCheck").focus();
				return false;
			} else if ( $("#userPassword").val() != $("#userPasswordCheck").val() ) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#userPassword").focus();
				return false;
			} else if ( $("#userNickname").val() == null || $("#userNickname").val() == "" ) {
				alert("닉네임을 입력해주세요");
				$("#userNickname").focus();
				return false;
			}
			
	      	$.ajax({
				url: "/join/joininfo.json",
				dataType: "text",
				contentType: "application/json;charset=utf-8;",
				type: "post",
				data: JSON.stringify(paramData),
				success: function (data) {
					alert("회원가입이 완료되었습니다.")
					location.href = "<%= request.getContextPath() %>/login.ds";
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
         <h2>회원가입</h2>      
         <div class="form-group join-user-id flex">
            <div>
               <label class="control-label" for="userId">이메일</label>
               <input class="form-control" type="text" name="userId" id="userId" />
            </div>
            <div>
            	<input type="button" id="userIdCheck" value="중복확인" />
            </div>
         </div>
         <div class="form-group">
            <label class="control-label" for="userPassword">비밀번호</label>
            <input class="form-control" type="password" name="userPassword" id="userPassword" />
         </div>
         <div class="form-group">
            <label class="control-label" for="userPasswordCheck">비밀번호 확인</label>
            <input class="form-control" type="password" name="userPasswordCheck" id="userPasswordCheck" />
         </div>
         <div class="form-group">
            <label class="control-label" for="userNickname">닉네임</label>
            <input class="form-control" type="text" name="userNickname" id="userNickname" />
         </div>
         <div class="form-group">
            <button class="btn-join-check" id="join-check">회원가입</button>
            <button class="btn-join-fail" id="join-fail" onclick="window.close();">취소</button>
         </div>
      
      </div>   
   </div>
</body>
</html>