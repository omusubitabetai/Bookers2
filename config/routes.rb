Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :books, only: [:edit, :index, :show, :create]
  resources :users, only: [:edit, :index, :show]
  get "/homes/about" => "homes#about", as: "about"
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end