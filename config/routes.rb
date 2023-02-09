Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "users#index"
  # root "articles#index"

  # Defines the route for the users path and posts path
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy] 
        resources :likes, only: [:new, :destroy] 
  end
end

  # Defines the route for the api/v1/users path and api/v1/posts path
  namespace :api do
    namespace :v1 do
      resources :users do
      resources :posts do
        resources :comments
      end
    end
  end
end
end

