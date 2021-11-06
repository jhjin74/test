<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/js/coin.js"></script>
    <title>Document</title>
    <style>
    	.scroll_controller {
    		overflow-y: scroll;
    	}
    	
    	.scroll_controller::-webkit-scrollbar {
            display: none;
        }
    
        /* 전체 컨테이너 */
        .coin_grid_container {
            display: grid;
            align-content: stretch;
            justify-content: stretch;
            margin: 50px 20px;
            padding: 20px;
            column-gap: 20px;
            row-gap: 15px;
            grid-template-columns: repeat(4, 1fr);
        }

        /* 코인별 <a> */
        .coin_grid_items {
            display: block;
            border: 1px solid gray;
            border-radius: 5px;
            padding: 14px;
            text-align: left;
            width: 100%;
            height: 200px;
        }

        /* 코인 이름 */
        .coin_items_title {
            font-size: 22px;
            padding: .5rem 0;
            margin: 0;
            padding-top: 0;
            font-weight: 600;
        }

        /* 코인 넘버 */
        .coin_items_title_number {
            float: right;
            font-weight: 400;
            font-size: 22px;
        }

        /* 현재 구매 가격 */
        .coin_items_price_now {
            font-size: 28px;
            font-weight: 600;
        }

        /* 전일 대비 퍼센트 */
        .coin_items_price_yesterday {
            font-size: 18px;
            font-weight: 400;
        }

        /* 거래량 */
        .coin_items_trade {
            margin-top : .5rem;
            font-size: 18px;
            font-weight: 400;
        }

        /* 코인 그래프 div*/
        .coin_items_graph {
            height: 80px;
            margin-top: 14px;
        }

        /* 그래프 */
        .coin_items_graph_path {
            fill: none;
            /* vector-effect: non-scaling-stroke; */
            pointer-events: auto;
        }
    </style>
</head>
<body>
<div class="scroll_controller">
    <div class="coin_grid_container"> 
        <a id="1" class="coin_grid_items" onclick="onLoadDetailView(1);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="2" class="coin_grid_items" onclick="onLoadDetailView(2);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="3" class="coin_grid_items" onclick="onLoadDetailView(3);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="4" class="coin_grid_items" onclick="onLoadDetailView(4);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="5" class="coin_grid_items" onclick="onLoadDetailView(5);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="6" class="coin_grid_items" onclick="onLoadDetailView(5);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="7" class="coin_grid_items" onclick="onLoadDetailView(7);" >
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="8" class="coin_grid_items" onclick="onLoadDetailView(8);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="9" class="coin_grid_items" onclick="onLoadDetailView(9);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="10" class="coin_grid_items" onclick="onLoadDetailView(10);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="11" class="coin_grid_items" onclick="onLoadDetailView(11);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="12" class="coin_grid_items" onclick="onLoadDetailView(12);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="13" class="coin_grid_items" onclick="onLoadDetailView(13);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="14" class="coin_grid_items" onclick="onLoadDetailView(14);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="15" class="coin_grid_items" onclick="onLoadDetailView(15);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="16" class="coin_grid_items" onclick="onLoadDetailView(16);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="17" class="coin_grid_items" onclick="onLoadDetailView(17);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="18" class="coin_grid_items" onclick="onLoadDetailView(18);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="19" class="coin_grid_items" onclick="onLoadDetailView(19);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="20" class="coin_grid_items" onclick="onLoadDetailView(20);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="21" class="coin_grid_items" onclick="onLoadDetailView(21);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="22" class="coin_grid_items" onclick="onLoadDetailView(22);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="23" class="coin_grid_items" onclick="onLoadDetailView(23);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>

        <a id="24" class="coin_grid_items" onclick="onLoadDetailView(24);">
            <h2 id="english_name" class="coin_items_title">
                <span class="coin_items_title_number"></span>
            </h2>
            <div id="coin_items_price" class="coin_items_price">
                <span id="trade_price" class="coin_items_price_now"></span>
                <span id="signed_change_rate" class="coin_items_price_yesterday"></span>
            </div>
            <div id="coin_items_trade" class="coin_items_trade">
                <span id="acc_trade_volume_24h" class="coin_items_trade_volumn"></span>
            </div>
            <div class="coin_items_graph">
                <div class="sparkline" style="width: 100%; height: 100%; ">
                    <svg width="100%" height="100%" viewBox="0 0 800 200" preserveAspectRatio="none">
                        <path class="coin_items_graph_path" style="stroke-width: 1;">

                        </path>
                    </svg>
                </div>
            </div>
        </a>
    </div>
</div>    
</body>
</html>