Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :users, only: [:show] do
    resource :logout
    resource :identification
    resource :profile
  end
  resources :products, only: [:index, :new, :show] do
    collection do
      get 'list'
    end
  end
end
