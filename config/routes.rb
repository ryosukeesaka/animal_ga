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
 	post "relationships/:id" => "relationships#create", as: "relationships"
 	get "users/:id/follows" => "relationships#follows", as: "follows"
  get "users/:id/followers" => "relationships#followers", as: "followers"
  get "users/:id/edit/withdraw" => "users#withdraw", as: "withdraw"
  get "search" => "users#search", as: "search"
  get "transfer" => "posts#transfer", as: "transfer"
    namespace :admins do
     resources :users, only: [:index, :show, :update, :edit]
     resources :posts, only: [:index, :destroy]

   end
    resources :relationships, only: [:destroy]
    resources :messages, only: [:create, :destroy]
    resources :rooms, only: [:create,:show]
    resources :users, only: [:index, :show, :edit, :update, :creates, :destroy]
  	resources :posts, only: [:index, :create, :show, :update, :edit, :destroy] do
  	  resources :post_comments, only: [:create, :destroy]
  	  resource  :favorites, only: [:create, :destroy]
    end




end
