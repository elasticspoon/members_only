Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: %i[show index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  resources :posts, except: :new do
    resources :comments, except: :new
  end
  post 'posts/:post_id/comments/:id', to: 'comments#create'
  post 'posts/:id', to: 'comments#create'
  get 'users', to: 'posts#index'
  root 'posts#index'
end
