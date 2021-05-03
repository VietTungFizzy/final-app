$(function() {

})

function like(data) {
	const iconElement = "#" + data + " i"
	if($(iconElement).hasClass("fas")) {
			$(iconElement).removeClass("fas").addClass("far")	
		}
		else {
			$(iconElement).removeClass("far").addClass("fas")	
		}
}

function follow(data) {
	const btnElement = "#" + data + " .border-orange"
	if($(btnElement).hasClass("active")) {
			$(btnElement).removeClass("active")
			$(btnElement).text("Follow")
		}
		else {
			$(btnElement).addClass("active")
			$(btnElement).text("Following")
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
