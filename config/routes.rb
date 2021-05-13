Rails.application.routes.draw do
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'
get '/auth/facebook/callback' => 'sessions#create'
#get '/auth/facebook'

  resources :goals
  post '/goals/new', to: 'goals#create'
  post '/comments/new', to: 'comments#create'
  #post '/goals/comments/new', to 'comments#create'

  resources :goals do
    resources :comments
    resources :users
  end

  resources :users do
    resources :goals
  end

  resources :comments
  resources :categories
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
