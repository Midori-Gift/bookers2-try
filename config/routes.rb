Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'

  get 'homes/about' => 'homes#about'

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :index, :edit, :create, :edit, :update]

end
