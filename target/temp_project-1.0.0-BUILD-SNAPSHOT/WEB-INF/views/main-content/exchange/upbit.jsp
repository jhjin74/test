<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- ajax를 사용하기위한 script (비동기 통신)-->
<title>업비트(upbit) 시세조회</title>
<link rel="stylesheet" type="text/css" href="/css/exchange.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/js/upbit.js"></script>
</head>
<body>
	<div id="tmp" style="color: pink;"></div>
	<br />
	<br />
	<div class="exchange_table">
		<div class="exchange_change">
			<span class="exchange_name">업비트 시세</span> 
			<a href="http://localhost:8080/exchange/bithumb" class="button12">
				<em> </em> <span> Bithumb </span>
			</a>
		</div>
		<table id="table_ticker" class="exchange_table">
			<thead>
				<tr>
					<!-- 헤더 -->
					<th onclick="sortTable(0)">영어명</th>
					<!-- 테이블 헤더 클릭 시 정렬 -->
					<th onclick="sortTable(1)">한글명</th>
					<th class="text_right" onclick="sortTable(2)">현재가</th>
					<th class="text_right" onclick="sortTable(3)">전일대비</th>
					<th class="text_right" onclick="sortTable(4)">거래대금 (24H)</th>
					<th class="text_right" onclick="sortTable(5)">거래량 (24H)</th>
					<!-- <th class="text_right th_hover" onclick="sortTable(5)">변동 비교</th> -->
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<br />
	<br />
	<br />

</body>
</html>
