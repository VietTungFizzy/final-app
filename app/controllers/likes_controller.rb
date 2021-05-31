class LikesController < ApplicationController
	def like
		logger.debug params
		like_count = 0
		if params[:model_type] == 'Photo'
			photo = Photo.find(params[:post_id])
			photo.likes.create(user_id: current_user.id)
			photo.like_count += 1
			like_count = photo.like_count
			photo.save!
		else
			album = Album.find(params[:post_id])
			album.likes.create(user_id: current_user.id)
			album.like_count += 1
			like_count = album.like_count
			album.save!
		end

		respond_to do |format|
			format.json { render json: like_count }
		end
	end

	def unlike
		likes = Like.find_by liked_on_id: params[:post_id], liked_on_type: params[:model_type]
		likes.destroy
		like_count = 0
		if params[:model_type] == 'Photo'
			photo = Photo.find(params[:post_id])
			photo.like_count -= 1
			like_count = photo.like_count
			photo.save!
		else
			album = Album.find(params[:post_id])
			album.like_count -= 1
			like_count = album.like_count
			album.save!
		end

		respond_to do |format|
			format.json { render json: like_count }
		end
	end
end
