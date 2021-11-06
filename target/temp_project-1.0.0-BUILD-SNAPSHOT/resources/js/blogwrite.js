/**
BNO
TITLE
CATEGORY
USER_NICKNAME
CONTENT
HIT_CNT
REGDATE
 * 
 */

$(document).ready(function () {
	
	$("#write_button").click(function () {
		CKupdate();
		var paramData = {
			title: $("#title").val(),
			category: $("#write-category").val(),
			userNick: $("#span-username").text(),
			content: $("#write_content").val()
		}
		
		$.ajax({
			url: "/insertwriteForm.json",
			contentType: "application/json;charset=utf-8;",
			type: "post",
			data: JSON.stringify(paramData),
			success: function (result) {
				console.log("값을 넘겨줬음");
				console.log(result.result);
				location.href = "/blog-my";
			},
			error: function (status, request, error) {
				console.log(status);
				console.log(request);
				console.log(error);
			}
		});
	});
});
function CKupdate(){
	for (instance in CKEDITOR.instances)
	CKEDITOR.instances[instance].updateElement();
	
}
