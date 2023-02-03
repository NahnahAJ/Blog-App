Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    scope :v1 do 
      devise_for :users, # => this is the devise_for :users that is used for the api
      controllers: { 
        registrations: 'api/v1/users/registrations', 
        sessions: 'api/v1/users/sessions' 
      },
      path: '',
      path_names: { 
        sign_in: 'login',
        sign_out: 'logout',
        registration: 'register'
      }
    end
  end 
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

  # Defines the route for the api/v1/posts path
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

