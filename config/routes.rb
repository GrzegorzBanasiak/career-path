Rails.application.routes.draw do

  devise_for :users
  root 'pages#index'
  get 'pages/about'
  get 'panel/index'

  resources :forms do
    resources :answers, only: [:new, :create, :show]  
    member do
      put :change_consent
    end
  end

  resources :questions, only: [:create, :destroy] do
    member do
      post :add_option
      delete :remove_option
    end
  end



end
