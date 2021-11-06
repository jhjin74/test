function coinView() {
	upbit_market_url = 'https://api.upbit.com/v1/market/all';
	upbit_ticker_url = 'https://api.upbit.com/v1/ticker?markets=';

	todayTop24 = new Array();
	coin_market = new Array();
	coin_ticker = new Array();
	var ticker_url = "";
	// 코인 영어이름과 요약이름 가져오기
	$.ajax({
		url: upbit_market_url,
		dataType: "json",
		async: false,
		cache: false,
		success: function(data) {
			for (var i = 0; i < data.length; i++) {
				var tempObj = {};
				if (data[i].market.indexOf("KRW") > -1) {
					ticker_url += data[i].market + ",";
					tempObj.market = data[i].market.substring(4);
					tempObj.name = data[i].english_name;
					coin_market.push(tempObj);
				}
			}
			ticker_url = ticker_url.substring(0, ticker_url.length - 1);
		}
	});
	// 
	$.ajax({
		url: upbit_ticker_url + ticker_url,
		dataType: "json",
		async: false,
		cache: false,
		success: function(data) {
			console.log(data);

			coin_ticker.push(data.sort(function(a, b) {
				return b.trade_price - a.trade_price;
			}));

			console.log(coin_ticker);

			// name: "",  // 코인 이름
			// trade_price: 0.0, // 현재 구매 가격
			// signed_change_rate: 0.0, // 변화율
			// acc_trade_volume: 0.0 // 24시간 누적 거래량
			for (var i = 0; i < 24; i++) {
				var tempObj = {};
				var index = coin_market.findIndex(idx => idx.market == coin_ticker[0][i].market.substring(4));

				tempObj.market = coin_ticker[0][i].market.substring(4);
				tempObj.trade_price = coin_ticker[0][i].trade_price;
				tempObj.signed_change_rate = coin_ticker[0][i].signed_change_rate;
				tempObj.acc_trade_volume = coin_ticker[0][i].acc_trade_volume;
				tempObj.english_name = coin_market[index].name;
				
				todayTop24.push(tempObj);
				
			}
			console.log(todayTop24);
		}
	});

	for (var i = 0; i < todayTop24.length; i++) {
		var a_tag = "#" + (i + 1);
		var english_name = todayTop24[i].english_name; // 영어 이름
		var market = todayTop24[i].market; // 줄임말
		var trade_price = parseInt(todayTop24[i].trade_price).toLocaleString(); // 거래 가격
		var signed_change_rate = parseFloat(todayTop24[i].signed_change_rate * 100).toFixed(2); // 변화율
		var acc_trade_volume = parseInt(todayTop24[i].acc_trade_volume).toLocaleString(); // 거래량

		console.log(signed_change_rate.substring(0, 1));

		// 이름과 순서
		$(`${a_tag} > h2`).html(`${english_name} (${market}) <span style='float: right; font-weight: 800;'> ${a_tag} </span>`);
		// 거래 가격
		$(`${a_tag} > #coin_items_price > #trade_price`).html(`${trade_price}`);
		// 전일 대비 상승률
		$(`${a_tag} > #coin_items_price > #signed_change_rate`).html(`${signed_change_rate}%`);
		if (signed_change_rate.substring(0, 1) != "-") {
			$(`${a_tag}`).css("background", "linear-gradient(-60deg, #c9ffbf, #ffffff)");
			$(`${a_tag} > h2 > span`).css("color", "#6a9113");
			$(`${a_tag} > #coin_items_price > #signed_change_rate`).css("color", "#6a9113");
		} else {
			$(`${a_tag}`).css("background", "linear-gradient(-60deg, #ffafaf , #ffffff)");
			$(`${a_tag} > h2 > span`).css("color", "#cc4c03");
			$(`${a_tag} > #coin_items_price > #signed_change_rate`).css("color", "#cc4c03");
		}
		// 거래량
		$(`${a_tag} > #coin_items_trade > #acc_trade_volume_24h`).html(`거래량 ${acc_trade_volume}건`);
	}
};

$(document).ready(function() {
	setInterval(coinView, 1000);
});

function onLoadDetailView(event) {
	var url = (todayTop24[event-1].english_name).toLowerCase();
	location.href = "/" +  url + ".ds";
}