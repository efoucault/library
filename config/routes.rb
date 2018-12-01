Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'livres#index'
  resources :livres do
    resources :emprunts
  end
  resources :users
  get 'emprunts' => 'emprunts#index', as: :emprunts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
