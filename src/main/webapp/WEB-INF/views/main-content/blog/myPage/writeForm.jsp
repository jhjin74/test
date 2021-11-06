<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/99d509f314.js"></script>
<script	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- ckeditor -->
<!-- <script type="text/javascript" src="ckeditor/ckeditor.js"></script> -->
<script src="/js/ckeditor/ckeditor.js" ></script>
<script src="/js/blogwrite.js" ></script>

<title>Insert title here</title>
<style>
* {
	text-decoration: none;
}
/*컨테이너 */
.row {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
}

/* Create two unequal columns that sits next to each other */
/* Sidebar/left column */
.side {
	-ms-flex: 30%;
	flex: 3%;
	background: #f9fafc;
	padding: 20px;
	border: 1px solid #e5ebf3;
	text-decoration: none;
}

/* 메인 */
.main {
	-ms-flex: 70%; /* IE10 */
	flex: 70%;
	background-color: white;
	padding: 20px;
}

/* 이미지 영역*/
.fakeimg {
	background-color: #aaa;
	width: 75%;
	padding: 20px;
}

.main_img {
	background-color: #aaa;
	width: 30%;
	padding: 20px;
}
/* Responsive layout - when the screen is less than 700px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 700px) {
	.row {
		flex-direction: column;
	}
}

ul.category, ul.sub-category, ul.sub-category-menu {
	list-style: none;
	text-decoration: none;
}
/*사이드 메뉴 내부 a태그 ul 속성*/
span.category-title {
	margin-left: 5px;
}

ul.category a {
	display: block;
	font-size: 15px;
	color: #333;
	line-height: 40px;
	position: relative;
}

ul.category a:hover {
	color: #1771f8;
}

.sub-category-menu {
	display: block;
	display: none;
}

.write-btn {
	background-color: #555555;
	border: 2px solid gray;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 20px;
	cursor: pointer;
	border-radius: 0.5em;
	width: 100%;
	height: 60px;
}

.write-btn:hover {
	background-color: white;
	color: #555555;
}

.main {
	border: 1px solid #e5ebf3;
	margin-bottom: 20px;
	padding: 15px;
}

.write-box {
	text-align: center;
}

.form-btn {
	background-color: #f4511e;
	border: 2px solid #f4511e;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 18px;
	cursor: pointer;
	border-radius: 0.5em;
	width: 15%;
	height: 60px;
	margin-top: 50px;
	
}

.form-btn:hover {
	background-color: white;
	color: #f4511e;
}

.write-title {
	margin-bottom: 10px;
	font-size: 18px;
}

.write_sub_btn {
	width: 100%;
	align-content: center;
}

.write_button_style {
	width: 100%;
	text-align: center;
}
.title_write {
	padding: 12px 20px; 
	margin: 8px 0; 
	display: inline-block; 
	border: 1px solid #ccc; 
	border-radius: 4px; 
	box-sizing: border-box;
	width: 100%;
}
.write_category{
	padding: 12px 20px; 
	margin: 8px 0; 
	display: inline-block; 
	border: 1px solid #ccc; 
	border-radius: 4px; 
	box-sizing: border-box;
	width: 100%;
}

</style>
</head>
<body>
	<div class="row">
		<div class="side">
			<h5>내 프로필</h5>
			<div class="fakeimg" style="height: 200px">Image</div>
			<ul class="category">
				<li><a href="#"><i class="fas fa-home"></i><span
						class="category-title">HOME</span></a></li>
				<li><a href="./blog-my"><i class="far fa-user"></i><span class="category-title">내 블로그</span></a></li>
				<li><a href="#" id="category-drop-menu-my"><i
						class="fas fa-caret-down"></i><span class="category-title">내
							정보</span></a>
					<div class="sub-category" style="display: none">
						<ul class="sub-category">
							<li><a href="#">팔로워</a></li>
							<li><a href="#">팔로잉</a></li>
						</ul>
					</div></li>
				<li><a href="#" id="category-drop-menu-category"><i
						class="fas fa-caret-down"></i><span class="category-title">카테고리</span></a>
					<div class="sub-category-menu-category">
						<ul class="sub-category-menu">
							<li><a href="./Freeboard">자유게시판</a></li>
							<li><a href="./upbitboard">업비트</a></li>
							<li><a href="./bithumbboard">빗썸</a></li>
							<li><a href="./coinoneboard">코인원</a></li>
						</ul>
					</div></li>
				<li><a href="#"><i class="fas fa-cog"></i><span
						class="category-title">설정</span></a></li>
			</ul>
			<div class="write_sub_btn">
				<button type="button" class="write-btn" onclick="http">글쓰기</button>
			</div>
		</div>
		<div class="main">
			<h2>글 쓰기</h2>
			<div class="write-title">
				<label for="title" class="writeform_labal">제목</label>
				<input type="text" id="title" name="title" class="title_write"/> 
				<label class="writeform_labal">카테고리</label>
				<select id="write-category" name="CATEGORY" class="write_category">
					<option value="none">카테고리</option>
					<option value="자유게시판">자유게시판</option>
					<option value="업비트">업비트</option>
					<option value="빗썸">빗썸</option>
					<option value="코인원">코인원</option>
				</select>
			</div>
			<textarea name="content" id="write_content"></textarea>
			<script type="text/javascript">
   				var editorConfig = {
   					filebrowserUploadUrl : "/resources/ckeimgUpload/",//이미지업로드
   					extraPlugins : 'uploadimage'
   					
   				};
   				//에디터 이름 속성 옵션 설정
   				CKEDITOR.on('dialogDefinition', function(ev){
   					var dialogName = ev.data.name;
   					var dialogDefinition = ev.data.definition;

   					
   					switch (dialogName) {
   					case 'image' :
   						
   						dialogDefinition.removeContents('Link');//이미지 주소 옵션 삭제
   						dialogDefinition.removeContents('advanced');
   						break;
   					}
   				});
   				
   					CKEDITOR.replace("write_content",editorConfig);
   					
   			
		  	</script>
		  	<div class="write_button_style">
				<button type="button" id="write_button" class="form-btn">작성하기</button>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		var count = 0;
		$('#category-drop-menu-my').click(function() {
			if (count % 2 == 0) {
				$('.sub-category').show();
				count++;
			} else {
				$('.sub-category').hide();
				count++;
			}
		});
		$('#category-drop-menu-category').click(function() {
			if (count % 2 == 0) {
				$('.sub-category-menu').show();
				count++;
			} else {
				$('.sub-category-menu').hide();
				count++;
			}
		})
	});
</script>
</html>
