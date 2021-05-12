Rails.application.routes.draw do

get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
#post '/logout', to: 'sessions#destroy'

  resources :goals

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
