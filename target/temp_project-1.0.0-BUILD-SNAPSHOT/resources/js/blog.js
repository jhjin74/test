/**
 * 
 */
function onChangeCategory(url) {
	var category_name = "";
	switch(url) {
		case("Freeboard"): category_name = "자유게시판";
			break;
		case("upbitboard"): category_name = "업비트";
			break;
		case("bithumbboard"): category_name = "빗썸";
			break;
		case("coinoneboard"): category_name = "코인원";
			break; 
		
	}
	var paramData = {
		userNick: $("#span-username").text(),
		category: category_name
	}
	console.log(paramData);
	
	$.ajax({
		url: "/" + url,
		dataType: "json",
		contentType: "application/json;charset=utf-8;",
		type: "post",
		data: JSON.stringify(paramData),
		success: function (data) {
			/*for(var i=0; i<data.result[0].length; i++) {				
			}*/
			$("#blog_my_table > tbody > tr").remove();
			for(var i=0; i < data.result.length; i++) {
				var regDate = new Date(data.result[i].REGDATE);
				if ( data.result[i].HIT_CNT == undefined ) { data.result[i].HIT_CNT = 0; }
				let rowHtml = "<tr><td>" + (i + 1) + "</td>";
				rowHtml += "<td>" + data.result[i].TITLE + "</td>";
				rowHtml += "<td>" + data.result[i].CATEGORY + "</td>";
				rowHtml += "<td>" + (data.result[i].CONTENT).substring(0, 8) + "..." + "</td>";
				rowHtml += "<td>" + data.result[i].HIT_CNT + "</td>";
				rowHtml += "<td>" + regDate.toLocaleDateString() + "</td></tr>";
				$(".main-table > tbody:last").append(rowHtml);
			}
			console.log(data);
			console.log("성공");
			console.log(data.result[0].BNO);
			console.log(data.result[0].TITLE);
			console.log(data.result[0].CATEGORY);
			console.log(data.result[0].CONTENT);
			console.log(data.result[0].HIT_CNT);
			console.log(regDate.getFullYear()+'년 '+(regDate.getMonth()+1)+'월 '+regDate.getDate()+'일');
			
		}, error: function (status, request, error) {
			console.log(status);
			console.log(request);
			console.log(error);
		}
	});
}
$(document).ready(function() {
	var paramData = {
		userNick: $("#span-username").text()
	}
	
	$.ajax({
		url: "/blog-my.json",
		dataType: "json",
		contentType: "application/json;charset=utf-8;",
		type: "post",
		data: JSON.stringify(paramData),
		success: function (data) {
			/*for(var i=0; i<data.result[0].length; i++) {
		
			}*/
			for(var i=0; i < data.result.length; i++) {
				var regDate = new Date(data.result[i].REGDATE);
				if ( data.result[i].HIT_CNT == undefined ) { data.result[i].HIT_CNT = 0; }
				let rowHtml = "<tr><td>" + (i + 1) + "</td>";
				rowHtml += "<td>" + data.result[i].TITLE + "</td>";
				rowHtml += "<td>" + data.result[i].CATEGORY + "</td>";
				rowHtml += "<td>" + (data.result[i].CONTENT).substring(0, 8) + "..." + "</td>";
				rowHtml += "<td>" + data.result[i].HIT_CNT + "</td>";
				rowHtml += "<td>" + regDate.toLocaleDateString() + "</td></tr>";
				$(".main-table > tbody:last").append(rowHtml);
			}
			console.log(data);
			console.log("성공");
			console.log(data.result[0].BNO);
			console.log(data.result[0].TITLE);
			console.log(data.result[0].CATEGORY);
			console.log(data.result[0].CONTENT);
			console.log(data.result[0].HIT_CNT);
			console.log(regDate.getFullYear()+'년 '+(regDate.getMonth()+1)+'월 '+regDate.getDate()+'일');
			
		}, error: function (status) {
			console.log(status);
		}
	});
});