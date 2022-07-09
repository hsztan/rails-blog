Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  get "/users/user:id/posts" => "posts#index", as: :user_posts
  get "/users/user:id/posts/:id" => "posts#show", as: :user_post
  get "/users" => "users#index", as: :users
  get "/users/:id" => "users#show", as: :user
end
