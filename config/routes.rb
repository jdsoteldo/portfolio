Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  mount Commontator::Engine => '/commontator'
  resources :users do
    resources :posts, except: [:index]
  end
  resources :posts, only: [:index]
  resources :tasks do
    member do
      put 'status'
    end
  end
  get :change_locale, controller: 'application'
  resources :posts, param: :slug, only: [:show]
end
