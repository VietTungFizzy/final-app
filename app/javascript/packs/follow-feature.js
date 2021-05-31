$(function() {
	$('#follow-btn').click(function(e) {
		userId = $(this).data("userId");
		actionFollow = $(this).data('followingAction');
		urlAction = `/users/${actionFollow}/${userId}`;
		follow($(this), urlAction, actionFollow);
	})
})

function follow(selectorButton, urlAction, actionFollow) {
	$.ajax({
		  type:"GET",
		  url: urlAction,
		  dataType:"json",
		  data: {},
		  success:function(result){
		  	if (actionFollow == 'follow') {
				$(selectorButton).addClass("active")
				$(selectorButton).text("Unfollow")
				$(selectorButton).data('followingAction', 'unfollow')
		  	} else {
		  		$(selectorButton).removeClass("active")
				$(selectorButton).text("Follow")
				$(selectorButton).data('followingAction', 'follow')
		  	}
		  }
		})
}

// function follow(data) {
// 	let btnElement = "#" + data + " #follow-btn"
// 	if($(btnElement).hasClass("active")) {
// 		$.ajax({
// 		  type:"GET",
// 		  url: `'/users/unfollow/${data}'`,
// 		  dataType:"json",
// 		  data: {},
// 		  success:function(result){
// 		    $(btnElement).removeClass("active")
// 			$(btnElement).text("Follow")
// 		  }
// 		})
// 	}
// 	else {
// 		$.ajax({
// 		  type:"GET",
// 		  url: `'/users/follow/${data}'`,
// 		  dataType:"json",
// 		  data: {},
// 		  success:function(result){
// 		    $(btnElement).addClass("active")
// 			$(btnElement).text("Following")
// 		  }
// 		})
// 	}
// }
