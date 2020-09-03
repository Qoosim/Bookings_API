Rails.application.routes.draw do
  resources :users, :bikes

  post 'signup', to: 'users#create'
  post 'auth/login', to: 'authentication#authenticate'
end
