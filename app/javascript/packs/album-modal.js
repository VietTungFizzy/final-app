$(function() {
	$(".post").click(function(e) {
		console.log(e)
		const path = `albums/${e.currentTarget.id}`
		$.ajax({
		  type:"GET",
		  url: path,
		  dataType:"json",
		  data: {},
		  success:function(result){
		  	console.log(result)
		    $('#albumModal #albumModalLabel').text(result.title)
		    $("#albumModal p").text(result.description)
		    $("#albumModal .carousel-inner").append(`
		    	<div class="carousel-item active">
                	<img class="d-block w-100" src="${result.image[0].url}" alt="First slide">
	            </div>
		   	`)
		    for(const i = 1; i < result.image.length; i++) {
		    	$("#albumModal .carousel-inner").append(`
			    	<div class="carousel-item active">
	                	<img class="d-block w-100" src="${result.image[i].url}" alt="First slide">
		            </div>
		   		`)	
		    }
		    $("#albumModal").modal("toggle")
		  }
		})
	})

	$("#albumModal .btn.close").click(function() {
		$("#albumModal").modal("toggle")
	})
})