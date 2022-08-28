Rails.application.routes.draw do

  # get 'user/show', to: 'user#show'
  # get 'user/add', to: 'user#add'
  # get 'user/remove', to: 'user#remove'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
resources :users, only: [:index, :show, :create, :destroy]
  # Defines the root path route ("/")
  root "users#index"
end
