Rails.application.routes.draw do
  resources :stockpiles, only: [:create, :update, :index, :show]
  resources :users, only: [:create]
  resources :projects, only: [:create, :index, :show] do
    resources :comments, only: [:create, :index]
  end
  post '/login', to: 'sessions#create'
  get '/authorize', to: 'sessions#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
