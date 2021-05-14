Rails.application.routes.draw do
  get 'genus/show'
  get 'species/show'
  post 'users/create'
  get 'users/show'
  get 'users/update'
  get 'users/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
