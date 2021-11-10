Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  resource :comment,  only: [:create, :destroy]
end
