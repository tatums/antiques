PhoebeboothanitquesCom2::Application.routes.draw do


  resources :tasks

  resources :contacts, :only => [:new, :create]
  resources :emails
  resources :sliders do
    member do
      post 'toggle'
    end
    collection do
      post 'sort'
    end
  end

  resources :categories do
    member do
      post 'toggle'
    end
    collection do
      post 'sort'
      post 'sort_products'
    end
  end

  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    member do
      get :change_password
    end
  end
  
  devise_scope :user do
    get "backend", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
  end
  
  #Navigation Links
  match 'about' => 'home#about', :as => :about
  match 'search' => 'home#search', :as => :search
  match 'new_acquisitions' => 'home#new_acquisitions', :as => :new_acquisitions
  match 'phoebes_finds' => 'home#phoebes_finds', :as => :phoebes_finds
  match 'subscribe' => 'emails#new', :as => :subscribe
  match 'thank_you' => 'home#thank_you', :as => :thank_you
  #match 'contact' => 'contacts#new', :as => :contact
  match 'contact' => 'home#contact', :as => :contact
  
  resources :products do
    resources :images, :shallow  => true
    resources :keywords, :shallow => true, :only =>[:create, :destroy]
    collection do
      post 'sort'
    end
  end 
  get "home/index"
  
   root :to => 'home#index'


end
