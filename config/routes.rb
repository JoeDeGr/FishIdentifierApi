Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/update'
  get 'posts/delete'

  get 'genus/show'
  get 'species/show'
  
  get "/auto_login", to: "auth#auto_login"
  get "/authorized_user", to: "auth#authorized_user"
  post "/login", to: "auth#login"

  post '/users', to: "users#create"

  post '/users/images', to: "users#image_upload" 

  resources :users, only: [:create, :show, :update, :destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
