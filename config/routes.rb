Rails.application.routes.draw do
  resources :users, only: :create
  post 'user_token' => 'user_token#create'
end
