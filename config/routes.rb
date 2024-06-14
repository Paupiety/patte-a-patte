Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Addresses postales
  resources :addresses

  # Annonces
  resources :offers, path:'annonces', path_names: {new: 'ajouter', edit: 'modifier'} do
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
    resources :comments, only: [:create, :destroy]
  end

  # Devise utilisateurs
  devise_for :users, controllers: { registrations: 'users/registrations' } do
  end

  # Utilisateurs (modifier)
  resources :users, only: [:show, :edit, :update], path:'compte', path_names: {edit: 'modifier'}

  # Animaux de l'utilisateur
  resources :pets, only: [:new, :create, :edit, :update, :destroy], path:'animaux', path_names: {new: 'ajouter', edit: 'modifier'}

  #Pages statiques
  root 'static_pages#home'
  get 'a-propos', to: 'static_pages#about', as: 'about'
  get 'contact', to: "static_pages#contact"

  # Page spécifique pour l'utilisateur
  get 'favoris', to: 'users#favorites', as: 'favorites'
  get 'mes-annonces', to: 'users#my_offers', as: 'my_offers'
  get 'compte', to: 'static_pages#profil', as: 'profil'

  resources :carts, only: [:show], path: 'trouvailles'

  #Stripe
  scope '/checkout' do
    post 'créer', to: 'checkout#create', as: 'checkout_create'
    get 'succes', to: 'checkout#success', as: 'checkout_success'
    get 'annule', to: 'checkout#cancel', as: 'checkout_cancel'
  end


  get "up" => "rails/health#show", as: :rails_health_check
end
