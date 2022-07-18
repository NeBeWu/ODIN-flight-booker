Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'flights', to: 'flights#index'
  get 'booking/new'
  get 'booking/create'

  # Defines the root path route ("/")
  root 'flights#index'
end
