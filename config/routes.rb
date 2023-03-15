Rails.application.routes.draw do

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { registrations: :registrations }

  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/profile", to: 'users#show'
  get "/profile/:id", to: 'users#show', as: "/userprofile/"

  resources :pets, only: %i[new show create edit update destroy] do
    resources :medications, only: %i[index new create]
    resources :pet_carers, only: %i[index new create]
    resources :medication_administrations, only: [:index]
  end

  resources :medications, only: %i[edit update destroy]
  resources :medication_administrations, only: :update
  resources :pet_carers, only: %i[edit update destroy]

  resources :chats, only: %i[index show] do
    resources :messages, only: :create
  end
end
