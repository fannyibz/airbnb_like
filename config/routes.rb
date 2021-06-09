Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard", to: 'pages#dashboard'
  post 'bookings/:id/:', to: 'bookings#unconfirm', as: :unconfirm_booking
  post 'bookings/:id/:', to: 'bookings#confirm', as: :confirm_booking


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :user_contacts
  resources :flats do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [ :show, :edit, :update, :destroy ]

   namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :flats, only: [ :index, :show, :update, :create, :destroy ]
    end
  end

end
