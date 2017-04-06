Rails.application.routes.draw do

  devise_for :users
  root to: 'organizations#home'

  # resources :users
  resources :organizations, param: :category


  # devise_scope :user do
  #   authenticated :user do
  #     root to: 'posts#index'
  #   end

  #   unauthenticated :user do
  #     root to: 'devise/sessions#new'
  #   end
  # end

end