class PhotosController < ApplicationController
	before_action :authenticate_user!, except: [:all, :show]

	def all
		@photos = Photo.all
	end

	def feed
		@photos = Photo.includes(:user).where(user_id: Relationship.where(follower_id: current_user.id).pluck(:followed_id))
	end

	def index
		@photos = Photo.where(user_id: current_user.id)
		@user = current_user
		@photos_count = Photo.where(user_id: current_user.id).count
		@albums_count = Album.where(user_id: current_user.id).count
		@followings_count = Relationship.where(follower_id: current_user.id).count
		@followers_count = Relationship.where(followed_id: current_user.id).count
	end

	def public_index
		@photos = Photo.where(user_id: params[:user_id])
		@user = User.find(params[:user_id])
		@photos_count = Photo.where(user_id: @user.id).count
		@albums_count = Album.where(user_id: @user.id).count
		@followings_count = Relationship.where(follower_id: @user.id).count
		@followers_count = Relationship.where(followed_id: @user.id).count
		@is_following = Relationship.exists?(follower_id: current_user.id, followed_id: params[:user_id])
	end

	def show
		@photo = Photo.find(params[:id])
		respond_to do |format|
		    format.html
		    format.json {render json: @photo}
		end
	end

	def create
		param = photo_params()
		photo = current_user.photos.create() do |u|
			u.title = param[:title]
			u.description = param[:description]
			u.sharing_mode = param[:sharing_mode]
			u.image = param[:image]
		end
		if photo.valid?
			flash[:notice] = 'Photo created successfully'
		else
			flash[:error] = 'Failed to create photo'
		end

		redirect_to photos_path
	end

	def new
		@photo = Photo.new
	end

	def edit
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:id])
	   	is_succeed = @photo.update(photo_params)
	   	if is_succeed == true
	   		flash[:notice] = 'Photo updated successfully'
		else
			flash[:error] = 'Failed to update photo'
	   	end

	   	redirect_to photos_path
	end

	def destroy
		photo = Photo.find(params[:id])
		photo.destroy

		redirect_to photos_path
	end

	private
	def photo_params
		params.require(:photo).permit(:title, :sharing_mode, :description, :image)
	end
end
