Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :posts do
      resources :likes
      resources :comments
    end
  end
  # Defines the root path route ("/")
  # root "users#index"
end
