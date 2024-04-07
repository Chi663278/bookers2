Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get 'home/about' => 'home#about', as: 'about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
