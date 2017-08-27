Rails.application.routes.draw do
  resources :alerts
  get 'games/decide_game_view' => 'games#decide_game_view', as: :decide_game_view
  resources :games
  resources :game_hitting_stats
  resources :game_pitching_stats
  resources :locations
  resources :players
  get 'welcome/index'

  get 'welcome/about'



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

    match '/keepscore/teams', to: 'keep_scores#preflight', via: [:options]
    get 'keepscore/teams' => 'keep_scores#get_teams', as: :get_teams

    match '/keepscore/roster', to: 'keep_scores#preflight', via: [:options]
    get 'keepscore/roster' => 'keep_scores#get_roster', as: :get_roster

    match '/keepscore/post_game_stats', to: 'keep_scores#preflight', via: [:options]
    post 'keepscore/post_game_stats' => 'keep_scores#post_game_stats', as: :post_game_stats

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
  mount ActionCable.server, at: '/cable'
  root 'welcome#index'
end
