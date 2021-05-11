Rails.application.routes.draw do
  resources :comments
  resources :categories
  resources :goals do
    resources :comments
    resources :users
  end
  resources :users do
    resources :goals
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
