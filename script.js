$(function() {
	$(".feeds-page .like").click(function(e) {
		
	})
})

function like(data) {
	if($(".feeds-page .like i").eq(data).hasClass("fas fa-heart text-blue-facebook")) {
			$(".feeds-page .like i").eq(data).removeClass("fas fa-heart text-blue-facebook").addClass("far fa-heart text-blue-facebook")	
		}
		else {
			$(".feeds-page .like i").eq(data).removeClass("far fa-heart text-blue-facebook").addClass("fas fa-heart text-blue-facebook")	
		}
}