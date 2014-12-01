Rails.application.routes.draw do
  root :to => "home#index"

  get 'admin' => 'admin#index'
  get 'admin/developers' => 'admin#developers'
  get 'admin/evaluations' => 'admin#evaluations'
  get 'admin/evaluation' => 'admin#evaluation', param: :id
  get 'admin/materials' => 'admin#materials'
  get 'admin/material' => 'admin#material', param: :id

  devise_for :developers do
    get '/developers/sign_out' => 'devise/sessions#destroy'
  end

  resources :materials

  resources :evaluations do
    get "map", on: :member
    get "apply", on: :member
    get "close", on: :member
    resources :materials
    resources :results
    resources :mappings, only: [:index, :show]
  end
  resources :mappings, only: [:index, :show]
  resources :results
  
  resources :companies, param: :name do
    resources :departments, param: :dname_cname
  end

  resources :career, only: [:index]

  get 'career/search' => 'career#search'

  get 'careers/change_company' => 'career#change_company'
  get 'careers/change_department' => 'career#change_department'

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
end
