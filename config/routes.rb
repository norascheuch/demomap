Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#splash'
  get '/dashboard', to: 'pages#dashboard'
  get '/contact', to: 'pages#contact'
  get '/organizers', to: 'pages#organizers'
  get '/tips', to: 'pages#tips'

  resources :demos do
    resources :events, only: [:index, :new, :show, :create, :destroy] do
      resources :comments, only: [:index, :new, :create, :destroy]
    end
    resources :comments, only: [:index, :new, :create, :destroy, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
