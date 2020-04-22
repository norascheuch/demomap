Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#splash'
  get 'dashboard', to: 'pages#dashboard'
  get 'contact', to: 'pages#contact'
  post 'contact', to: 'pages#contact_create'
  get 'organizers', to: 'pages#organizers'
  get 'tips', to: 'pages#tips'

  resources :demos do
    resources :events do
      resources :comments, only: [:index, :new, :create, :destroy]
    end
    resources :comments, only: [:index, :new, :create, :destroy, :update]
    get 'admin', to: 'pages#admin'
    post 'admin', to: 'pages#admin_create'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
