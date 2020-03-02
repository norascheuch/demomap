Rails.application.routes.draw do
  get 'comments/new'
  get 'events/index'
  get 'events/new'
  devise_for :users

  root to: 'pages#splash'
  get '/dashboard', to: 'pages#dashboard'

  resources :demos do
    resources :events, only: [:index] do
      resources :comments, only: [:index, :new, :create]
    end
    resources :comments, only: [:index, :new, :create]
  end

  resources :events, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
