PhoebeboothanitquesCom2::Application.routes.draw do
  

  resources :sliders do
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
  end

  match 'admin' => 'admin#index', :as => :admin
  #match 'categories/:title' => 'categories#show'
  
  match 'about' => 'home#about', :as => :about
  match 'search' => 'home#search', :as => :search
  match 'new_acquisitions' => 'home#new_acquisitions', :as => :new_acquisitions
  match 'phoebes_finds' => 'home#phoebes_finds', :as => :phoebes_finds
  match 'subscribe' => 'home#subscribe', :as => :subscribe
  
  
  resources :categories do
    collection do
      post 'sort'
    end
  end

  resources :products do
    resources :images, :shallow  => true
    resources :measurements, :shallow => true
    collection do
      post 'sort'
    end
  end 
  get "home/index"
  
  get "/:id" => 'categories#show' 
  
  # get "/:id" => "categories#show" do
  #   collection do
  #     post 'sort'
  #   end
  # end
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
