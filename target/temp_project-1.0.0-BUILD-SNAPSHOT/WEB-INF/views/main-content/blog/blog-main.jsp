<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&family=Roboto+Mono&display=swap"
	rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
<title></title>
</head>
<style>
*{
text-decoration:none;
}
/*컨테이너 */
.row {  
  display: -ms-flexbox; 
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
}

/* Create two unequal columns that sits next to each other */
/* Sidebar/left column */
.side {
  -ms-flex: 30%; /* IE10 */
  flex: 10%;
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
  overflow:scroll;
  
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
ul.category, ul.sub-category-blog,ul.sub-category-menu {
	list-style:none;
	text-decoration:none;
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

.main2,.main3,.main4,.main5{
	border: 1px solid #e5ebf3;
	margin-bottom:20px;
	padding : 15px;
	
}
.main {
	border:1px solid #e5ebf3;
}
</style>
<body>
<div class="row">
  <div class="side">
    <h5>내 프로필</h5>
    <div class="fakeimg" style="height:200px;">Image</div>
    <ul class="category">
    	<li><a href="#"><i class="fas fa-home"></i><span class="category-title">HOME</span></a></li>
    	<li><a href="./blog-my"><i class="far fa-user"></i><span class="category-title">내 블로그</span></a></li>
    	<li><a href="#" id="category-drop-menu"><i class="fas fa-caret-down"></i><span class="category-title">카테고리</span></a>
    		<div class="sub-category-menu" style="display:none">
	    		<ul class="sub-category-blog">
							<li><a href="./Freeboard">자유게시판</a></li>
							<li><a href="./upbitboard">업비트</a></li>
							<li><a href="./bithumbboard">빗썸</a></li>
							<li><a href="./coinoneboard">코인원</a></li>
				</ul>
    		</div>
    	</li>
    </ul>
</div>
  <div class="main">
  	<div class="main2">
    <h2>최근 게시글</h2>
    <h5>날짜영역</h5>
    <div class="main_img" style="height:150px;">미리보기이미지</div>
    <p>내용</p>
    </div>
    
    <div class="main3">
    <h2>최근 게시글</h2>
    <h5>날짜영역</h5>
    <div class="main_img" style="height:150px;">미리보기이미지</div>
    <p>내용</p>
    
    </div>
    <div class="main4">
    <h2>최근 게시글</h2>
    <h5>날짜영역</h5>
    <div class="main_img" style="height:150px;">미리보기이미지</div>
    <p>내용</p>
    </div>
    
   	<div class="main5">
    <h2>최근 게시글</h2>
    <h5>날짜영역</h5>
    <div class="main_img" style="height:150px;">미리보기이미지</div>
    <p>내용</p>
    </div>
  </div>
</div>
<script>
$(document).ready(function(){
	var count = 0;
    $('#category-drop-menu').click(function() {
    	if ( count % 2 == 0) {
			$('.sub-category-menu').show();
	    	count++;
    	} else {
    		$('.sub-category-menu').hide();
        	count++;
    	}
    });
});
</script>
</body>
</html>
