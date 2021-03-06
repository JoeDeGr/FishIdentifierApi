Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/update'
  get 'posts/delete'

  get 'genus', to: "genus#show"
  get 'species', to: "species#show"
  
  get "/auto_login", to: "auth#auto_login"
  get "/authorized_user", to: "auth#authorized_user"
  post "/login", to: "auth#login"

  patch '/users/addSpecies', to: "users#add_species"
  patch '/users/addGenus', to: "users#add_genus"
  patch '/users/removeSpecies', to: "users#remove_species"
  patch '/users/removeGenus', to: "users#remove_genus"

  post '/users', to: "users#create"

  post '/users/images', to: "users#image_upload" 
  
  resources :users, only: [:create, :show, :update, :destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
