Rails.application.routes.draw do
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
