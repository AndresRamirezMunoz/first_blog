Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  get '/user_articles/:id' => 'articles#show_user_articles', as: :user_articles
  get '/users/' => 'users#index', as: :search_user
  #get '/users/search/' => 'users#show_users()', as: :search_user_for

  resources :articles do
    resources :comments
  end

  resources :users do
    member do
      get :following, :followers, :follow, :unfollow
    end
  end

  #get '/users/:id/following' => 'users#following', as: :following_user
  #get '/users/:id/followers' => 'users#followers', as: :followers_user

  resources :relationships, only: [:create, :destroy]

  default_url_options :host => "http://127.0.0.1:3000/"
end
