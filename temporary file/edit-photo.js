$(function() {
	$("#save-btn").click(function() {
		$("#edit-photo-form").validate({
			rules: {
				title: {
					required: true,
					maxlength: 140
				},
				description: {
					required: true,
					maxlength: 300
				}
			}
		})
	})
	$("#delete-btn").click(function() {
		$("#delete-confirmation-box").modal("toggle")
	})
})