Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index] do
    resources :photos
    resources :friendships
  end
  resources :dialogs
  resources :messages

  resources :posts, only: [:create, :destroy]
  root "pages#index"
end
