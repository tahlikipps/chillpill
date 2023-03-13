Rails.application.routes.draw do
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/profile", to: 'users#show'

  resources :pets, only: %i[new show create edit update destroy] do
    resources :medications, only: %i[index new create]
  end
  resources :medications, only: %i[edit update destroy]
  resources :medication_administrations, only: :update
end
