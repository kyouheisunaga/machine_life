Rails.application.routes.draw do
  devise_for :users
  root to: 'machine_parts#index'
  resources :machine_parts
  resources :stock_parts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
