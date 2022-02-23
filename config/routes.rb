Rails.application.routes.draw do
 
  resources :users, only: [:show, :index] do
   resources :posts, only: [:show, :index]
   resources :comments, only: [:create]
   resources :likes, only: [:create]
  end

  resources :posts, only: [:new, :create]
  root 'users#index'
end
