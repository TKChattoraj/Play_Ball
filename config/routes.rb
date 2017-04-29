Rails.application.routes.draw do
  get 'games/decide_game_view' => 'games#decide_game_view', as: :decide_game_view
  resources :games
  resources :game_hitting_stats
  resources :game_pitching_stats
  resources :locations
  resources :players
  get 'welcome/index'

  get 'welcome/about'

  get '/keep-score/(*path)' => "keep_score#index"


  resources :users do
    resources :players
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :teams do
    resources :notes
  end

  # namespace :api, defaults: {format: :http} do
  namespace :api do
    match '/texts', to: 'texts#preflight', via: [:options]
    resources :texts, only: [:create]
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  root 'welcome#index'
end
