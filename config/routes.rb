PhoebeboothanitquesCom2::Application.routes.draw do

  resources :shows, :subscribers, :tasks

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

  #:users
  resources :users, only: [:edit, :update]
  resources :sessions
  
  get "change_password" => "users#edit", :as => "change_password"
  
  get "log_in" => "sessions#new", :as => "login"
  get "log_out" => "sessions#destroy", :as => "logout"
  get "backend" => "sessions#new", :as => "backend"
  
  #Navigation Links
  match 'about' => 'home#about', :as => :about
  match 'search' => 'home#search', :as => :search
  match 'new_acquisitions' => 'home#new_acquisitions', :as => :new_acquisitions
  match 'phoebes_finds' => 'home#phoebes_finds', :as => :phoebes_finds
  match 'subscribe' => 'subscribers#new', :as => :subscribe
  match 'thank_you' => 'home#thank_you', :as => :thank_you
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
