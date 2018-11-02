Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'livres#index'
  resources :livres
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
