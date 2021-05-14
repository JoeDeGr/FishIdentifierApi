Rails.application.routes.draw do
  get 'genus/show'
  get 'species/show'
  # post 'users/create'
  # get 'users/show'
  # patch 'users/id', to: 'users#update'
  # get 'users/destroy'

  resources :users, only: [:create, :show, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
