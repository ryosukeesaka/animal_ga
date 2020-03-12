Rails.application.routes.draw do
  namespace :admins do
    get 'users/index'
  end
  namespace :admin do
    get 'user/new'
  end
  	devise_for :admins
  	devise_for :users

 	root to: "homes#top"
 	post 'relationships/:id' => 'relationships#create', as: 'relationships'
 	get "users/:id/follows" => "relationships#follows", as: "follows"
  get "users/:id/followers" => "relationships#followers", as: "followers"
    namespace :admins do
     resources :users, only: [:index, :show, :update, :edit]
   end
    resources :relationships, only: [:destroy]
  	resources :users, only: [:index, :show, :edit, :update, :creates]
  	resources :posts, only: [:index, :create, :show, :update, :edit, :destroy] do
  	  resource :post_comments, only: [:create, :destroy]
  	  resource  :favorites, only: [:create, :destroy]
    end




end
