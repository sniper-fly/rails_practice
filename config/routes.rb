Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'blogs#top'
  resources :blogs
  get '/blog/favorites' => 'blogs#favorites'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :inquiry, only: [:index, :new, :create]
  resources :user_list, only: [:index, :show]
  post '/inquiry/confirm' => 'inquiry#confirm'
  get '/inquiry/confirm' => 'inquiry#new'
  resources :comment, only: [:create, :edit, :update, :destroy]
  resources :favorites, only: [:create, :destroy]
  # post :confirm


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
