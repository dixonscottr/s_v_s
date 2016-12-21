Rails.application.routes.draw do
  resources :shibas, only: [:index, :create, :show, :destroy]
  resources :matches, only: [:index, :create, :show, :destroy] do
    resources :votes, only: [:index, :create, :show, :destroy]
  end
  resources :users, only: [:create, :show, :destroy]
  post 'authenticate', to: 'authentication#authenticate'
end
