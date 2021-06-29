Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  resources :articles do
    resources :comments
  end

  default_url_options :host => "http://127.0.0.1:3000/"
end
