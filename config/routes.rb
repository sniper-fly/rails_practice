Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'blogs#top'
  resources :blogs
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :inquiry, only: [:index, :new, :create]
  post '/inquiry/confirm' => 'inquiry#confirm'
  # post :confirm


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
