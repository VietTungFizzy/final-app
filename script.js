$(function() {

})

function like(data) {
	const iconElement = ".feeds-page #" + data + " i"
	if($(iconElement).hasClass("fas fa-heart text-blue-facebook")) {
			$(iconElement).removeClass("fas fa-heart text-blue-facebook").addClass("far fa-heart text-blue-facebook")	
		}
		else {
			$(iconElement).removeClass("far fa-heart text-blue-facebook").addClass("fas fa-heart text-blue-facebook")	
		}
}

function toggleModal(data) {
	console.log(data)
	const image = $("#"+ data + " .card-img").attr("src")
	const title = $("#"+ data + " .card-title.font-weight-bold").text()
	const description = $("#"+ data + " .card-content").text()
	$("#photoModal img").attr("src", image)
	$("#photoModal #photoModalLabel").text(title)
	$("#photoModal p").text(description)
	$("#photoModal").modal("toggle")
}
