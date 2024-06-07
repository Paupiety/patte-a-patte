Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :offers do
    member do
      post 'like', to: 'offers#like', as: 'like'
      delete 'unlike', to: 'offers#unlike', as: 'unlike'
    end
    collection do
      get 'vente'
      get 'adoption'
      get 'service'
    end
    resources :cart_offers, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  devise_for :users
  resources :users, only: [:show, :new, :create, :edit, :update]
  get 'static_pages/accueil'
  root 'static_pages#accueil'

  resources :carts, only: [:show]

  #stripe roads
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
