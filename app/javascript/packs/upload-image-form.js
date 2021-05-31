$(function(){
	$("#image-area").on('click', '#upload-image-btn', function() {
		let fileDialog = $('#photo_image')
		if(fileDialog.length == 0) fileDialog = $('#album_images')
		console.log(fileDialog)
		fileDialog.click()
		fileDialog.on("change", function(e) {
			console.log(e.target.files);
			//Preview image
			const image = e.target.files[0]
			$('#file-size').val(image.size)
			let reader = new FileReader()
			reader.onload = function(file) {
				console.log(file.target.result)
				$('#image-area').children().remove()
				$('#image-area').html(`
					<div class="d-flex">
			            <div class="position-relative">
			              <img src="${file.target.result}" width="200px" height="200px">
			              <div class="position-absolute cancel-icon">
			                <i class="fas fa-times"></i>
			              </div>
			            </div>
			        </div>`)
			}
			reader.readAsDataURL(image)
		})
		return false
	})
	$('#image-area').on('click', '.cancel-icon', function() {
		$('#image-area').children().remove()
		$('#image-area').html(`
			<div class="d-flex">
				<button class="add-photo-btn rounded" type="upload-image" id="upload-image-btn">
					<i class="fas fa-plus fa-3x plus-color"></i>
				</button>
			</div>
		`)
		$('#photo_image').val('')
		$('#file-size').val('')
	})

	$(".photo-new-page #photo-form").validate({
		rules: {
			"photo[title]": {
				required: true,
				maxlength: 140 // 140 characters
			},
			"photo[description]": {
				required: true,
				maxlength: 300 // 300 characters
			},
			"photo[image]": {
				required: true,
				extension: "jpeg|png|gif"
			},
			"file-size": {
				max: 5000000 // 5 MB
			}
		},
		errorClass: "fw-bold text-danger"
	})

	$(".photo-edit-page #photo-form").validate({
		rules: {
			"photo[title]": {
				required: true,
				maxlength: 140 // 140 characters
			},
			"photo[description]": {
				required: true,
				maxlength: 300 // 300 characters
			}
		},
		errorClass: "fw-bold text-danger"
	})

	$('.album-new-page #save-btn, .album-edit-page #save-btn').click(function() {
		$('#modal').modal('toggle')
	})
});