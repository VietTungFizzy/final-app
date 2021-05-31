$(function() {
	$('#like-btn').click(function(e) {
		postId = $(this).data("postId");
		actionLike = $(this).data('likeAction');
		urlAction = `/like/${actionLike}/${postId}`;
		like($(this), urlAction, actionLike);
	})
})

function like(selectorButton, urlAction, actionLike) {
	$.ajax({
		  type:"GET",
		  url: urlAction,
		  dataType:"json",
		  data: {},
		  success:function(result){
		  	if (actionLike == 'follow') {
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
