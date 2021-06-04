Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # profile new created upon user creation therefore new is changed to edit, and create changed to update
  resources :profiles, only: [ :index, :show, :new, :edit, :update ] do
    resources :bookings, only: [ :index, :new, :create ]
  end

  resources :chat_rooms, only: :show do
    resources :messages, only: :create
  end

  get '/booking_requests', to: 'bookings#booking_requests'
  get '/booking_requests/:id', to: 'bookings#accept_booking', as: 'accept_booking'
  post '/booking_requests/:id', to: 'bookings#reject_booking', as: 'reject_booking'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
