Rails.application.routes.draw do
  get "session/new"
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/help", to: "static_pages#help"
  get "/signup",  to: "users#new"
  post "/signup",  to: "users#create"
  get "/login",  to: "sessions#new"
  post "/login",  to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :cities
  resources :users
end
