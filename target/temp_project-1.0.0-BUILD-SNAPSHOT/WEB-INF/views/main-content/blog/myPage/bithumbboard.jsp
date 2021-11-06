<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/js/blog.js"></script>
<style>
*{
text-decoration:none;
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
  flex:10%;
  background: #f9fafc;
  padding: 20px;
  border: 1px solid #e5ebf3;
  text-decoration: none;
}

/* 메인 */
.main-5 {   
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
/* Responsive layout - when the screen is less than 700px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 700px) {
 .row {   
    flex-direction: column;
  }
}
ul.category-blog-my, ul.sub-category,ul.sub-category-category {
	list-style:none;
	text-decoration:none;
}
/*사이드 메뉴 내부 a태그 ul 속성*/
span.category-title-my {
	margin-left: 5px;
}
ul.category-blog-my a {
        display: block;
        font-size: 15px;
        color: #333;
        line-height: 40px;
        position: relative;

}
ul.category-blog-my a:hover {
    color: #1771f8;
}

.sub-category-my,sub-category-sub {
	display: block;
    display: none;
}
.write-btn {
    background-color:#555555;
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
  .write-btn:hover{
	background-color: white;
    color: #555555;;
  }
.main-5 {
	border: 1px solid #e5ebf3;
	margin-bottom:20px;
	padding : 15px;
}
.main-table5 {
    border: none;
	border-collapse: collapse;
	width: 100%;
	table-layout:fixed;
}

.main-table5 th{
    background-color: #3BB9FF;
    color: white;
}
.main-table5 th,td{
    text-align: left;
	padding: 15px;
	border-bottom: 1px solid #ddd;
}
.main-table5 tr:hover{
	background-color:#f5f5f5
}
.main-table5 tr:nth-child(even){
	background-color: #f2f2f2
}
.blogtable5{
	cursor:pointer;
	height: 100%;
	overflow: auto;
	text-overflow: ellipsis;
	white-space:nowrap;
}
	
</style>
<script type="text/javascript">
	$(document).ready(function(){
		var count = 0;
	    $('#blog-category1').click(function() {
	    	if ( count % 2 == 0) {
				$('.sub-category-my').show();
		    	count++;
	    	} else {
	    		$('.sub-category-my').hide();
	        	count++;
	    	}
	    });
	    $('#blog-category2').click(function() {
	    	if ( count % 2 == 0) {
				$('.sub-category-sub').show();
		    	count++;
	    	} else {
	    		$('.sub-category-sub').hide();
	        	count++;
	    	}
	    });
	});

	function openWriteForm() {
		location.href = "./writeForm";
	};
</script>
</head>
<body>
	<div class="row">
		<div class="side">
			<h5>내 프로필</h5>
			<div class="fakeimg" style="height: 200px;">Image</div>
			<ul class="category-blog-my">
				<li><a href="./blog"><i class="fas fa-home"></i><span
						class="category-title-my">HOME</span></a></li>
				<li><a href="./blog-my"><i class="far fa-user"></i><span class="category-title">내 블로그</span></a></li>
				<li><a href="#" id="blog-category1"><i
						class="fas fa-caret-down"></i><span class="category-title-my">내
							정보</span></a>
					<div class="sub-category-my" style="display: none">
						<ul class="sub-category">
							<li><a href="#">팔로워</a></li>
							<li><a href="#">팔로잉</a></li>
						</ul>
					</div></li>
				<li><a href="#" id="blog-category2"><i
						class="fas fa-caret-down"></i><span class="category-title-my">카테고리</span></a>
					<div class="sub-category-sub" style="display:none">
						<ul class="sub-category-category">
							<li><a href="./Freeboard">자유게시판</a></li>
							<li><a href="./upbitboard">업비트</a></li>
							<li><a href="./bithumbboard">빗썸</a></li>
							<li><a href="./coinoneboard">코인원</a></li>
						</ul>
					</div></li>
				<li><a href="#"><i class="fas fa-cog"></i><span
						class="category-title-my">설정</span></a></li>
			</ul>
			<button type="button" id="writeForm" class="write-btn" onclick="openWriteForm();">글쓰기</button>
		</div>
		<div class="main-5">
			<h2>내 게시글</h2>
			<div class="">
				<table class="main-table5">
					<thead class="table_head5">
		                <tr>
		                    <th>번호</th>
		                    <th>제목</th>
		                    <th>카테고리</th>
		                    <th>내용</th>
		                    <th>조회수</th>
		                    <th>날짜</th>
		                </tr>
		            </thead>
		            
			            <tbody class="blogtable5">
			            
			         	</tbody>
		         	
	            </table>
            </div>
		</div>
	</div>
</body>