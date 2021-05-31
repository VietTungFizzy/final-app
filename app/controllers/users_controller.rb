class UsersController < ApplicationController
	before_action :authenticate_user!

	def follower_index_private_profile
		@follower_users = User.includes(:relationships).where(id: Relationship.where(followed_id: params[:user_id]).pluck(:followed_id))
		@user = current_user
		@photos_count = Photo.where(user_id: @user.id).count
		@albums_count = Album.where(user_id: @user.id).count
		@followings_count = Relationship.where(follower_id: @user.id).count
		@followers_count = Relationship.where(followed_id: @user.id).count
		@is_following = Relationship.exists?(follower_id: current_user.id, followed_id: params[:user_id])
	end

	def follower_index_public_profile
		@follower_users = User.includes(:relationships).where(id: Relationship.where(followed_id: params[:user_id]).pluck(:followed_id))
		@user = User.find(params[:user_id])
		@photos_count = Photo.where(user_id: @user.id).count
		@albums_count = Album.where(user_id: @user.id).count
		@followings_count = Relationship.where(follower_id: @user.id).count
		@followers_count = Relationship.where(followed_id: @user.id).count
		@is_following = Relationship.exists?(follower_id: current_user.id, followed_id: params[:user_id])
	end

	def following_index_public_profile
		@following_users = User.includes(:relationships).where(id: Relationship.where(follower_id: params[:user_id]).pluck(:followed_id))
		@user = User.find(params[:user_id])
		@photos_count = Photo.where(user_id: @user.id).count
		@albums_count = Album.where(user_id: @user.id).count
		@followings_count = Relationship.where(follower_id: @user.id).count
		@followers_count = Relationship.where(followed_id: @user.id).count
		@is_following = Relationship.exists?(follower_id: current_user.id, followed_id: params[:user_id])
	end

	def follow
		relationship = Relationship.new
		relationship.follower_id = current_user.id
		relationship.followed_id = params[:user_id]
		relationship.save!
	end

	def unfollow
		relationship = Relationship.where(follower_id: current_user.id, followed_id: params[:user_id])
		relationship.destroy_all
	end
end
