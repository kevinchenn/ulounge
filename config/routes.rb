Ulounge::Application.routes.draw do
  devise_for :admins

  resources :admins

  devise_for :users
  
  resources :users

  resources :lounges do
    collection do
      get 'like'
      get 'unlike'
      get 'like_onpage'
      get 'unlike_onpage'
    end
  end

  resources :comments
  resources :likes
  resources :ratings
  
  resources :posts do
    collection do
      get 'like'
      get 'unlike'
      get 'add_link'
    end
  end
    
  match 'bucketlist' => 'lounges#show', :defaults => { :id => 1 }, :as => 'bucketlist'
  match 'coachella' => 'lounges#show', :defaults => { :id => 2 }, :as => 'coachella'
  
  match 'about' => 'pages#about', :as => 'about'
  match 'lounge_list' => 'pages#lounge_list', :as => 'lounge_list'
  
  #match 'posts#like', :as => like

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
  root :to => 'lounges#show', :defaults => { :id => 2 }
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
