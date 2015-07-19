Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
   root 'home#index'

  #  post 'applications/create'
  resources :applications, only: [:index, :create] do
    post 'set_read'
  end

  get 'logined/user', as: 'user_logined'

  resources :ads

  get 'my_info/index', to: 'my_info#index', as: 'myInfo'
  get 'my_info/resumes', to: 'my_info#resumes', as: 'my_resumes'
  get 'my_info/favorites', to: 'my_info#favorites', as: 'my_favorites'
  get 'my_info/applications', to: 'my_info#applications', as: 'my_applications'

  get 'resume/index'

  get 'uploader/img'

  resources :case_companies
  resources :case_users
  get 'admin/index', to: 'admin#index', as: 'admin'

  get 'users/index', to: 'users#index', as: 'users'
  delete 'users/delete', to: 'users#destroy', as: 'user_delete'

  get 'home/index', to: 'home#index', as: 'home'

  get 'p/case', to: 'p#case', as: 'case'

  get 'p/about', to: 'p#about', as: 'about'

  get 'p/service', to: 'p#service', as: 'service'
  get 'p/uptoken', to: 'p#uptoken'
  post 'resume/create', to: 'resume#create'
  delete 'resume/delete', to: 'resume#destroy'
  post 'resume/set_default', to: 'resume#set_default'
  
  get 'jobs/last', to: 'jobs#last', as: 'lastjob'
  resources :jobs

  resources :companies
  devise_for :jobposters
  # resources :companies

  namespace :admin do
    namespace :setting do
      resources :job_titles
      resources :industries
      resources :experiences
      resources :educations
      resources :cities
      resources :provinces
      resources :jobposters, only: [:index, :edit, :update, :destroy]
    end
  end

  #  devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get 'show_resumes', to: 'users#show_resumes', as: 'show_resumes'
  post 'save_favorite_job', to: 'users#save_favorite_job', as: 'save_favorite_job'
  delete 'delete_favorite_job', to: 'users#delete_favorite_job', as: 'delete_favorite_job'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
