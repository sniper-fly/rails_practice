Rails.application.routes.draw do
  devise_for :users
  root to: 'blogs#index'
  resources :blogs
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :inquiry
  post '/inquiry/confirm' => 'inquiry#confirm'
  # post :confirm


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
