Rails.application.routes.draw do
  get 'overviews/index'
  root to: 'overviews#index'
  resources :machines

  resources :machine_parts do
    collection do
      get 'search'
    end
  end
  resources :stock_parts do
    collection do
      get 'search'
    end
  end

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  } 
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
