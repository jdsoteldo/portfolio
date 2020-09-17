Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  mount Commontator::Engine => '/commontator'

  resources :users do
    resources :posts, except: [:index, :show]
  end

  resources :posts, only: [:index, :show]

  resources :tasks do
    member do
      put 'status'
    end
  end
  resources :posts, param: :slug, only: [:show]
end
