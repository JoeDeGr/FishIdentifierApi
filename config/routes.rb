Rails.application.routes.draw do
  get 'genus/show'
  get 'species/show'
  # post 'users/create'
  # get 'users/show'
  # patch 'users/id', to: 'users#update'
  # get 'users/destroy'

  resources :users, only: [:create, :show, :update, :destroy]

  post "/login", to: "auth#login"

  get "/auto_login", to: "auth#auto_login"

  get "/authorized_user", to: "auth#authorized_user"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
