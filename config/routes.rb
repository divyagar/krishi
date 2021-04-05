Rails.application.routes.draw do
  get "/signout" => "sessions#destroy", as: :destroy_session 
  get "/" => "home#index"
  get "/signup_signin/farmer" => "farmers#new"
  get "/signup_signin/buyer" => "buyers#new"
  get "buy_vegetables/" => "cart_item#new", type: 'Vegetable', as: :vegetable_buy
  get "buy_fruits/" => "cart_item#new", type: 'Fruit', as: :fruits_buy
  get "buy_seeds/" => "cart_item#new", type: 'Seed', as: :seeds_buy

  post "/buy_vegetables/search" => "cart_item#search"
  post "/buy_fruits/search" => "cart_item#search"
  post "/buy_seeds/search" => "cart_item#search"


  resources :farmers, :buyers, :sessions, :cart_item
end
