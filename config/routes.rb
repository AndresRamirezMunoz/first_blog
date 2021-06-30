Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  get '/user_articles/:id' => 'articles#show_user_articles', as: :user_articles

  resources :articles do
    resources :comments
  end

  default_url_options :host => "http://127.0.0.1:3000/"
end
