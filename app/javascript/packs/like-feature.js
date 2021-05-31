$(function() {
	$('.like-btn').click(function(e) {
		postId = $(this).data("postId");
		actionLike = $(this).data('likeAction');
		modelType = $(this).data('modelType')
		urlAction = `/likes/${modelType}/${actionLike}/${postId}`;
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
		  	if (actionLike == 'like') {
				$(selectorButton).children('i').removeClass("far").addClass("fas")
				$(selectorButton).data('likeAction', 'unlike')
		  	} else {
				$(selectorButton).children('i').removeClass("fas").addClass("far")
				$(selectorButton).data('likeAction', 'like')
		  	}
		  	$(selectorButton).children('#like-count-text').text(result)
		  }
		})
}
