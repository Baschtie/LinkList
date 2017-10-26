Rails.application.routes.draw do
  get 'users/list'
  get 'users/list/:page' => 'users#list'
  get 'users/view'
  get 'users/view/:id' => 'users#view'

  resources :tags
  get 'tags/page/:page' => 'tags#index'

  resources :links
  get 'links/page/:page' => 'links#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
