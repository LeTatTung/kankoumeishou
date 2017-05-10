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
  resources :images do
    collection do
      match "search" => "images#search", via: [:get, :post], as: :search
    end
    resources :comments, except: :show
  end
  resources :like_images
  resources :comments do
    resources :reply_comments, except: :show
  end
end
