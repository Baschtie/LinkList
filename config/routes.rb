Rails.application.routes.draw do
  resources :links
  get 'links/page/:page' => 'links#index'
  devise_for :users
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
