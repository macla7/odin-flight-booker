Rails.application.routes.draw do
  get 'bookings', to: 'bookings#new'
  post 'bookings', to: 'bookings#create'
  get '/bookings/:id', to: 'bookings#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flights

  root 'flights#index'
end
