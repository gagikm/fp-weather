Rails.application.routes.draw do
  root controller: :locations, action: :index

  resources :locations, only: %i[index show]
  resources :admin, only: %i[index create destroy]
end
