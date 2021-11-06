// bitshumb api는 코인이름이 안나와있어서 upbit 정보를 가져와서 공통된 코인들만 출력(이름넣어주기 용)
const request = new XMLHttpRequest();
const url = 'https://api.upbit.com/v1/market/all';

request.open("GET", url, false);
request.send();
var markets = JSON.parse(request.responseText);
// console.log(markets[0].market);

var market_code = [];
var kr_name = [];
var en_name = [];
var count = 0;
for (var i = 0; i < markets.length; i++) {
	if (markets[i].market.indexOf("KRW") > -1) {
		market_code[count] = markets[i].market.substring(4);
		kr_name[count] = markets[i].korean_name;
		en_name[count] = markets[i].english_name;
		count++;
	} else {
		continue;
	}
}
// console.log(market_code);
// console.log(kr_name);
// console.log(en_name);
// console.log(market_code.indexOf("BTC"));


// 콤마직기
function comma(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
// 콤마 제거
function removecomma(x) {
	return parseFloat(x.replace(/[^0-9]/g, ""));
}


// 헤더 클릭시 오름차순, 내림차순 값을 저장하기 위한 전역변수
var num = 9;
var dir = "asc"

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

// 빗썸
function setBithumb() {
	var bithumb = new Array();
	$.ajax({
		url: 'https://api.bithumb.com/public/ticker/ALL_KRW',
		dataType: 'json',
		async: false,
		cache: false,
		success: function(coin) {
			var keys = Object.keys(coin.data);
			var count = 0;
			// console.log(coin.data);
			// console.log(coin.data.date);
			for (var i = 0; i < keys.length - 1; i++) {
				var bt = {};
				var key = keys[i];
				var index = market_code.indexOf(keys[i]);

				// upbit 와 bithumb의 코드 교집합
				if (index > -1) {
					// 한글명, 영어명
					bt.krName = kr_name[index];
					bt.enName = en_name[index];
					// 현재가
					bt.closing_price = coin.data[key].closing_price;
					// 전일대비
					bt.fluctate_rate_24H = coin.data[key].fluctate_rate_24H;
					// 거래대금
					bt.acc_trade_value_24H = coin.data[key].acc_trade_value_24H;
					// 거래량
					bt.units_traded_24H = coin.data[key].units_traded_24H;
					// bithumb에 bt 내용 저장
					bithumb.push(bt);

				} else {
					continue;
				}

			}
			bithumb.push(coin.data.date);

			// console.log(bithumb);
			// console.log(bithumb[0].closing_price);
			
			// 다음 테이블 생성을 위해 이전 테이블 삭제.
			$("#table_ticker > tbody > tr").remove();
			for (let i = 0; i < bithumb.length - 1; i++) {
				// 영어이름
				let rowHtml = "<tr><td class='exchange_bold exchange_en_name'>" + bithumb[i].enName + "</td>";
				// 한글이름
				rowHtml += "<td class='exchange_bold exchange_kr_name'>" + bithumb[i].krName + "</td>";
				// 현재가
				rowHtml += "<td class='text_right exchange_bold'> ₩ " + comma(bithumb[i].closing_price) + "</td>";
				// 전일 대비
				if (bithumb[i].fluctate_rate_24H.indexOf("0.00") > -1) {
					rowHtml += "<td class='text_right exchange_bold' style='color: blue;'>" + bithumb[i].fluctate_rate_24H + " % </td>";
				} else if (bithumb[i].fluctate_rate_24H.indexOf("-") > -1) {
					rowHtml += "<td class='text_right exchange_bold' style='color: red;'>" + bithumb[i].fluctate_rate_24H + " % </td>";
				} else {
					rowHtml += "<td class='text_right exchange_bold' style='color: green;'>" + bithumb[i].fluctate_rate_24H + " % </td>";
				}
				// 거래대금
				rowHtml += "<td class='text_right exchange_bold'> ₩ " + comma(bithumb[i].acc_trade_value_24H) + "</td>";
				// 거래량
				rowHtml += "<td class='text_right exchange_bold'>" + comma(bithumb[i].units_traded_24H) + "</td></tr>"
				// 테이블 마지막에 삽입
				$("#table_ticker > tbody:last").append(rowHtml);
			}
			// end for
			// 정렬 버튼 클릭이 인지되지않으면 위에 저장되있는 값으로, 오름차순, 내림차순으로 저장
			if (num != 9) {
				sortTable(num);
			}
		},
		fail: function(xhr, status, error) {
			console.log(xht);
			console.log(status);
			console.log(error);
		}
	});
};
// 페이지 로드시 2초 간격으로 반복 실행
$(document).ready(function() {
	setInterval(setBithumb, 2000);
});