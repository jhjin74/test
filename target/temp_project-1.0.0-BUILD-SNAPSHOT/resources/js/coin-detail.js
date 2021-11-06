/**
 * 
 */
function sideChart() {
	var ticker_url = "";
	upbit_market_url = 'https://api.upbit.com/v1/market/all';
	upbit_ticker_url = 'https://api.upbit.com/v1/ticker?markets=';
	
	var coin_market = new Array();
	var side_data = new Array();
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
					tempObj.korean_name = data[i].korean_name;
					tempObj.english_name = data[i].english_name;
					coin_market.push(tempObj);
				}
			}
			console.log(coin_market);
			ticker_url = ticker_url.substring(0, ticker_url.length - 1);
		}
	});
	
	/* ticker */
	$.ajax({
		url: upbit_ticker_url + ticker_url,
		dataType: "json",
		async: false,
		cache: false,
		success: function(data) {
			for(var i = 0; i < data.length; i++) {
				var tempObj = {};
				var index = coin_market.findIndex(idx => idx.market == data[i].market.substring(4));
				
				tempObj.korean_name = coin_market[index].korean_name;
				tempObj.market = data[i].market.substring(4) + "/" + data[i].market.substring(0, 3);
				tempObj.trade_price = data[i].trade_price.toLocaleString();
				tempObj.signed_change_rate = (data[i].signed_change_rate * 100).toFixed(2);
				tempObj.acc_trade_price_24h = parseInt(data[i].acc_trade_price_24h / 1000000).toLocaleString();
				tempObj.url = (coin_market[index].english_name).toLowerCase(); 
				tempObj.high_price = data[i].high_price.toLocaleString();
				tempObj.low_price = data[i].low_price.toLocaleString();
				tempObj.acc_trade_volume_24h = parseInt(data[i].acc_trade_volume_24h).toLocaleString();
				
				side_data.push(tempObj);
			}
			$("#detail_side_coin_list > tbody > tr").remove();
			console.log(side_data);
			/* 사이드에 추가 */
			for(var i = 0; i < side_data.length; i++) {
				var rowHtml = "<tr onclick='moveToDetail(" + side_data[i].url + ");'><td style='text-align: center; height: 44px;'><strong style='display: block; font-weight: 700;'>" + side_data[i].korean_name + "<br><em style='font-size: 11px; font-style: normal; letter-spacing: .05em; margin-bottom: -10px;'>" + side_data[i].market + "</em></strong></td>";
				if ( side_data[i].signed_change_rate.substring(0, 1) != '-' ) {
					rowHtml += "<td style='vertical-align: top; text-align: right; height: 44px;'><strong style='color: red; font-size: 18px; padding-top: 17px; line-height: 1.5em;'>" + side_data[i].trade_price + "</strong></td>";
					rowHtml += "<td style='vertical-align: top; text-align: right; height: 44px;'><strong style='color: red; padding-top: 17px; line-height: 1.5em;'>" + side_data[i].signed_change_rate + "</strong></td>";	
				} else {
					rowHtml += "<td style='vertical-align: top; text-align: right; height: 44px;'><strong style='color: blue; font-size: 18px; padding-top: 17px; line-height: 1.5em;'>" + side_data[i].trade_price + "</strong></td>";
					rowHtml += "<td style='vertical-align: top; text-align: right; height: 44px;'><strong style='color: blue; padding-top: 17px; line-height: 1.5em;'>" + side_data[i].signed_change_rate + "</strong></td>";
				}
				rowHtml += "<td style='vertical-align: top; text-align: right; height: 44px;'><strong style='padding-top: 17px; line-height: 1.5em;'>" + side_data[i].acc_trade_price_24h + "백만</strong></td>";
				
				$("#detail_side_coin_list > tbody:last").append(rowHtml);
			}
			
			/* 메인 헤더에 값 추가*/
			var str = window.location.pathname.substring(1);
			str = str.substring(0, str.length-3);
			var index = side_data.findIndex(idx => idx.url == str);
			/*acc_trade_price_24h: "546,236"
			korean_name: "비트코인"
			market: "BTC/KRW"
			signed_change_rate: "2.16"
			trade_price: "76,113,000"
			url: "bitcoin"*/
			
			/* 한글 이름 */
			$("#detail_main_header > strong").html(`${side_data[index].korean_name}`);
			
			/* 줄임말 */
			$("#detail_main_header > p").html(`${side_data[index].market}`);
			
			/* 가격 */
			$("#detail_main_info_left > span:first-child > strong").html(`${side_data[index].trade_price}`);
			
			/* 나라 */
			/*$("#detail_main_info_left > span:first-child > em").html(`${side_data[index].market.substring(4)}`);*/
			
			/* 전일대비 */
			$("#detail_main_info_left > span:last-child > strong").html(`${side_data[index].signed_change_rate}%`);
			
			/* 고가 */
			$("#detail_main_info_right_first > dd:nth-child(2) > strong").html(`${side_data[index].high_price}`);
			
			/* 저가 */
			$("#detail_main_info_right_first > dd:last-child > strong").html(`${side_data[index].low_price}`);
			
			/* 거래량(24h) */
			$("#detail_main_info_right_second > dd:nth-child(2) > strong").html(`${side_data[index].acc_trade_volume_24h}`);
			
			/* 거래량(24h) - 코인이름 */
			$("#detail_main_info_right_second > dd:nth-child(2) > i").html(`${side_data[index].market.substring(0, side_data[index].market.length-4)}`);

			/* 거래량(24h) */
			$("#detail_main_info_right_second > dd:last-child > strong").html(`${side_data[index].acc_trade_price_24h}`);
			
		}
	});
}

function candleCharts() {
    var chart_data = [];
    $.getJSON('https://api.upbit.com/v1/candles/days?market=KRW-BTC&count=200', function (data) {
        $.each(data, function(i, item) {
            chart_data.push([item.candle_date_time_kst, item.opening_price, item.high_price, item.low_price, item.prev_closing_price]);
        });
    }).done(function () {
    			
        	Highcharts.stockChart('detail_chart_container', {
            title: {
                text: 'BTC-KRW'
            },
            plotOptions: {
                candlestick: {
                    downColor: 'blue',
                    upColor: 'red'
                }
            },
            series: [{
                name: 'BTC-KRW',
                type: 'candlestick',
                data: chart_data,
                tooltip: {
                    valueDecimals: 8
                }
            }]
        });
    });
}

$(document).ready(function () {
	candleCharts();
	setInterval(sideChart, 1000);
	urlInfo();
	/*var param = */
});

function moveToDetail(event) {
	location.href = "/" +  event + ".ds";
}
