function follow(data) {
	const btnElement = "#" + data + " .border-orange"
	console.log(btnElement)
	console.log($(btnElement))
	if($(btnElement).hasClass("active")) {
		$(btnElement).removeClass("active")
		$(btnElement).text("Follow")
	}
	else {
		$(btnElement).addClass("active")
		$(btnElement).text("Following")
	}
}
