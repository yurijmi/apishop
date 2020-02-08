Rails.application.routes.draw do
  get  'user'       => 'user#show'
  post 'user'       => 'user#create'
  post 'user_token' => 'user_token#create'
end
