PhoebeboothanitquesCom2::Application.routes.draw do

  resources :invoices do
    resources :line_items, :only => [:create, :destroy], :shallow => true
    #resources :subscribers
    # member do
    #   match 'subscribers/:subscriber_id' => "invoices#update", :as => 'update_subscriber'
    # end
  end
  post 'invoice/:invoice_id/line_items/:product_id' => 'line_items#create', :as => 'add_product_to_invoice'
  get 'invoice/new/:product_id' => "invoices#new", :as => 'setup_new_invoice'
  post 'invoice/:product_id' => "invoices#create", :as => 'setup_invoice'

  post 'email_invoice/:invoice_id' => "invoices#email_invoice", :as => 'email_invoice'


  resources :subscribers

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


  resources :products do
    resources :images, :shallow  => true, :only =>[:create, :destroy]
    resources :keywords, :shallow => true, :only =>[:create, :destroy]
    collection do
      post 'sort'
    end
  end
  get "home/index"

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
  get 'about' => 'home#about', :as => :about
  get 'search' => 'home#search', :as => :search
  get 'new_acquisitions' => 'home#new_acquisitions', :as => :new_acquisitions
  get 'phoebes_finds' => 'home#phoebes_finds', :as => :phoebes_finds
  get 'subscribe' => 'subscribers#new', :as => :subscribe
  get 'thank_you' => 'home#thank_you', :as => :thank_you
  get 'contact' => 'shows#index', :as => :contact

  resources :tasks
  root :to => 'home#index'

end
