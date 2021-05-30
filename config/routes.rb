Rails.application.routes.draw do
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'
match '/auth/facebook/callback' => 'sessions#create', via:[:get, :post]
#match '/auth/google_auth2/callback' => 'sessions#create', via:[:get, :post]

root 'goals#welcome'
get '/search' => 'goals#search', :as => 'goals_search'
  resources :goals
  #post '/goals/new', to: 'goals#create'
  post '/comments/new', to: 'comments#create'

  resources :goals do
    resources :comments
    resources :users
    resources :categories
  end

  resources :users do
    resources :goals
    resources :comments
  end

  resources :comments do
    resources :users
    resources :goals
    resources :categories
  end

  resources :categories do
    resources :users
    resources :goals
  end
  
  namespace :admin do
    resources :stats
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
