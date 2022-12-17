Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :books, only: [:edit, :index, :show, :create, :destroy]
  resources :users, only: [:edit, :index, :show, :update]
  get "home/about" => "homes#about", as: "about"
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  patch 'users/:id/edit' => 'users#update', as: 'update_user'
end