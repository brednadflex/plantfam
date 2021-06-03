Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'search', to: 'pages#search', as: :search

  # profile new created upon user creation therefore new is changed to edit, and create changed to update
  resources :profiles, only: [ :index, :show, :new, :edit, :update ] do
    resources :bookings, only: [ :index, :new, :create ]
    resources :availabilities, except: :show
  end

  resources :bookings, only: [] do
    resources :reviews, only: [:new, :create]
  end

  resources :chat_rooms, only: [:index, :show] do
    resources :messages, only: :create
  end

  resources :users, only: [:index] do
    resources :chat_rooms, only: [:create]
  end

  get '/booking_requests', to: 'bookings#booking_requests'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
