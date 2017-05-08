Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "registrations"
  }
  root "pages#index"
  get "/pages/:page", to: "pages#show"

  resources :users do
    resources :relationships, only: :index
  end
  resources :relationships, only: [:create, :destroy]
  resources :images
  resources :comments
  resources :like_images
end
