Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
    post "/posts/:id/like" => "posts#like", as: :like
    post "/posts/:id/comment" => "posts#comment", as: :comments
  end
end
