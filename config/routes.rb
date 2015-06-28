Rails.application.routes.draw do


  get 'admin/index', to: 'admin#index', as: 'admin'

  get 'users/index', to: 'users#index', as: 'users'

  get 'home/index', to: 'home#index', as: 'home'

  get 'p/case', to: 'p#case', as: 'case'

  get 'p/about', to: 'p#about', as: 'about'

  get 'p/service', to: 'p#service', as: 'service'

#  get 'users', to: 'users/index', as: 'users'

  get 'jobs/last', to: 'jobs#last', as: 'lastjob'
  resources :jobs

  resources :companies
  devise_for :jobposters
  resources :companies
  namespace :admin do
    namespace :setting do
      resources :job_titles
    end
  end
  namespace :admin do
    namespace :setting do
      resources :industries
    end
  end
  namespace :admin do
    namespace :setting do
      resources :experiences
    end
  end
  namespace :admin do
    namespace :setting do
      resources :educations
    end
  end
  namespace :admin do
    namespace :setting do
      resources :cities
    end
  end
  namespace :admin do
    namespace :setting do
      resources :provinces
    end
  end
#  devise_for :users
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'

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
