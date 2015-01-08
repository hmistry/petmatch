Rails.application.routes.draw do
  root "pets#index"

  resources :pets, only: [:index, :show]
  resources :shelters, only: [:index, :show]
  resources :imports, only: [:index, :create]

end
