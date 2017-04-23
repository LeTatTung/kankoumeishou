Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations"
  }
  root "pages#index"
  get "/pages/:page", to: "pages#show"

  resources :users, only: [:show, :edit, :update]

  resources :users, only: [:show]
  resources :images
<<<<<<< HEAD

=======
>>>>>>> fe854935df007a8da07b1912bee37f3dac4787d5
end
