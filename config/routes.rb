Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  get 'books/new'
  get 'homes/top'
  devise_for :users
  resources :users, only: [:show, :edit]
end
