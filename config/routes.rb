Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  require 'sidekiq/web'

  authenticate :admin_user do
    mount Sidekiq::Web => "/sidekiq"
  end

  devise_for :users
  root 'pages#index'

  get 'profile/:id', to: 'pages#profile', as: :user_profile

  post 'search', to: 'pages#index', as: :search

  post 'favorite/:track_id', to: 'pages#add_favorite', as: :add_favorite_track

  resources :artists, only: [:index] do
    resources :albums, only: [:index, :show]
  end

  # error pages
  %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

end
