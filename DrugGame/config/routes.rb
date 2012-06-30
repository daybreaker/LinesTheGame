DrugGame::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  get "account/" => "account#index"
  get "account/index" => "account#index"
  post "account/login" => "account#login"
  get "account/login" => "account#login"
  get "account/registration" => "account#registration"
  post "account/registration" => "account#registration"
  get "account/new_game" => "account#new_game"
  get "account/buy" => "account#buy"
  post "account/buy" => "account#buy"
  get "account/sell" => "account#sell"
  post "account/sell" => "account#sell"
  get "account/travel" => "account#travel"
  post "account/travel" => "account#travel"
  get "account/banking" => "account#bank"
  post "account/banking" => "account#bank"
  get "account/savings" => "account#savings"
  post "account/savings" => "account#savings"
  get "account/loanshark" => "account#loanshark"
  post "account/loanshark" => "account#loanshark"
  get "account/shop" => "account#shop"
  post "account/shop" => "account#shop"
  get "account/buy_gun" => "account#buy_gun"
  post "account/buy_gun" => "account#buy_gun"
  get "account/sell_gun" => "account#sell_gun"
  post "account/sell_gun" => "account#sell_gun"
  get "account/run" => "account#run"
  post "account/run" => "account#run"
  get "account/fight" => "account#fight"
  post "account/fight" => "account#fight"
  get "account/stay" => "account#stay"
  post "account/stay" => "account#stay"
  get "account/hospital" => "account#hospital"
  post "account/hospital" => "account#hospital"
  get "account/healing" => "account#healing"
  post "account/healing" => "account#healing"
  get "account/event_accept" => "account#event_accept"
  post "account/event_accept" => "account#event_accept"
  get "account/event_reject" => "account#event_reject"
  post "account/event_reject" => "account#event_reject"


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
  root :to => "account#index"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
