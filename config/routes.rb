Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :ideas
  end

  namespace :admin do
    resources :categories
    resources :users
    resources :images
  end

  resources :categories, only: [:show, :index]
  resources :images, only: [:index, :show]

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/',          to: 'dashboard#show'
end
