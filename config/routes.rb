Rails.application.routes.draw do
	root to: 'photos#feed'
	devise_for :users
  	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  	
=begin
  	scope '/user/:user_id' do
  		resources :photos, only: [:index, :new, :create]
  		resources :albums, only: [:index, :new, :create]
  	end
  	resources :photos, only: [:show, :edit, :update, :destroy]
  	resources :albums, only: [:show, :edit, :update, :destroy]
=end
	get 'photos/all', to: 'photos#all'

  	resources :photos
  	resources :albums
  	get 'users/follower', to: 'users#follower_index_private_profile'
  	get 'users/following', to: 'users#following_index_private_profile'

  	# public profile (user A watch user B's profile)
	scope '/users/:user_id' do
		get 'photos', to: 'photos#public_index'
		get 'albums', to: 'albums#public_index'
		get 'follower', to: 'users#follower_index_public_profile'
		get 'following', to: 'users#following_index_public_profile'
	end


  	scope '/admin' do
  		get 'photos', to: 'admins#photos_index'
  		get 'albums', to: 'admins#albums_index'
  		get 'users', to: 'admins#users_index'
  	end

  	get '/users/follow/:user_id', to: 'users#follow'
  	get '/users/unfollow/:user_id', to: 'users#unfollow'

  	scope '/likes/:model_type' do
  		get 'like/:post_id', to: 'likes#like'
  		get 'unlike/:post_id', to: 'likes#unlike'
  	end
end
