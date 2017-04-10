Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'

  get 'profile/:id', to: 'pages#profile', as: :user_profile

end
