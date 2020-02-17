Rails.application.routes.draw do
  get  'user'       => 'user#show'
  post 'user'       => 'user#create'
  post 'user_token' => 'user_token#create'
  
  resource :cart, only: [:show, :destroy]
  
  resources :categories, controller: :item_categories do
    resources :items, controller: :accessory_items, only: :index
  end
  
  resources :items, controller: :accessory_items do
    member do
      post   'buy' => 'cart_items#create'
      put    'buy' => 'cart_items#update'
      patch  'buy' => 'cart_items#update'
      delete 'buy' => 'cart_items#destroy'
    end
  end
  
  resources :orders, only: [:index, :show, :create]
end
