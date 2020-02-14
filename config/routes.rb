Rails.application.routes.draw do
  get  'user'       => 'user#show'
  post 'user'       => 'user#create'
  post 'user_token' => 'user_token#create'
  
  resource :cart, only: [:show, :destroy]
  
  resources :categories, controller: :item_categories, only: [:index, :show] do
    resources :items, controller: :accessory_items, only: :index
  end
  
  resources :items, controller: :accessory_items
end
