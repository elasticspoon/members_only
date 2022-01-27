Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: %i[show index]
  resources :comments, only: %i[show create edit destroy update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  resources :posts, except: :new
  get 'users', to: 'posts#index'
  root 'posts#index'
end
