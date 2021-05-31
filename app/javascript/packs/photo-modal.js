$(function() {
	$(".post").click(function(e) {
		console.log(e)
		const path = `photos/${e.currentTarget.id}`
		$.ajax({
		  type:"GET",
		  url: path,
		  dataType:"json",
		  data: {},
		  success:function(result){
		    $('#photoModal #photoModalLabel').text(result.title)
		    $("#photoModal p").text(result.description)
		    $("#photoModal img").attr("src", result.image.url)
		    $("#photoModal").modal("toggle")
		  }
		})
	})

	$("#photoModal .btn.close").click(function() {
		$("#photoModal").modal("toggle")
	})
})