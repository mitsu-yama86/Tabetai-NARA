Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products do
    resources :comments, only: [:create, :show]
  end
  resources :abouts, onle: [:index]
end
