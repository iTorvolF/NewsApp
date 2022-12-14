Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :posts do
    member do
      post :like
      get :likes
    end
  end

  namespace :api do
    namespace :v1 do
      resources :comments, only: [:index, :show, :create, :destroy]
    end
  end
  
  devise_for :users
  resource :profiles, only: [:edit, :update, :show]
  resources :colors, only: [:create]
end