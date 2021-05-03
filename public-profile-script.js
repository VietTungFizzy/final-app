function follow() {
	const btnElement = ".border-orange"
	if($(btnElement).hasClass("active")) {
		$(btnElement).removeClass("active")
		$(btnElement).text("Follow")
	}
	else {
		$(btnElement).addClass("active")
		$(btnElement).text("Following")
	}
}