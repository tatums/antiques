PhoebeboothanitquesCom2::Application.routes.draw do


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
    end
  end
  devise_for :users 
  
  devise_scope :user do
    get "backend", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
  end
  #match 'admin' => 'admin#index', :as => :admin
  #match 'categories/:title' => 'categories#show'
  
  match 'about' => 'home#about', :as => :about
  match 'search' => 'home#search', :as => :search
  match 'new_acquisitions' => 'home#new_acquisitions', :as => :new_acquisitions
  match 'phoebes_finds' => 'home#phoebes_finds', :as => :phoebes_finds
  match 'subscribe' => 'emails#new', :as => :subscribe
  match 'thank_you' => 'home#thank_you', :as => :thank_you
  match 'contact' => 'contacts#new', :as => :contact
  
  

  resources :products do
    resources :images, :shallow  => true
    resources :measurements, :shallow => true do
      collection do
        post 'sort'
      end      
    end
    collection do
      post 'sort'
    end
  end 
  get "home/index"
  

   root :to => 'home#index'


end
