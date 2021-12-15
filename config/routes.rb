Rails.application.routes.draw do
  get 'friend_requests/new'
  get 'friend_requests/create'
  get 'friend_requests/edit'
  get 'friend_requests/update'
  devise_for :users

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end

  resources :profiles, only: [:index]
  get 'profiles/:username', to: 'profiles#show', as: :profile do 
    resources :friend_requests, only: [:create, :update]
  end

  resources :photos, only: [:index, :show, :new, :create, :destroy]

  resources :comments, only: [:create, :edit, :update, :destroy]

  root 'photos#index'

  get '*path', to: 'photos#index', constraints: lambda { |req| req.path.exclude? 'rails/active_storage' }
end
