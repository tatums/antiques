PhoebeboothanitquesCom2::Application.routes.draw do


  resources :invoices, :except => [:new, :edit] do
    resources :line_items, :only => [:edit, :update, :create, :destroy], :shallow => true
    get '/:product_id' => "invoices#create", :as => 'product_setup'
    post '/:contact_id' => "invoices#create", :as => 'contact_setup'
    post '/line_items/:product_id' => 'line_items#create', :as => 'add_product'
  end

  post 'email_invoice/:invoice_id' => "invoices#email_invoice", :as => 'email_invoice'

  post 'groups/:group_id/contacts/:id' => "contact_groups#create", :as => 'apply_contact_to_group'
  post 'subscribers/:contact_id/groups/:id' => "group_contacts#create", :as => 'apply_group_to_contact'
  delete 'groups/:group_id/contacts/:id' => "contact_groups#destroy", :as => 'remove_contact_from_group'
  delete 'subscribers/:contact_id/groups/:id' => "group_contacts#destroy", :as => 'remove_group_from_contact'

  resources :contacts, :path => 'subscribers'
  resources :groups


  resources :tooltips, :only => [:update], :as => :toggle_tooltips
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
  get 'subscribe' => 'home#subscribe', :as => :subscribe
  post 'subscribe' => 'home#create_contact', :as => :create_contact
  get 'thank_you' => 'home#thank_you', :as => :thank_you
  get 'contact' => 'shows#index', :as => :contact_us

  resources :tasks do
    collection do
      post 'sort'
    end
  end

  root :to => 'home#index'
  #, :constraints => lambda{ |r|
#    binding.pry
#  }

end
