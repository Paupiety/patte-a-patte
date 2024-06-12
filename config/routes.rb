Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :addresses

  resources :offers do
    resources :cart_offers, only: %i[create destroy]
    member do
      post 'like', to: 'offers#like', as: 'like'
      delete 'unlike', to: 'offers#unlike', as: 'unlike'
    end
    resources :users, only: [:show]
    collection do
      get 'vente'
      get 'adoption'
      get 'service'
    end
    resources :cart_offers, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :pets, only: [:new, :create, :edit, :update, :destroy]

  root 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'favorites', to: 'users#favorites', as: 'favorites'
  get 'my_offers', to: 'users#my_offers', as: 'my_offers'


  resources :carts, only: [:show]

  #stripe roads
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  get 'contact', to: "static_pages#contact"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
