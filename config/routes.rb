Rails.application.routes.draw do
    devise_for :users
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    post '/login', to: 'auth#login', default: {:format => :json}
    # Defines the root path route ("/")
    root "users#index"
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :new, :create, :destroy] do
        resources :comments, only: [:create, :destroy]
      end
      post "/posts/:id/like" => "posts#like", as: :like
  end
  scope 'api' do
    resources :users, only: [] do
      get '/posts' => 'api/posts#index'
      scope :posts do
        resources :comments, only: [:index, :create]
      end
    end
  end
end
