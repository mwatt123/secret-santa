Rails.application.routes.draw do
  resources :santas, param: :token, only: [:show]
end
