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
/*�����̳� */
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

/* ���� */
.main {   
  -ms-flex: 70%; /* IE10 */
  flex: 70%;
  background-color: white;
  padding: 20px;
  overflow:scroll;
  
}

/* �̹��� ����*/
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
/*���̵� �޴� ���� a�±� ul �Ӽ�*/
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
    <h5>�� ������</h5>
    <div class="fakeimg" style="height:200px;">Image</div>
    <ul class="category">
    	<li><a href="#"><i class="fas fa-home"></i><span class="category-title">HOME</span></a></li>
    	<li><a href="./blog-my"><i class="far fa-user"></i><span class="category-title">�� ��α�</span></a></li>
    	<li><a href="#" id="category-drop-menu"><i class="fas fa-caret-down"></i><span class="category-title">ī�װ�</span></a>
    		<div class="sub-category-menu" style="display:none">
	    		<ul class="sub-category-blog">
							<li><a href="./Freeboard">�����Խ���</a></li>
							<li><a href="./upbitboard">����Ʈ</a></li>
							<li><a href="./bithumbboard">����</a></li>
							<li><a href="./coinoneboard">���ο�</a></li>
				</ul>
    		</div>
    	</li>
    </ul>
</div>
  <div class="main">
  	<div class="main2">
    <h2>�ֱ� �Խñ�</h2>
    <h5>��¥����</h5>
    <div class="main_img" style="height:150px;">�̸������̹���</div>
    <p>����</p>
    </div>
    
    <div class="main3">
    <h2>�ֱ� �Խñ�</h2>
    <h5>��¥����</h5>
    <div class="main_img" style="height:150px;">�̸������̹���</div>
    <p>����</p>
    
    </div>
    <div class="main4">
    <h2>�ֱ� �Խñ�</h2>
    <h5>��¥����</h5>
    <div class="main_img" style="height:150px;">�̸������̹���</div>
    <p>����</p>
    </div>
    
   	<div class="main5">
    <h2>�ֱ� �Խñ�</h2>
    <h5>��¥����</h5>
    <div class="main_img" style="height:150px;">�̸������̹���</div>
    <p>����</p>
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
