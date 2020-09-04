Rails.application.routes.draw do

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :bikes, :appointments
  end
  resources :users, only:  :create

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
