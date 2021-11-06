// 헤더 클릭시 오름차순, 내림차순 값을 저장하기 위한 전역변수
var num = 9;
var dir = "asc";

// 숫자 3자리마다 콤마(,) 입력 함수
function comma(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

// 테이블 정렬
function sortTable(n) {
	var table, rows, switching, i, x, y, shouldSwitch, switchcount = 0;  // 초기화
	table = document.getElementById("table_ticker");	// 테이블 아이디

	// 테이블 콤마(제거)
	// $(".won").text().replace(/[^0-9\.]+/g, "");


	switching = true;
	// 정렬 방향을 오름차순으로 설정
	if (dir == undefined || dir == "asc") {
		dir = "asc";
	} else if (dir == "desc") {
		dir = "desc"
	}

	// 전환이 완료되지 않을 때까지 계속되는 루프
	while (switching) {
		// 전환이 완료되지 않음
		switching = false;
		rows = table.getElementsByTagName("tr");
		// 모든 테이블 행을 통해 루프
		for (i = 1; i < (rows.length - 1); i++) {
			// 전환이 없는 상태로 시작
			shouldSwitch = false;
			// 비교하려는 두 요소를 가져옴 
			x = rows[i].getElementsByTagName("td")[n];		// x = 현재 행 숫자
			y = rows[i + 1].getElementsByTagName("td")[n];	// y = 다음 행 숫자
			// $(".won").text().replace(/[^0-9\.]+/g, "");

			// 오름차순, 내림차순에 따라 두 행이 위치를 바꿔야 하는지 확인
			if (dir == "asc") {
				x = x.innerHTML.toLowerCase();
				y = y.innerHTML.toLowerCase();
				// 양수 숫자
				if ((num == 2 || num == 4 || num == 5) || (n == 2 || n == 4 || n == 5)) {
					var parse_x = parseFloat(x.replace(/[^0-9\.]+/g, ""));
					var parse_y = parseFloat(y.replace(/[^0-9\.]+/g, ""));

					if (parse_x - parse_y > 0) {
						shouldSwitch = true;
						break;
					}
					// 문자
				} else if ((num == 0 || num == 1) || (n == 0 || n == 1)) {
					if (x > y) {
						shouldSwitch = true;
						break;
					}
					// 음수 포함 숫자
				} else if ((num == 3) || (n == 3)) {
					switch (x.indexOf("-")) {
						case -1:
							var parse_x = parseFloat(x.replace(/[^0-9\.]+/g, ""));
						case 0:
							var parse_x = parseFloat(x.replace(/[^0-9\.]+/g, "-"));
					}
					switch (y.indexOf("-")) {
						case -1:
							var parse_y = parseFloat(y.replace(/[^0-9\.]+/g, ""));
						case 0:
							var parse_y = parseFloat(y.replace(/[^0-9\.]+/g, "-"));
					}
					if (parse_x > parse_y) {
						shouldSwitch = true;
						break;
					}
				}
				
				/* // 한꺼번에 비교해서 코드는 간단하지만 처리속도가 느림
				if (x.localeCompare(y, 'en', {numeric: true}) > 0) {
				// 조건에 맞다면 스위치로 마킹 후 loop break
				  shouldSwitch = true;
				  break;
				}*/
			} else if (dir == "desc") {
				x = x.innerHTML.toLowerCase();
				y = y.innerHTML.toLowerCase();

				if ((num == 2 || num == 4 || num == 5) || (n == 2 || n == 4 || n == 5)) {
					var parse_x = parseFloat(x.replace(/[^0-9\.]+/g, ""));
					var parse_y = parseFloat(y.replace(/[^0-9\.]+/g, ""));

					if (parse_x - parse_y < 0) {
						shouldSwitch = true;
						break;
					}
				} else if ((num == 0 || num == 1) || (n == 0 || n == 1)) {
					if (x < y) {
						shouldSwitch = true;
						break;
					}
				} else if ((num == 3) || (n == 3)) {
					switch (x.indexOf("-")) {
						case -1:
							var parse_x = parseFloat(x.replace(/[^0-9\.]+/g, ""));
						case 0:
							var parse_x = parseFloat(x.replace(/[^0-9\.]+/g, "-"));
					}
					switch (y.indexOf("-")) {
						case -1:
							var parse_y = parseFloat(y.replace(/[^0-9\.]+/g, ""));
						case 0:
							var parse_y = parseFloat(y.replace(/[^0-9\.]+/g, "-"));
					}
					if (parse_x < parse_y) {
						shouldSwitch = true;
						break;
					}
				}
			}
		}
		if (shouldSwitch) {
			// 스위치가 마킹된 경우 전환이 완료되었음을 표시
			rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			switching = true;
			// 전환이 완료될 때마다 Count +1
			switchcount++;
		} else {
			// 전환이 수행되지 않고 오름차순(asc)인경우 내림차순(desc)로 설정하고 while 루프 다시 실행
			if (switchcount == 0 && dir == "desc") {
				dir = "asc";
				switching = true;
			} else if (switchcount == 0 && dir == "asc") {
				dir = "desc";
				switching = true;
			}
		}
	}
	// 위에서 선연한 전역변수 값저장  sortTable(n)
	num = n;
	// console.log(dir);  //dir 값 확인(asc, desc)
}

// 코인 마켓 api를 가져와서 json타입으로..
function setUpbitData() {
	$.ajax({
		url: "https://api.upbit.com/v1/market/all",
		dataType: "json"
	}).done(function(markets) {
		// 마켓 확인
		//$("#tmp").html( JSON.stringify(markets) );

		let arr_krw_markets = "";	// KRW_코인명 들어갈 변수
		let arr_korean_name = [];	// 한글 이름을 넣을 배열
		let arr_english_name = [];	// 영어 이름을 넣을 배열

		// api에 있는 코인 수 만큼 반복
		for (var i = 0; i < markets.length; i++) {
			if (markets[i].market.indexOf("KRW") > -1) {	// 코인명에 KRW가 있으면 실행
				arr_krw_markets += markets[i].market + (",");			// , 로 KRW 구분
				arr_korean_name.push(markets[i].korean_name);		// 한글이름 푸쉬
				arr_english_name.push(markets[i].english_name);		// 영어이름 푸쉬
			}
		}
		// 마켓 한화 정보 (마지막에 , 삭제)
		arr_krw_markets = arr_krw_markets.substring(0, arr_krw_markets.length - 1);
		// console.log("krw_markets  : " + arr_krw_markets);

		// test 
		//$("#tmp").html( arr_krw_markets );

		// 각각 코인들(markets)의 url로 불러옴 
		$.ajax({
			url: "https://api.upbit.com/v1/ticker?markets=" + arr_krw_markets,
			dataType: "json"
		}).done(function(tickers) {

			//테이블 데이터를 계속 불러와서 쌓이기 때문에 전에있던 테이블을 삭제(값만 변하는 것처럼 보임
			$("#table_ticker > tbody > tr").remove();
			// console.log($("#table_ticker > tbody > tr").length);	// 테이블이 삭제됬는지 콘솔로 확인 : 0
			for (let i = 0; i < tickers.length; i++) {
				/* let rowHtml = "<tr><td>" + 넘버 +"</td>"; */
				// 코인 영어이름(제일처음 받아오는 값이라 tr로 열어줌)
				let rowHtml = "<tr class='exchange_bold exchange_en_name'><td class='text_center'>" + arr_english_name[i] + "</td>";
				/* rowHtml += "<td>"+ arr_english_name[i] + "</td>"; */
				// 코인 한글이름
				rowHtml += "<td class='text_center exchange_bold exchange_kr_name'>" + arr_korean_name[i] + "</td>";
				// 현재가
				rowHtml += "<td class='text_right exchange_bold'>₩ " + comma(tickers[i].trade_price) + "</td>";
				// 전일대비 api에서 제공해주는 Change 값으로 전일대비 색 지정
				switch (tickers[i].change) {
					case "RISE":	// 상승
						rowHtml += "<td class='text_right change_rise'>" + (tickers[i].signed_change_rate * 100).toFixed(2) + " % </td>";
						break;		// 하락
					case "FALL":
						rowHtml += "<td class='text_right change_fall'>" + (tickers[i].signed_change_rate * 100).toFixed(2) + " % </td>";
						break;		// 보합
					case "EVEN":
						rowHtml += "<td class='text_right change_even'>" + (tickers[i].signed_change_rate * 100).toFixed(2) + " % </td>";
				}
				// 거래대금
				rowHtml += "<td class='text_right'>₩ " + comma(Math.round(tickers[i].acc_trade_price_24h)) + "</td>";
				// 거래 량
				rowHtml += "<td class='text_right'>" + comma(Math.round(tickers[i].acc_trade_volume_24h)) + "</td>";
				rowHtml += "</tr>";
				// Table의 마지막 Row 다음에 Row 추가하기
				$("#table_ticker > tbody:last").append(rowHtml);
			} // end for...

			// 정렬 버튼 클릭이 인지되지않으면 위에 저장되있는 값으로, 오름차순, 내림차순으로 저장
			if (num != 9) {
				sortTable(num);
			}
		})  //done(function(tickers){
	}) // end done(function(markets){
		.fail(function() {							// 에러 시 패일
			//alert("업비트 API 접근 중 에러.")}
			$("#tmp").text("API 접근 중 에러.");		// API 접근 에러
		});

}
$(function() {
	setInterval(setUpbitData, 2000);			// 1초마다 데이터 불러옴

});