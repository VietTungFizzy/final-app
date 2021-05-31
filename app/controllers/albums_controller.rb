class AlbumsController < ApplicationController
	before_action :authenticate_user!, except: [:all, :show]

	def all
		@albums = Album.all
	end

	def cache

	end

	def index
		@albums = Album.where(user_id: current_user.id)
		@photos_count = Photo.where(user_id: current_user.id).count
		@albums_count = Album.where(user_id: current_user.id).count
		@followings_count = Relationship.where(follower_id: current_user.id).count
		@followers_count = Relationship.where(followed_id: current_user.id).count
	end

	def public_index
		@albums = Album.where(user_id: params[:id])
	end

	def show
		@album = Album.find(params[:id])
		respond_to do |format|
		    format.html
		    format.json {render json: @album}
		end
	end

	def create
		param = album_params()
		album = current_user.albums.create() do |u|
			u.title = param[:title]
			u.description = param[:description]
			u.sharing_mode = param[:sharing_mode]
			u.images = param[:images]
		end
		if album.valid?
			flash[:notice] = 'album created successfully'
		else
			flash[:error] = 'Failed to create album'
		end

		redirect_to albums_path
	end

	def new
		@albums = Album.new
	end

	def edit
		@album = Album.find(params[:id])
	end

	def update
		@album = Album.find(params[:id])
	   	is_succeed = @photo.update(album_params)
	   	if is_succeed == true
	   		flash[:notice] = 'Album updated successfully'
		else
			flash[:error] = 'Failed to update album'
	   	end

	   	redirect_to albums_path
	end

	def destroy
		album = Album.find(params[:id])
		album.destroy

		redirect_to albums_path
	end

	private
	def album_params
		params.require(:album).permit(:title, :sharing_mode, :description, {images: []}, :is_continue)
	end
end
