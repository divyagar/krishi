Rails.application.routes.draw do
  get "/" => "home#index"

  resources :farmers, :buyers, :sessions
end
