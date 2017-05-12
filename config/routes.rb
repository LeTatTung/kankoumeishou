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
    resources :comments, except: :show
  end
  resources :like_images
  resources :comments do
    resources :reply_comments, except: :show
  end
  resources :popular_images, only: :index
  resources :searches, only: :index
end
