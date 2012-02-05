PhoebeboothanitquesCom2::Application.routes.draw do

  resources :invoices do
    resources :line_items, :only => [:create, :destroy], :shallow => true
  end

  get 'invoice/new/:product_id' => "invoices#new", :as => 'setup_new_invoice'
  post 'invoice/:product_id' => "invoices#create", :as => 'setup_invoice'

  resources :subscribers, :tasks
  resources :shows, :only =>  [:index, :create, :destroy] do
    collection do
      post 'sort'
    end
  end
  resources :sliders, :except => [:show] do
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

  resources :users, only: [:edit, :update]
  resources :sessions, only: [:new, :create, :destroy]

  get "change_password" => "users#edit", :as => "change_password"

  get "log_in" => "sessions#new", :as => "login"
  get "login" => "sessions#new", :as => "login"
  get "log_out" => "sessions#destroy", :as => "logout"
  get "logout" => "sessions#destroy", :as => "logout"
  get "backend" => "sessions#new", :as => "backend"
  get 'print/:id' => "prints#show", :as => 'print'

  #Navigation Links
  match 'about' => 'home#about', :as => :about
  match 'search' => 'home#search', :as => :search
  match 'new_acquisitions' => 'home#new_acquisitions', :as => :new_acquisitions
  match 'phoebes_finds' => 'home#phoebes_finds', :as => :phoebes_finds
  match 'subscribe' => 'subscribers#new', :as => :subscribe
  match 'thank_you' => 'home#thank_you', :as => :thank_you
  match 'contact' => 'shows#index', :as => :contact

  resources :products do
    resources :images, :shallow  => true, :only =>[:create, :destroy]
    resources :keywords, :shallow => true, :only =>[:create, :destroy]
    collection do
      post 'sort'
    end
  end
  get "home/index"

  root :to => 'home#index'


end
