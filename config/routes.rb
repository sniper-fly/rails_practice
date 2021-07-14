Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'blogs#top'
  resources :blogs
  get '/blog/favorites' => 'blogs#favorites'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :inquiry, only: [:index, :new, :create]
  post '/inquiry/confirm' => 'inquiry#confirm'
  get '/inquiry/confirm' => 'inquiry#new'

  get '/user_list/followers' => 'user_list#followers'
  get '/user_list/follow' => 'user_list#follow'
  resources :user_list, only: [:index, :show, :create, :destroy]

  resources :comment, only: [:create, :edit, :update, :destroy]

  resources :favorites, only: [:create, :destroy]

end
