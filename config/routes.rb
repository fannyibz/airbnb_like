Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboard", to: 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :user_contacts

   namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :flats, only: [ :index, :show, :update, :create, :destroy ]
    end
  end

end
