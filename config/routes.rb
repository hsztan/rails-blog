Rails.application.routes.draw do
    devise_for :users
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    post '/login', to: 'auth#login', default: {:format => :json}
    post '/signup', to: 'auth#signup', default: {:format => :json}
    post '/logout', to: 'auth#logout', default: {:format => :json}
    # Defines the root path route ("/")
    root "users#index"
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :new, :create, :destroy] do
        resources :comments, only: [:create, :destroy]
      end
      post "/posts/:id/like" => "posts#like", as: :like
  end
  scope 'api' do
    get '/posts/:id' => 'api/comments#index', as: :api_post_comments
    post '/posts/:id' => 'api/comments#create', as: :api_post_comments_create
    resources :users, only: [] do
      get '/posts' => 'api/posts#index', as: :api_user_posts
    end
  end
end
