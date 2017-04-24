Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations"
  }
  root "pages#index"
  get "/pages/:page", to: "pages#show"

  resources :users, only: [:show, :edit, :update]

  resources :users, only: [:show]
  resources :images
  resources :comments

end
