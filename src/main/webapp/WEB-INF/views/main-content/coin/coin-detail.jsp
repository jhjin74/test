<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://code.highcharts.com/stock/highstock.js"></script>
    <script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
    <script src="/js/coin-detail.js"></script>
    <style>   
        dd {
            margin: 0;
            padding: 0;
            border: 0;
        }

        /* 전체 뷰 */
        .coin_detail_view {
            display: block;
            background-color: #fff;
        }
        
        /* 메인 컨텐트 */
		.detail_main_coin {
			padding: 10px;
		}
        /* 메인헤더 */
        .detail_main_header {
            position: relative;
            display: block;
            height: 42px;
            padding: 0 14px;
            border-bottom: 1px solid #d4d6dc;
            
        }
        .detail_main_header_mainTitle {
            font-size: 20px;
            float: left;
            font-weight: 700;
            margin-top: 6px;
            
        }

        .detail_main_header_subTitle {
            color: #666;
            font-size: 12px;
            float: left;
            margin: 18px 4px 0;
            letter-spacing: .05em;
            display: block;
            margin-block-start: 1.3em;
            
        }

        /* 금액 정보 */
        .detail_main_info {
            height: 80px;
            display: flex;
            justify-content: space-between;
            position: relative;
            padding: 18px 20px 14px;
            overflow: hidden;
        }

        /* 금액 정보 왼쪽 */
        .detail_main_info_left {
            display: flex;
            align-items: center;
            margin-left: 20px;
        }

        .detail_main_info_left_first {
            display: block;
            margin: -6px 0 -10px 0;
        }

        .detail_main_info_left_first > strong {
            font-size: 32px;
            color: red;
            font-weight: 700;
        }

        .detail_main_info_left_first > em {
            display: inline-block;
            margin: 0 4px 0  -3px;
            font-size: 14px;
            font-style: normal;
        }

        .detail_main_info_left_second {
            display: block;
            
        }

        .detail_main_info_left_second > p {
            margin-right: -4px;
            line-height: 19px;
            color: #666;
            font-size: 11px;
            display: inline-block;
        }

        .detail_main_info_left_second > strong {
            color: red;
            font-size: 16px;
            font-weight: 700;
            display: inline-block;
        }

        /* 금액 정보 오른쪽 */
        .detail_main_info_right {
            display: flex;
            position: relative;
            align-items: center;
            margin-right: 20px;
        }

        .detail_main_info_right_first {
            width: 210px;
            margin-left: 20px;
            overflow: hidden;
            float: left;
            display: block;
            margin: 0;
            padding: 0;
        }
        .detail_main_info_right_first > dt {
            float: left;
            height: 18px;
            line-height: 18px;
            width: 16%;
        }

        .detail_main_info_right_first > dd{
            float: left;
            width: 84%;
            height: 18px;
            line-height: 18px;
            text-align: right;
            letter-spacing: 0.5px;
            
        }

        .detail_main_info_right_first > dd:nth-child(2){
            margin-bottom: 9px;
            padding-bottom: 9px;
            border-bottom: 1px solid #e3e5ec;
        }

        
        .detail_main_info_right_first > dt:first-child{
            margin-bottom: 9px;
            padding-bottom: 9px;
            border-bottom: 1px solid #e3e5ec;
        }

        dl > dd > strong {
            font-weight: 700;
            display: inline-block;
        }

        .detail_main_info_right_second {
            float: left;
            width: 300px;
            overflow: hidden;
            display: block;
            margin: 0 0 0 20px;
            padding: 0;
        }

        .detail_main_info_right_second > dt {
            float: left;
            width: 35%;
            height: 18px;
            line-height: 18px;
        }

        .detail_main_info_right_second > dt:first-child {
            margin-bottom: 9px;
            padding-bottom: 9px;
            border-bottom: 1px solid #e3e5ec;
        }

        .detail_main_info_right_second > dd {
            float: left;
            width: 65%;
            height: 18px;
            line-height: 18px;
            text-align: right;
            letter-spacing: 0.5px;
        }

        .detail_main_info_right_second > dd:nth-child(2){
            margin-bottom: 9px;
            padding-bottom: 9px;
            border-bottom: 1px solid #e3e5ec;
        }

        .detail_main_info_right_second > dd > i {
            display: inline-block;
            color: #999;
            font-size: 11px;
            letter-spacing: .05em;
            font-style: normal;
            margin: 0;
            padding: 0;
        }

        .detail_main_info_right_second > dd:last-child > i {
            margin-left: -5px;
            padding-left: 2px;
            letter-spacing: 0em;
        }

        /* 차트 디자인 */
        .detail_chart_container {
            width: 100%;
            height: 500px;
        }

        /* 사이드 */
        .coin_detail_side {
            width: 400px;
            height: 100%;
        }

        /* 사이드 타이틀 */
        .detail_side_coin_header {
            display: table;
            width: 400px;
            
            border-bottom: 1px solid #e3e5ec;
        }

        .detail_side_coin_title {
            display: table-cell;
            vertical-align: middle;
            text-align: center;
            padding: 20px;
        }

        .detail_side_coin_list {
            width: 400px;
            border: 0!important;
            display: table;
            table-layout: fixed;
            border-spacing: 0;
        }

        .detail_side_coin_list > tbody > tr {
            height: 45px;
            display: table-row;
            vertical-align: middle;
            text-align: center;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div id="coin_detail_view" class="coin_detail_view flex-auto flex h-full">
        <!-- 메인 -->
        <div id="detail_main_coin" class="detail_main_coin relative w-full">
            <!-- 헤더 -->
            <div id="detail_main_header" class="detail_main_header">
                <strong class="detail_main_header_mainTitle">비트코인</strong>
                <p class="detail_main_header_subTitle">BTC/KRW</p>
            </div>
            <!-- 금액 정보 -->
            <div id="detail_main_info" class="detail_main_info">
                <!-- 왼쪽 -->
                <div id="detail_main_info_left" clas="detail_main_info_left">
                    <span class="detail_main_info_left_first">
                        <strong></strong>
                        <em>KRW</em>
                    </span>
                    <span class="detail_main_info_left_second">
                        <p>전일대비</p>
                        <strong></strong>
                    </span>
                </div>
                <!-- 오른쪽 -->
                <div id="detail_main_info_right" clas="detail_main_info_right">
                    <dl id="detail_main_info_right_first" class="detail_main_info_right_first">
                        <dt>고가</dt>
                        <dd>
                            <strong></strong>
                        </dd>
                        <dt>저가</dt>
                        <dd>
                            <strong></strong>
                        </dd>
                    </dl>
                    <dl id="detail_main_info_right_second" class="detail_main_info_right_second">
                        <dt>거래량(24H)</dt>
                        <dd>
                            <strong></strong>
                            <i class></i>
                        </dd>
                        <dt>거래대금(24H)</dt>
                        <dd>
                            <strong></strong>
                            <i class="price_unit">KRW</i>
                        </dd>
                    </dl>        
                </div>
            </div>
            <!-- 그래프 -->
            <div id="detail_chart_container" class="detail_chart_container">
        
            </div>
            <!-- 체결 및 호가 -->
            <div id="detail_main_trade" class="detail_main_trade">
                <!-- 체결 -->
                <div id="detail_main_trade_volume" class="detail_main_trade_volume">

                </div>
                <!-- 호가 -->
                <div id="detail_main_trade_orderbook" class="detail_main_trade_orderbook">

                </div>
            </div>
        </div>

        <!-- 사이드 -->
        <div id="coin_detail_side" class="coin_detail_side">
            <!-- 타이틀 -->
            <div class="detail_side_coin_header">
                <div class="detail_side_coin_title">
                    한글명
                </div>
                <div class="detail_side_coin_title">
                    현재가
                </div>
                <div class="detail_side_coin_title">
                    전일대비
                </div>
                <div class="detail_side_coin_title">
                    거래대금
                </div>
            </div>
            <!-- 코인 목록 -->
            <div style="position: relative; overflow: hidden; width: 100%; height: 100%;">
                <div style="position: absolute; inset: 0px; overflow: scroll;">
                    <table id="detail_side_coin_list" class="detail_side_coin_list">
                        <tbody>
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>