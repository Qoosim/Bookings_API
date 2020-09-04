Rails.application.routes.draw do

  # scope module: :v1, constraints: ApiVersion.new('v1', true) do
  #   resources :bikes, :appointments
  # end
  concern :api_base do
    resources :bikes, :appointments
  end
  namespace :v1 do
    concerns :api_base
  end
  resources :users, only:  :create
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  mount Raddocs::App => "/api_docs"
end
