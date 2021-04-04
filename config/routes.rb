Rails.application.routes.draw do
  get "/" => "home#index"
  get "/signup_signin/farmer" => "farmers#new"
  get "/signup_signin/buyer" => "buyers#new"
  get "buy_vegetables/" => "cart_item#new", type: 'vegetables'
  get "buy_fruits/" => "cart_item#new", type: 'fruits'
  get "buy_seeds/" => "cart_item#new", type: 'seeds'

  resources :farmers, :buyers, :sessions, :cart_item
end
