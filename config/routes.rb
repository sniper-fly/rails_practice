Rails.application.routes.draw do
  root to: 'blogs#index'
  resources :blogs
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :inquiry


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
