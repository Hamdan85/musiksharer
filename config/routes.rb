Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'pages#index'

  get 'profile/:id', to: 'pages#profile', as: :user_profile

  post 'search', to: 'pages#index', as: :search

  post 'favorite/:track_id', to: 'pages#add_favorite', as: :add_favorite_track

  resources :artists, only: [:index] do
    resources :albums, only: [:index, :show]
  end

end
