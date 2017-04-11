Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  get 'profile/:id', to: 'pages#profile', as: :user_profile

  post 'search', to: 'pages#index', as: :search

  post 'favorite/:track_id', to: 'pages#add_favorite', as: :add_favorite_track
end
