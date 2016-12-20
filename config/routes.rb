Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace :api do 
  #   namespace :v1 do 
  #       resources :shibas
  #       resources :matches
  #       resources :users
  #       resources :votes
  #   end 
  # end 
  resources :shibas
  resources :matches do
    resources :votes
  end
  resources :users
end
