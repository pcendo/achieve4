Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'scrapbooks/top'
  root :to => 'scrapbooks#top'
  
  resources :places do
    collection do
      post :confirm
      get :list
    end
  end

  #namespace :places do
    # get 'places/list' request
  #  get 'list'
  #end

  resources :albums do
    collection do
      post :confirm
      get  :list
      get  :list2
      get  :index2
      get  :index3
    end
  end

  resources :users, only: [:new, :create, :show, :edit ]
  resources :sessions, only: [:new, :create, :destroy ]
  resources :favorites, only: [:create, :destroy, :index, :show ]

end
